//
//  LoginViewController.swift
//  SpotifyLoginApp
//
//  Created by juhoon lee on 2023/03/16.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var emailLoginButton: UIButton!
    
    // 뷰 컨트롤러가 생성될 때 한 번만 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    // 뷰가 화면에 나타날 때마다 호출
    override func viewWillAppear(_ animated: Bool) {
        // 로그인 화면은 첫 화면이기 때문에 화면에서 네비게이션 바가 안 보이게 설정함
        navigationController?.navigationBar.isHidden = true
        
        //Google Sign In
        GIDSignIn.sharedInstance().presentingViewController = self
    }
    
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        // firebase 인증
    }
}
