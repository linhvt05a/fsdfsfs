
import Foundation
import RxCocoa
import RxSwift
import Combine
import Alamofire

enum METHOD {
    case POST
    case PUT
    case GET
    case PATCH
    case DELETE
}
class CallService {
    func fetData (url: String, method: METHOD, params:[String : Any]?){
        let session = URLSession.shared
                let url = url
                let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
                request.httpMethod = "\(method)"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                do{
                    request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
                    let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                        if let response = response {
                            let nsHTTPResponse = response as! HTTPURLResponse
                            let statusCode = nsHTTPResponse.statusCode
                            print ("status code = \(statusCode)")
                        }
                        if let error = error {
                            print ("\(error)")
                        }
                        if let data = data {
                            do{
                                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                                print ("data = \(jsonResponse)")
                            }catch _ {
                                print ("OOps not good JSON formatted response")
                            }
                        }
                    })
                    task.resume()
                }catch _ {
                    print ("Oops something happened buddy")
                }
    }
    func simpleGetUrlRequest(url: String, method: METHOD, params:[String : Any]) -> Observable<[LoginModel]>{
        return Observable.create { (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: URL(string: url)!) {(data, response, error) in
                    guard let data = data else {
                        observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                        return
                    }
                do {
                    let response = try JSONDecoder().decode([LoginModel].self, from: data)
                    observer.onNext(response)
                } catch {
                    observer.onError(error)
                }
        }
           
                task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
        
}
}

class Service {
    var fetch = CallService()
    func fetchingLogin(username: String, password:String){
        let userLocal = UserDefaults.standard.string(forKey: "username")
        let passLocal =  UserDefaults.standard.string(forKey: "password")
        if userLocal == username && passLocal == password{
            let params = ["username": username, "password" :password]
            fetch.fetData(url: baseURL.apiLogin, method: .POST, params: params)
        }
    }
    
    func saveLocal (username: String, password: String){
        UserDefaults.standard.setValue(username, forKey: "username")
        UserDefaults.standard.setValue(password, forKey: "password")
    }
}

class APIServices {
    private init() {}
    static let instance = APIServices()
    func getData<T: Decodable, E: Decodable>(url: String, method: HTTPMethod ,params: Parameters?, encoding: ParameterEncoding ,completion: @escaping (T?, E?, Error?)->()) {
        
        AF.request(url, method: method, parameters: params, encoding: encoding)
            .validate(statusCode: 200...300)
            .responseJSON { (response) in
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        completion(jsonData, nil, nil)
                    } catch let jsonError {
                        print(jsonError)
                    }
                    
                case .failure(let error):
                    // switch on Error Status Code
                    guard let data = response.data else { return }
                    guard let statusCode = response.response?.statusCode else { return }
                    switch statusCode {
                    case 400..<500:
                        do {
                            let jsonError = try JSONDecoder().decode(E.self, from: data)
                            completion(nil, jsonError, nil)
                        } catch let jsonError {
                            print(jsonError)
                        }
                    default:
                        completion(nil, nil, error)
                    }
                }
        }
    }
}
