
import UIKit
import RxSwift
import RxCocoa

class SignupView: UIViewController {
    private let signupViewModel = SignupViewModel()
    private let disposeBag = DisposeBag()
    @IBOutlet weak var titlePage: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLabel: UIButton!
    @IBOutlet weak var txtRepassword: UITextField!
    private var isValid = false
    private var service = Service()
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.becomeFirstResponder()
        txtUsername.rx.text.map {$0 ?? ""}.bind(to: signupViewModel.username).disposed(by: disposeBag)
        txtPassword.rx.text.map {$0 ?? ""}.bind(to: signupViewModel.password).disposed(by: disposeBag)
        txtEmail.rx.text.map {$0 ?? ""}.bind(to: signupViewModel.email).disposed(by: disposeBag)
        txtRepassword.rx.text.map {$0 ?? ""}.bind(to: signupViewModel.rePass).disposed(by: disposeBag)
        
        signupViewModel.isValidUserRegister().bind(to: btnLabel.rx.isEnabled).disposed(by: disposeBag)
        signupViewModel.isValidUserRegister().map{$0 ? 1 : 0.1}.bind(to: btnLabel.rx.alpha).disposed(by: disposeBag)
        signupViewModel.isValidUserRegister().subscribe(onNext: {[weak self] isValid in
            self?.isValid = isValid
        }).disposed(by: disposeBag)
    }
    
    @IBAction func LoginSignup(_ sender: Any) {
        if isValid {
            service.saveLocal(username: txtUsername.text!, password: txtPassword.text!)
            self.navigate()
        }
    }
    

    func navigate () {
        let loginView = storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginView
        loginView.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(loginView, animated: true)
    }
}
