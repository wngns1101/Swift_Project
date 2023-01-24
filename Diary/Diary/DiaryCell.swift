//
//  DiaryCell.swift
//  Diary
//
//  Created by juhoon lee on 2023/01/19.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 3.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
}
