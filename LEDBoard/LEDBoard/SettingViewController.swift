//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by juhoon lee on 2023/01/13.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        if let ledText = self.ledText{
            self.textField.text = ledText
        }
        self.changeTextColor(color: textColor)
        self.changeBackgroundColorButton(color: backgroundColor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton{
            self.textColor = .yellow
            self.changeTextColor(color: .yellow)
        }else if sender == self.purpleButton{
            self.textColor = .purple
            self.changeTextColor(color: .purple)
        }else{
            self.textColor = .green
            self.changeTextColor(color: .green)
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton{
            self.backgroundColor = .black
            self.changeBackgroundColorButton(color: .black)
        }else if sender == self.blueButton{
            self.backgroundColor = .blue
            self.changeBackgroundColorButton(color: .blue)
        }else{
            self.backgroundColor = .orange
            self.changeBackgroundColorButton(color: .orange)
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(text: self.textField.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColorButton(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
