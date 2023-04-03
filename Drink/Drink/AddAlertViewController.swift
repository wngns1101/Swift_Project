//
//  addAlertViewController.swift
//  Drink
//
//  Created by juhoon lee on 2023/04/03.
//

import UIKit

class AddAlertViewController: UIViewController {
    var pickedDate: ((_ date: Date)-> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true)
    }
    
}
