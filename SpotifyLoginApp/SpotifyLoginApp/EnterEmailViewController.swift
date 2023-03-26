//
//  EnterEmailViewController.swift
//  SpotifyLoginApp
//
//  Created by juhoon lee on 2023/03/16.
//

import UIKit
import FirebaseAuth

class EnterEmailViewController: UIViewController{
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //navigation bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //Firebase 이메일/비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password){[weak self] authResult, error in
            // self 변수가 nil인지 확인하고 nil이면 반환
            // self가 참조하는 객체가 해제 되었을 때 self는 nil이 되고 nil값으로 인한 예기치 않은 오류를 사전에 방지한다.
            guard let self = self else {return}
            
            if let error = error{
                let code = (error as NSError).code
                switch code {
                    case 17007: // 이미 가입한 계정일 때
                        self.loginuser(withEmail: email, password: password)
                    default:
                        self.errorMessageLabel.text = error.localizedDescription
                }
            }else{
                self.showMainViewController()
            }
        }
    }
    
    private func showMainViewController(){
        // Main 이름의 스토리보드를 가져온다.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // MainViewController 식별자를 가진 뷰컨트롤러 인스턴스를 생성한다.
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        
        // 전체화면으로 모달 형식으로 전환한다.
        mainViewController.modalPresentationStyle = .fullScreen
        
        // mainViewController 인스턴스를 표시한다.
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginuser(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){[weak self] _, error in
            guard let self = self else {return}
            
            if let error = error {
                self.errorMessageLabel.text = error.localizedDescription
            }else{
                self.showMainViewController()
            }
        }
    }
}

extension EnterEmailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
