//
//  BLAMPaymentCVCell.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit

class BLAMPaymentCVCell: UICollectionViewCell {

    @IBOutlet weak var lblIcon: UILabel!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configView(){
        lblIcon.text = "\u{f015}"
    }

}
