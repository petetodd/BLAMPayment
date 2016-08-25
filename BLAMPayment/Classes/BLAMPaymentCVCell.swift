//
//  BLAMPaymentCVCell.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit
import PassKit

protocol BLAMPaymentCVCellProtocol {
    func payApple(codeISO: String, amount: NSNumber)
    func payOther(codeISO: String, amount: NSNumber)
}

class BLAMPaymentCVCell: UICollectionViewCell {
    var delegate: BLAMPaymentCVCellProtocol! = nil
    var model: BLAMPaymentItemModel!

    @IBOutlet weak var lblIcon: UILabel!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var tvDesc: UITextView!
    
    @IBOutlet weak var lblText1: UILabel!
    
    @IBOutlet weak var lblText2: UILabel!
    
    @IBOutlet weak var lblText3: UILabel!
    
    @IBOutlet weak var lblText4: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    @IBOutlet weak var viewPayFrame: UIView!
    
    @IBOutlet weak var butOtherPayOptions: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configView(){
        lblIcon.text = "\u{f015}"
    }

    @IBAction func butOtherAction(sender: AnyObject) {
        delegate.payOther(model.codeISO, amount: model.price)
    }
    
    func butApplePAyAction(){
        delegate.payApple(model.codeISO, amount: model.price)

    }
}
