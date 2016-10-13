//
//  BLAMPaymentItemProtocol.swift
//  Pods
//
//  Created by Peter Todd Air on 23/08/2016.
//
//

import Foundation

protocol BLAMPaymentItemProtocol
{
    var awesomeIcon: String {get set}
    var strTitle: String {get set} // read write, should be a var in implmentation
    var strDesc: String {get set}
    var text1: String {get set}
    var text2: String {get set}
    var text3: String {get set}
    var text4: String {get set}
    var textPrice: String {get set}

}
