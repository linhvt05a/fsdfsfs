
import Foundation

enum NetworkingError: Error {
    case badUrl
    case badResponse
    case badEncoding
}
enum MyResult<T, E: Error> {
    
    case success(T)
    case failure(E)
}

class NetworkingService {
    
    let baseUrl = "https://api.github.com/search"

    
    func request(endpoint: String,
                 parameters: [String: Any],
                 completion: @escaping (Result<ResultModel, Error>) -> Void) {
        
        guard let url = URL(string: baseUrl + endpoint) else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        
        var components = URLComponents()
        
        var queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            
            let queryItem = URLQueryItem(name: key, value: String(describing: value))
            queryItems.append(queryItem)
        }
        
        components.queryItems = queryItems
        
        // username=kiloloco&password=pass123
        let queryItemData = components.query?.data(using: .utf8)
        
        request.httpBody = queryItemData
        request.httpMethod = "GET"
    
        handleResponse(for: request, completion: completion)
    }
    
    
    func handleResponse(for request: URLRequest,
                        completion: @escaping (Result<ResultModel, Error>) -> Void) {
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            DispatchQueue.main.async {
                
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                
                print(unwrappedResponse.statusCode)
                
                switch unwrappedResponse.statusCode {
                    
                case 200 ..< 300:
                    print("success")
                    
                default:
                    print("failure")
                }
                
                if let unwrappedError = error {
                    completion(.failure(unwrappedError))
                    return
                }
               
                
                if let unwrappedData = data {

                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                      
                        if let listResult = try? JSONDecoder().decode(ResultModel.self, from: unwrappedData) {
                            completion(.success(listResult))

                        } else {
                            let errorResponse = try JSONDecoder().decode(ErrorModel.self, from: unwrappedData)
                          
                            completion(.failure(errorResponse))
                        }

                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
        
        task.resume()
    }
}
