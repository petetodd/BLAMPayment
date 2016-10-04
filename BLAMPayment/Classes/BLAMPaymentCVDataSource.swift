//
//  BLAMPaymentCVDataSource.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit
import PassKit


private let reuseIdentifier = "BLAMPaymentCVCell"


class BLAMPaymentCVDataSource: NSObject, UICollectionViewDataSource {
    
    var dictData : Dictionary <String, BLAMPaymentItemModel>!
    var callingView : BLAMPaymentCVView!
    var strAwesome : NSAttributedString!

    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return dictData.count
    }
    
    
    
    

   func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BLAMPaymentCVCell

        // Configure the cell
        let keys = Array(dictData.keys).sorted(by: <)
        let key = keys[(indexPath as NSIndexPath).row]
        let dataModel = dictData[key]
        cell.model = dataModel
        cell.delegate = callingView
       // let str1 = "fa-github"
        
     //   cell.lblIcon.font =  UIFont(name: "FontAwesome", size: 60)
        
        // Dynamically load font
     //   let podBundle = Bundle(for: BLAMPaymentCVView.self)
        let podBundle = Bundle(path: Bundle(for: BLAMPaymentCVView.self).path(forResource: "BLAMPayment", ofType: "bundle")!)


        let fontURL = podBundle?.url(forResource: "fontawesome-webfont", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL as! CFURL, CTFontManagerScope.process, nil)
        let fontAwesome = UIFont(name: "FontAwesome", size: 60)
        let attrs = [NSFontAttributeName : fontAwesome!,
                     NSForegroundColorAttributeName : UIColor.red,
                     NSBaselineOffsetAttributeName : 0.0] as AnyObject
        
        let nameAttrSring = NSAttributedString(string: (dataModel?.awesomeIcon)!, attributes: attrs as! [String : Any])
        
        cell.lblIcon.attributedText = nameAttrSring


        
        
        

        cell.lblTitle.text = dataModel?.strTitle
        cell.tvDesc.text = dataModel?.strDesc
        cell.tvDesc.textAlignment = NSTextAlignment.center
        cell.tvDesc.textColor = UIColor.darkGray
        cell.tvDesc.font = UIFont(name: "HelveticaNeue", size: 17)
        cell.lblText1.text = dataModel?.text1
        cell.lblText2.text = dataModel?.text2
        cell.lblText3.text = dataModel?.text3
        cell.lblText4.text = dataModel?.text4
        
        // Highlight if the user subscribed to this option
        if (dataModel?.isActive == "TRUE"){
            cell.layer.borderWidth = 3
            cell.layer.borderColor = UIColor.green.cgColor
        }else{
            cell.layer.borderWidth = 0

        }
        
        
        
        // Apple Pay button
        // Check if payment is required - not required for free services of services already registered.
        if dataModel?.price  == 0 {
            // Price
            cell.lblPrice.text = dataModel?.textPrice
            cell.butOtherPayOptions.isHidden = true
            let viewApple = cell.viewWithTag(100)
            if viewApple != nil{
                viewApple?.removeFromSuperview()
            }
            return cell
        }
        // Create a price label with amount and currency code (if supported)
        cell.viewPayFrame.isHidden = false
        
        let strCurrCode = currCodeHexFromISO((dataModel?.codeISO)!)
        let strLabelPrice = "\(strCurrCode)\(dataModel!.price) \(dataModel!.textPrice)"
        // Price
        cell.lblPrice.text = strLabelPrice
        
        
        
        
        if (dataModel?.isActive == "TRUE"){
            // This is the selected subscription - show a cancel option and renewal date
            let butCancel = UIButton()
            butCancel.setTitle("Cancel Subscription", for: UIControlState())
            butCancel.tag = 100
            butCancel.addTarget(cell, action: #selector(cell.butCancelAction), for: .touchUpInside)
            butCancel.frame = cell.viewPayFrame.frame
            butCancel.backgroundColor = UIColor.red
            cell.addSubview(butCancel)
            // Display the renewal date
            let lblRenewDate = UILabel()
            let rectFrame = CGRect(x: 20, y: cell.butOtherPayOptions.frame.origin.y, width: cell.frame.width, height: cell.butOtherPayOptions.frame.height)
            lblRenewDate.frame = rectFrame

            cell.butOtherPayOptions.isHidden = true
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM"
            let txtDate = dateFormatter.string(from: (dataModel?.dateRenew!)! as Date)
            lblRenewDate.text = "Next payment: \(txtDate)"
            cell.addSubview(lblRenewDate)


            
            
        }else{ // Show pay options
            cell.butOtherPayOptions.isHidden = false

            let butApplePay = PKPaymentButton()
            butApplePay.tag = 100
            butApplePay.addTarget(cell, action: #selector(cell.butApplePAyAction), for: .touchUpInside)
            butApplePay.frame = cell.viewPayFrame.frame
            cell.addSubview(butApplePay)
            
        }
        



        
        
      
        
        //let item1 = BLAMPaymentItemModel.init(awesomeIcon: "fa-subway", strTitle: "Single user", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Single Asset", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        return cell
    }
    
    
    func currCodeHexFromISO(_ currISO : String)-> String{
        var currHex = ""
        switch currISO {
        case "USD":
            currHex = "\u{24}"
        case "CAD":
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
