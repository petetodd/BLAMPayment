//
//  BLAMPaymentItemModel.swift
//  Pods
//
//  Created by Peter Todd Air on 23/08/2016.
//
//

import Foundation

class BLAMPaymentItemModel: BLAMPaymentItemProtocol {
    
    var awesomeIcon: String
    var strTitle: String
    var strDesc: String
    var text1: String
    var text2: String
    var text3: String
    var text4: String
    var textPrice: String
    
    init(awesomeIcon: String, strTitle: String, strDesc: String, text1: String, text2: String, text3: String, text4: String, textPrice: String){
        
        self.awesomeIcon = awesomeIcon
        self.strTitle = strTitle
        self.strDesc = strDesc
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
        self.text4 = text4
        self.textPrice = textPrice
    }

}

