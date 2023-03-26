//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by juhoon lee on 2023/03/26.
//

import Lottie
import UIKit

class CardDetailViewController: UIViewController {
    
    var promotionDetail: PromotionDetail?
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    @IBOutlet weak var benefitDateLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LottieAnimationView(name: "money")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        lottieView.frame = lottieView.bounds
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 0.5
        lottieView.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let detail = promotionDetail else {return}
        
        titleLabel.text = """
                            \(detail.companyName)카드 쓰면
                            \(detail.amount)만원 드려요
                            """
        periodLabel.text = detail.period
        conditionLabel.text = detail.condition
        benefitConditionLabel.text = detail.benefitCondition
        benefitDetailLabel.text = detail.benefitDetail
        benefitDateLabel.text = detail.benefitDetail
    }
}
