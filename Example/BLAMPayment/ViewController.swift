//
//  ViewController.swift
//  BLAMPayment
//
//  Created by Peter Todd on 08/22/2016.
//  Copyright (c) 2016 Peter Todd. All rights reserved.
//

import UIKit
import BLAMPayment

class ViewController: UIViewController {
    
 
    @IBOutlet weak var viewBLAMPayment: BLAMPaymentCVView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configData()

    }
    
 //  override func viewDidLayoutSubviews() {
  //  }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        viewBLAMPayment.configAll()
    }

    //MARK: - BLAMPaymentCVView
    //MARK: Data config
    /*
     BLAMPaymentCVView uses a dictionary of Subscription types.  If you do not supply this then it will show 
     demo items.
 
 */
    

    func configData(){
        // Dictionary for display Item
        // Item 1 - a single user subscription
        var dictData = Dictionary <String,AnyObject>()
        var valDisplayOrder = "1"
        var valAwesomeIcon = "fa-home"
        var valTitle = "Single user"
        var valDesc = "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure."
        var valText1 = "Single Asset"
        var valText2 = "1 - User"
        var valText3 = "No team sharing"
        
        var valText4 = "No client sharing"
        var valTextPrice = "FREE"
        var valPrice = NSNumber(double: 0)
        var valCurrCode = "USD"
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode  ]
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 2 - a micro team subscription
        dictData.removeAll()
        valDisplayOrder = "2"
        valAwesomeIcon = "fa-users"
        valTitle = "Micro"
        valDesc = "Recommended for small teams manageing up to 10 properties.  Includes all the team and client sharing features found in our enterprise range."
        valText1 = "5 Users"
        valText2 = "10 Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 25)
        valCurrCode = "USD"
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode  ]
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 3 - a alrge team subscription
        dictData.removeAll()
        valDisplayOrder = "3"
        valAwesomeIcon = "fa-user-plus"
        valTitle = "Team"
        valDesc = "Best for professional teams managing a diverse range of property rental assets."
        valText1 = "25 Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 40)
        valCurrCode = "USD"
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode  ]
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 4 - a large team subscription
        dictData.removeAll()
        valDisplayOrder = "4"
        valAwesomeIcon = "fa-bank"
        valTitle = "Corporate"
        valDesc = "Support up to 100 team members manageing rental assets.  Recommended if you require a broader business access to your leased asset management activities."
        valText1 = "100 Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 100)
        valCurrCode = "USD"
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode  ]
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 5 - a global team subscription
        dictData.removeAll()
        valDisplayOrder = "5"
        valAwesomeIcon = "fa-globe"
        valTitle = "Enterprise"
        valDesc = "Support unlimited users.  Recommended if you are running a global asset management business with teams in remote locations and jurisdictions."
        valText1 = "Unlimited Users"
        valText2 = "Unlimited Assets"
        valText3 = "Team sharing"
        valText4 = "Free client app"
        valTextPrice = "per month"
        valPrice = NSNumber(double: 400)
        valCurrCode = "USD"
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice, "price": valPrice, "codeISO": valCurrCode  ]
        viewBLAMPayment.addDisplayItem(dictData)
        


        
        

        


    }


}



