//
//  NoticeViewController.swift
//  Notice
//
//  Created by juhoon lee on 2023/03/30.
//

import UIKit

class NoticeViewController: UIViewController {
    var noticeContents: (title: String, detail: String, date: String)?
    
    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noticeView.layer.cornerRadius = 6
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        guard let noticeContents = noticeContents else {return}
        titleLabel.text = noticeContents.title
        detailLabel.text = noticeContents.detail
        dateLabel.text = noticeContents.date
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
