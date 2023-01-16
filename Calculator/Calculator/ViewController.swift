//
//  ViewController.swift
//  Calculator
//
//  Created by Gunter on 2021/08/23.
//

import UIKit

enum Operation{
    case Add
    case Subtract
    case Divide
    case Multiply
    case unKnown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unKnown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapEqualButton(_ sender: Any) {
        self.operation(self.currentOperation)
    }
    @IBAction func tapAddButton(_ sender: Any) {
        self.operation(.Add)
    }
    @IBAction func tapSubtractButton(_ sender: Any) {
        self.operation(.Subtract)
    }
    @IBAction func tapMultiplyButton(_ sender: Any) {
        self.operation(.Multiply)
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapDotButton(_ sender: Any) {
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0.": "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unKnown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else {return}
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text! = self.displayNumber
        }
    }
    
    func operation(_ operation: Operation){
        if self.currentOperation != .unKnown{
            if !self.displayNumber.isEmpty{
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else {return}
                
                switch self.currentOperation{
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0{
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        }else{
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}


