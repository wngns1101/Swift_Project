//
//  SuguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by juhoon lee on 2023/01/10.
//

import UIKit

class SuguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
