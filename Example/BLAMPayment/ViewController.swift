//
//  ViewController.swift
//  BLAMPayment
//
//  Created by Peter Todd on 08/22/2016.
//  Copyright (c) 2016 Peter Todd. All rights reserved.
//

import UIKit
import BLAMPayment

class ViewController: UIViewController, BLAMPaymentCVViewProtocol {
    
 
    @IBOutlet weak var viewBLAMPayment: BLAMPaymentCVView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewBLAMPayment.delegate = self
        configBLAM()
        configBLAMData()

    }
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        viewBLAMPayment.configAll()

    }


    //MARK: - BLAMPaymentCVView
    
    //MARK: BLAMPaymentCVViewProtocol

    func payWithApplePay(subRef: String, codeISO: String, amount: NSNumber){
        let message = "The user would like to enroll for \(subRef) using apple pay at a cost of \(codeISO)\(amount).  You need to implement this!"
        let alert = UIAlertController(title: "Pay with apple pay",
                                      message: message,
                                      preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)

        
    }
    func payWithOtherPay(subRef: String, codeISO: String, amount: NSNumber){
        let message = "The user would like to enroll for \(subRef) using another method of payment at a cost of \(codeISO)\(amount).  You need to implement this!"
        let alert = UIAlertController(title: "Pay with Other Payment method",
                                      message: message,
                                      preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func cancelSub(){
        let message = "The user would like to cancel subscription.  You need to implement this!"
        let alert = UIAlertController(title: "Cancel Subscription",
                                      message: message,
                                      preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        viewBLAMPayment.clearAll()

    }

    
    //MARK: BLAM UI config
    /*
     Set custom colors.
     
     */
    
    func configBLAM(){
        
    }
 

    func configBLAMData(){
        // Dictionary for display Item
        // Item 1 - a single user subscription
        var dictData = Dictionary <String,AnyObject>()
        var subRef = "SINGLE"
        var valDisplayOrder = 1
        var valAwesomeIcon = "\u{f015}"
        var valTitle = "Single user"
        var valDesc = "Description about some single user stuff."
        var valText1 = "Single Asset"
        var valText2 = "1 - User"
        var valText3 = "No team sharing"
        
        var valText4 = "No client sharing"
        var valTextPrice = "FREE"
        var valPrice = NSNumber(value: 0)
        var valCurrCode = "USD"
        
        var valIsActive = "FALSE"
        var valDateRenew = NSDate()

        
        
        
        dictData["displayOrder"] =  valDisplayOrder as AnyObject
        dictData["awesomeIcon"] =  valAwesomeIcon as AnyObject
        dictData["strTitle"] =  valTitle as AnyObject
        dictData["strDesc"] =  valDesc as AnyObject
        dictData["text1"] =  valText1 as AnyObject
        dictData["text2"] =  valText2 as AnyObject
        dictData["text3"] =  valText3 as AnyObject
        dictData["text4"] =  valText4 as AnyObject
        dictData["10"] =  valTextPrice as AnyObject
        dictData["price"] =  valPrice
        dictData["codeISO"] =  valCurrCode  as AnyObject
        dictData["subRef"] =  subRef  as AnyObject
        dictData["isActive"] =  valIsActive  as AnyObject
        dictData["dateRenew"] =  valDateRenew

        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 2 - a micro team subscription
        dictData.removeAll()
        subRef = "MICRO"
        valDisplayOrder = 2
        valAwesomeIcon = "\u{f0c0}"
        valTitle = "Micro"
        valDesc = "Description about features for the Micro product."
        valText1 = "5 Users"
        valText2 = "10 Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(value: 25)
        valCurrCode = "USD"
        valIsActive = "TRUE"
        valDateRenew = NSDate()

        dictData["displayOrder"] =  valDisplayOrder as AnyObject
        dictData["awesomeIcon"] =  valAwesomeIcon as AnyObject
        dictData["strTitle"] =  valTitle as AnyObject
        dictData["strDesc"] =  valDesc as AnyObject
        dictData["text1"] =  valText1 as AnyObject
        dictData["text2"] =  valText2 as AnyObject
        dictData["text3"] =  valText3 as AnyObject
        dictData["text4"] =  valText4 as AnyObject
        dictData["textPrice"] =  valTextPrice as AnyObject
        dictData["price"] =  valPrice
        dictData["codeISO"] =  valCurrCode as AnyObject?
        dictData["subRef"] =  subRef as AnyObject?
        dictData["isActive"] =  valIsActive as AnyObject?
        dictData["dateRenew"] =  valDateRenew
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 3 - a alrge team subscription
        dictData.removeAll()
        valDisplayOrder = 3
        subRef = "TEAM"
        valAwesomeIcon = "\u{f234}"
        valTitle = "Team"
        valDesc = "Description about features for the professional team product."
        valText1 = "25 Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(value: 40)
        valCurrCode = "USD"
        valIsActive = "FALSE"
        valDateRenew = NSDate()
        
        dictData["displayOrder"] =  valDisplayOrder as AnyObject
        dictData["awesomeIcon"] =  valAwesomeIcon as AnyObject
        dictData["strTitle"] =  valTitle as AnyObject
        dictData["strDesc"] =  valDesc as AnyObject
        dictData["text1"] =  valText1 as AnyObject
        dictData["text2"] =  valText2 as AnyObject
        dictData["text3"] =  valText3 as AnyObject
        dictData["text4"] =  valText4 as AnyObject
        dictData["textPrice"] =  valTextPrice as AnyObject
        dictData["price"] =  valPrice
        dictData["codeISO"] =  valCurrCode as AnyObject?
        dictData["subRef"] =  subRef as AnyObject?
        dictData["isActive"] =  valIsActive as AnyObject?
        dictData["dateRenew"] =  valDateRenew
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 4 - a large team subscription
        dictData.removeAll()
        subRef = "CORPORATE"
        valDisplayOrder = 4
        valAwesomeIcon = "\u{f19c}"
        valTitle = "Corporate"
        valDesc = "Description about features for the corporate product."
        valText1 = "100 Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(value: 100)
        valCurrCode = "USD"
        valIsActive = "FALSE"
        valDateRenew = NSDate()

        dictData["displayOrder"] =  valDisplayOrder as AnyObject
        dictData["awesomeIcon"] =  valAwesomeIcon as AnyObject
        dictData["strTitle"] =  valTitle as AnyObject
        dictData["strDesc"] =  valDesc as AnyObject
        dictData["text1"] =  valText1 as AnyObject
        dictData["text2"] =  valText2 as AnyObject
        dictData["text3"] =  valText3 as AnyObject
        dictData["text4"] =  valText4 as AnyObject
        dictData["textPrice"] =  valTextPrice as AnyObject
        dictData["price"] =  valPrice
        dictData["codeISO"] =  valCurrCode as AnyObject?
        dictData["subRef"] =  subRef as AnyObject?
        dictData["isActive"] =  valIsActive as AnyObject?
        dictData["dateRenew"] =  valDateRenew
        
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 5 - a global team subscription
        dictData.removeAll()
        subRef = "ENTERPRISE"
        valDisplayOrder = 5
        valAwesomeIcon = "\u{f0ac}"

        valTitle = "Enterprise"
        valDesc = "Description about features for the Enterprise product."
        valText1 = "Unlimited Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(value: 400)
        valCurrCode = "USD"
        valIsActive = "FALSE"
        valDateRenew = NSDate()

        dictData["displayOrder"] =  valDisplayOrder as AnyObject
        dictData["awesomeIcon"] =  valAwesomeIcon as AnyObject
        dictData["strTitle"] =  valTitle as AnyObject
        dictData["strDesc"] =  valDesc as AnyObject
        dictData["text1"] =  valText1 as AnyObject
        dictData["text2"] =  valText2 as AnyObject
        dictData["text3"] =  valText3 as AnyObject
        dictData["text4"] =  valText4 as AnyObject
        dictData["textPrice"] =  valTextPrice as AnyObject
        dictData["price"] =  valPrice
        dictData["codeISO"] =  valCurrCode as AnyObject?
        dictData["subRef"] =  subRef as AnyObject?
        dictData["isActive"] =  valIsActive as AnyObject?
        dictData["dateRenew"] =  valDateRenew

        viewBLAMPayment.addDisplayItem(dictData)

    }


}



