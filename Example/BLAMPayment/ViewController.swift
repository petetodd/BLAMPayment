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
    
 //  override func viewDidLayoutSubviews() {
  //  }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        viewBLAMPayment.configAll()
    }

    //MARK: - BLAMPaymentCVView
    
    //MARK: BLAMPaymentCVViewProtocol
    
    func payWithApplePay(codeISO: String, amount: NSNumber){
        let message = "The user would like to enroll using apple pay at a cost of \(codeISO)\(amount).  You need to implement this!"
        let alert = UIAlertController(title: "Pay with apple pay",
                                      message: message,
                                      preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert, animated: true, completion: nil)

        
    }
    func payWithOtherPay(codeISO: String, amount: NSNumber){
        let message = "The user would like to enroll using another method of payment at a cost of \(codeISO)\(amount).  You need to implement this!"
        let alert = UIAlertController(title: "Pay with Other Payment method",
                                      message: message,
                                      preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func cancelSub(){
        let message = "The user would like to cancel subscription.  You need to implement this!"
        let alert = UIAlertController(title: "Cancel Subscription",
                                      message: message,
                                      preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert, animated: true, completion: nil)

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
        var valDisplayOrder = "1"
        var valAwesomeIcon = "fa-home"
        var valTitle = "Single user"
        var valDesc = "Description about some single user stuff."
        var valText1 = "Single Asset"
        var valText2 = "1 - User"
        var valText3 = "No team sharing"
        
        var valText4 = "No client sharing"
        var valTextPrice = "FREE"
        var valPrice = NSNumber(double: 0)
        var valCurrCode = "USD"
        
        var valIsActive = "FALSE"
        var valDateRenew = NSDate()

        
        
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode, "isActive": valIsActive, "dateRenew": valDateRenew ]
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 2 - a micro team subscription
        dictData.removeAll()
        valDisplayOrder = "2"
        valAwesomeIcon = "fa-users"
        valTitle = "Micro"
        valDesc = "Description about features for the Micro product."
        valText1 = "5 Users"
        valText2 = "10 Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 25)
        valCurrCode = "USD"
        valIsActive = "TRUE"
        valDateRenew = NSDate()

        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode, "isActive": valIsActive, "dateRenew": valDateRenew ]

        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 3 - a alrge team subscription
        dictData.removeAll()
        valDisplayOrder = "3"
        valAwesomeIcon = "fa-user-plus"
        valTitle = "Team"
        valDesc = "Description about features for the professional team product."
        valText1 = "25 Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 40)
        valCurrCode = "USD"
        valIsActive = "FALSE"
        valDateRenew = NSDate()

        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode, "isActive": valIsActive, "dateRenew": valDateRenew ]

        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 4 - a large team subscription
        dictData.removeAll()
        valDisplayOrder = "4"
        valAwesomeIcon = "fa-bank"
        valTitle = "Corporate"
        valDesc = "Description about features for the corporate product."
        valText1 = "100 Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 100)
        valCurrCode = "USD"
        valIsActive = "FALSE"
        valDateRenew = NSDate()

        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode, "isActive": valIsActive, "dateRenew": valDateRenew ]

        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 5 - a global team subscription
        dictData.removeAll()
        valDisplayOrder = "5"
        valAwesomeIcon = "fa-globe"
        valTitle = "Enterprise"
        valDesc = "Description about features for the Enterprise product."
        valText1 = "Unlimited Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 400)
        valCurrCode = "USD"
        valIsActive = "FALSE"
        valDateRenew = NSDate()

        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode, "isActive": valIsActive, "dateRenew": valDateRenew]


        viewBLAMPayment.addDisplayItem(dictData)

    }


}



