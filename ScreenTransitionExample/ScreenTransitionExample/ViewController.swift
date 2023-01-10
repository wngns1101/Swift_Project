//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by juhoon lee on 2023/01/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapCodePushButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "codePushViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func tabCodePresentButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "codePresentViewController") else { return }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}

