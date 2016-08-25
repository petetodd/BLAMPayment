//
//  BLAMPaymentCVCell.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit
import PassKit

class BLAMPaymentCVCell: UICollectionViewCell {

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

}
