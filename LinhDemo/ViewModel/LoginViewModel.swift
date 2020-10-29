import Foundation
import RxSwift
import RxCocoa
import Combine
import Alamofire

let userLocal = UserDefaults.standard.string(forKey: "username")
let passLocal = UserDefaults.standard.string(forKey: "password")

class LoginViewModel {
    private var loginModelSubject = PublishSubject<LoginModel>()
    let username = PublishSubject<String>()
    let password = PublishSubject<String>()
    private var validate = Constant()
    var loginModelObservable: Observable<LoginModel> {
           return loginModelSubject
    }
    func isValidUserLogin() -> Observable<Bool> {
        return Observable.combineLatest(username.asObservable().startWith(""), password.asObserver().startWith("")).map {( username, password)  in
            return self.validate.validateEmail(username: username) && self.validate.validPassword(password: password) && password.count > 6
        }.startWith(false)
    }
    
    func checkUserLogin () -> Observable<Bool> {
        return Observable.combineLatest(username.asObserver(), password.asObserver()).map { user, password  in
            return userLocal == user && passLocal == password
        }
    }
    
    func fetchingData(username: String, password: String){
        let params: [String: Any] = ["username":username, "password": password]
        APIServices.instance.getData(url: baseURL.apiLogin, method: .post, params: params, encoding: JSONEncoding.default) { (loginModel: LoginModel?, errorModel:ErrorModel? , error) in
            if let error = error {
                // network error
                print(error.localizedDescription)
            } else if let errorModel = errorModel {
                print(errorModel.message ?? "")
            } else {
                guard let loginModel = loginModel else { return }
                self.loginModelSubject.onNext(loginModel)
            }
        }
    }
}

