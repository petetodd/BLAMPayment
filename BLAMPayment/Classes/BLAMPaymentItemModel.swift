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
    var price: NSNumber
    var codeISO: String
    var subRef: String
    var isActive: String
    var dateRenew: NSDate?
    
    init(awesomeIcon: String, strTitle: String, strDesc: String, text1: String, text2: String, text3: String, text4: String, textPrice: String, price : NSNumber, codeISO : String , subRef : String, isActive : String, dateRenew : NSDate?){
        
        self.awesomeIcon = awesomeIcon
        self.strTitle = strTitle
        self.strDesc = strDesc
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
        self.text4 = text4
        self.textPrice = textPrice
        self.codeISO = codeISO
        self.subRef = subRef
        self.price = price
        self.isActive = isActive
        if dateRenew != nil{
            self.dateRenew = dateRenew!
        }else{
            self.dateRenew = nil
        }
    }

}

