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
        var dictData = Dictionary <String,String>()
        let valDisplayOrder = "1"
        let valAwesomeIcon = "fa-user"
        let valTitle = "Single user"
        let valDesc = "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure."
        let valText1 = "Single Asset"
        let valText2 = "Multiple device sync"
        let valText3 = "No team sharing"
        
        let valText4 = "No client sharing"
        let valTextPrice = "FREE"
        dictData = ["displayOrder": valDisplayOrder, "awesomeIcon": valAwesomeIcon, "strTitle": valTitle, "strDesc": valDesc, "text1": valText1, "text2": valText2, "text3": valText3 , "text4": valText4 , "textPrice": valTextPrice  ]
        viewBLAMPayment.addDisplayItem(dictData)
        
        // Item 2 - a small team subscription
        
        

        


    }


}



