
import UIKit
import RxSwift
import RxCocoa



class SignupViewModel {
    let username = PublishSubject<String>()
    let email = PublishSubject<String>()
    let password = PublishSubject<String>()
    let rePass = PublishSubject<String>()
    let constant = Constant()
    
    private let callApi = CallService()
    private let save =  Service()
    func isValidUserRegister() -> Observable<Bool> {
        return Observable.combineLatest(
            username.asObservable().startWith(""),
            email.asObserver().startWith(""),
            password.asObserver().startWith(""),
            rePass.asObserver().startWith(""))
            .map {( username, email, password, rePass)  in
            return self.constant.validateEmail(username: email) && self.constant.validPassword(password: password) && password.count > 6 && rePass == password
        }.startWith(false)
    }
    
    func userSignup(name: String, email:String, password: String){
        save.saveLocal(username: email, password: password) 
    }
}
