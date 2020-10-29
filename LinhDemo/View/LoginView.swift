//
//  LoginView.swift
//  HaloApp
//
//  Created by admin on 10/20/20.
//

import UIKit
import RxCocoa
import RxSwift

class LoginView: UIViewController {
    private let disposeBag = DisposeBag()
    @IBOutlet weak var titlePage: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLabel: UIButton!
    private let loginViewModel = LoginViewModel()
    private var isValid = false
    private var userValid = false
    private var service = Service()
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUsername.becomeFirstResponder()
        tfUsername.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.username).disposed(by: disposeBag)
        tfPassword.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.password).disposed(by: disposeBag)
        loginViewModel.isValidUserLogin().bind(to: btnLabel.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValidUserLogin().map{$0 ? 1 : 0.1}.bind(to: btnLabel.rx.alpha).disposed(by: disposeBag)
        loginViewModel.isValidUserLogin().subscribe(onNext:{[weak self] isValid in
            self?.isValid = isValid
        }).disposed(by: disposeBag)
        loginViewModel.checkUserLogin().subscribe(onNext:{[weak self] isValidUser in
            self?.userValid = isValidUser
        }).disposed(by: disposeBag)
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
            service.fetchingLogin(username: tfUsername.text!, password: tfPassword.text!)
        
    }
    
}
