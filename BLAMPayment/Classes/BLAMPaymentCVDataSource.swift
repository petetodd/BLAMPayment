//
//  BLAMPaymentCVDataSource.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit
import PassKit

import FontAwesome_swift

private let reuseIdentifier = "BLAMPaymentCVCell"


class BLAMPaymentCVDataSource: NSObject, UICollectionViewDataSource {
    
    var dictData : Dictionary <String, BLAMPaymentItemModel>!
    var callingView : BLAMPaymentCVView!

    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return dictData.count
    }
    
    
    
    

   func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BLAMPaymentCVCell

        // Configure the cell
        let keys = Array(dictData.keys).sort(<)
        let key = keys[indexPath.row]
        let dataModel = dictData[key]
        cell.model = dataModel
        cell.delegate = callingView
       // let str1 = "fa-github"
        let strIcon = String.fontAwesomeIconWithCode(dataModel!.awesomeIcon)
        
        cell.lblIcon.font =  UIFont.fontAwesomeOfSize(60)
        cell.lblIcon.text = strIcon
        cell.lblTitle.text = dataModel?.strTitle
        cell.tvDesc.text = dataModel?.strDesc
        cell.tvDesc.textAlignment = NSTextAlignment.Center
        cell.tvDesc.textColor = UIColor.darkGrayColor()
        cell.tvDesc.font = UIFont(name: "HelveticaNeue", size: 17)
        cell.lblText1.text = dataModel?.text1
        cell.lblText2.text = dataModel?.text2
        cell.lblText3.text = dataModel?.text3
        cell.lblText4.text = dataModel?.text4
        
        // Highlight if the user subscribed to this option
        if (dataModel?.isActive == "TRUE"){
            cell.layer.borderWidth = 3
            cell.layer.borderColor = UIColor.greenColor().CGColor
        }else{
            cell.layer.borderWidth = 0

        }
        
        
        
        // Apple Pay button
        // Check if payment is required - not required for free services of services already registered.
        if dataModel?.price  == 0 {
            // Price
            cell.lblPrice.text = dataModel?.textPrice
            cell.butOtherPayOptions.hidden = true
            let viewApple = cell.viewWithTag(100)
            if viewApple != nil{
                viewApple?.removeFromSuperview()
            }
            return cell
        }
        // Create a price label with amount and currency code (if supported)
        cell.viewPayFrame.hidden = false
        
        let strCurrCode = currCodeHexFromISO((dataModel?.codeISO)!)
        let strLabelPrice = "\(strCurrCode)\(dataModel!.price) \(dataModel!.textPrice)"
        // Price
        cell.lblPrice.text = strLabelPrice
        
        
        
        
        if (dataModel?.isActive == "TRUE"){
            // This is the selected subscription - show a cancel option and renewal date
            let butCancel = UIButton()
            butCancel.setTitle("Cancel Subscription", forState: UIControlState.Normal)
            butCancel.tag = 100
            butCancel.addTarget(cell, action: #selector(cell.butCancelAction), forControlEvents: .TouchUpInside)
            butCancel.frame = cell.viewPayFrame.frame
            butCancel.backgroundColor = UIColor.redColor()
            cell.addSubview(butCancel)
            // Display the renewal date
            let lblRenewDate = UILabel()
            let rectFrame = CGRectMake(20, cell.butOtherPayOptions.frame.origin.y, cell.frame.width, cell.butOtherPayOptions.frame.height)
            lblRenewDate.frame = rectFrame

            cell.butOtherPayOptions.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd MMMM"
            let txtDate = dateFormatter.stringFromDate((dataModel?.dateRenew!)!)
            lblRenewDate.text = "Next payment: \(txtDate)"
            cell.addSubview(lblRenewDate)


            
            
        }else{ // Show pay options
            cell.butOtherPayOptions.hidden = false

            let butApplePay = PKPaymentButton()
            butApplePay.tag = 100
            butApplePay.addTarget(cell, action: #selector(cell.butApplePAyAction), forControlEvents: .TouchUpInside)
            butApplePay.frame = cell.viewPayFrame.frame
            cell.addSubview(butApplePay)
            
        }
        



        
        
      
        
        //let item1 = BLAMPaymentItemModel.init(awesomeIcon: "fa-subway", strTitle: "Single user", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Single Asset", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        return cell
    }
    
    
    func currCodeHexFromISO(currISO : String)-> String{
        var currHex = ""
        switch currISO {
        case "USD":
            currHex = "\u{24}"
        case "GBP":
            currHex = "\u{a3}"
        case "EUR":
            currHex = "\u{20ac}"
        case "JPY":
            currHex = "\u{a5}"
        case "CHF":
            currHex = "\u{43}\u{48}\u{46}"
        default:
            currHex = ""
        }
        
        
        return currHex
        
    }
 



}
