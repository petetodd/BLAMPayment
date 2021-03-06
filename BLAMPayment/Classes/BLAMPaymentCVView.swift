//
//  BLAMPaymentCVView.swift
//  Pods
//
//  Created by Peter Todd Air on 23/08/2016.
//
//

import UIKit

private let reuseIdentifier = "BLAMPaymentCVCell"


public protocol BLAMPaymentCVViewProtocol {
    func payWithApplePay(subRef: String, codeISO: String, amount: NSNumber)
    func payWithOtherPay(subRef: String, codeISO: String, amount: NSNumber, dictionary: Dictionary <String, AnyObject>?)
    func cancelSub()
}

open class BLAMPaymentCVView: UIView, BLAMPaymentCVCellProtocol {
    open var collectionView : UICollectionView!
    open var delegate : BLAMPaymentCVViewProtocol! = nil
    
    let dataSource = BLAMPaymentCVDataSource()
    var dictData : Dictionary <String, BLAMPaymentItemModel>!
    
    /*
    The default is to show an Apple Pay button with a small "pay other"
    We also want to handle a simple select option where the user taps and the presented UI
     (e.g. braintree) will handle payment type selection.
 */
 
    open var paymentType : String?  // if "Subscription" then single button shown
    open var paymentTypeText : String? // Optionally the button text to display

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        // Drawing code
        configAll()

    }

    

    
    open func configAll(){
        if collectionView != nil{
            collectionView.removeFromSuperview()

        }
        configCV()
    }
    
    
    open func refresh(){
        dataSource.dictData = dictData

        collectionView.reloadData()
    }
    
    open func clearAll(){
        dictData.removeAll()
        dataSource.dictData = dictData

        collectionView.reloadData()

    }

    
    func configCV(){
        /*
        if dictData == nil {
            demoData()
        }
 */
        
        dataSource.dictData = dictData
        dataSource.callingView = self


        let layout = BLAMPaymentCVLayout()
        collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        // Register cell classes
        let podBundle = Bundle(for: BLAMPaymentCVView.self)
        
        
        self.collectionView!.register( UINib(nibName: "BLAMPaymentCVCell", bundle: podBundle), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set datasource
        collectionView.dataSource = dataSource
        
   /*
        // Dynamically load font
        let fontURL = podBundle.url(forResource: "fontawesome-webfont", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL as! CFURL, CTFontManagerScope.process, nil)
        var fontAwesome = UIFont(name: "FontAwesome", size: 60)
        var attrs = [NSFontAttributeName : fontAwesome!,
                     NSForegroundColorAttributeName : UIColor.red,
                     NSBaselineOffsetAttributeName : 0.0] as AnyObject
        
        let nameAttrSring = NSAttributedString(string: "\u{f073}", attributes: attrs as! [String : Any])
        
     //   let dataSource:BLAMPaymentCVDataSource = (self.collectionView?.dataSource as? BLAMPaymentCVDataSource)!
        
        dataSource.strAwesome = nameAttrSring

   */     
        
        
        // Set a white background (we could use a Decoration View)
        collectionView.backgroundColor = self.backgroundColor
        

        
        self.addSubview(collectionView)

    }
    
    open func addDisplayItem(_ inDict : Dictionary <String, AnyObject>){
        
        
        let itemModel = BLAMPaymentItemModel.init(awesomeIcon: inDict["awesomeIcon"]! as! String, strTitle: inDict["strTitle"]! as! String, strDesc: inDict["strDesc"]! as! String, text1: inDict["text1"]! as! String, text2: inDict["text2"]! as! String, text3: inDict["text3"]! as! String, text4: inDict["text4"]! as! String, textPrice: inDict["textPrice"]! as! String, price : inDict["price"]! as! NSNumber, codeISO : inDict["codeISO"]! as! String, subRef : inDict["subRef"]! as! String, isActive :  inDict["isActive"]! as! String, dateRenew : inDict["dateRenew"]! as? Date)
        // dictData = [inDict["valDisplayOrder"]!: itemModel]
        let strDisplayOrder = ("Order:\(inDict["displayOrder"]!)")

        if dictData == nil{
            dictData = [strDisplayOrder : itemModel]
        }else{
            dictData[strDisplayOrder] = itemModel
        }
        itemModel.dictData = inDict
    
    }
    
    // MARK: - BLAMPaymentCVCellProtocol

    func payApple(_ subRef: String, codeISO: String, amount: NSNumber){
        delegate.payWithApplePay(subRef: subRef, codeISO: codeISO, amount: amount)
    }
    
    func payOther(_ subRef: String, codeISO: String, amount: NSNumber, dictionary: Dictionary <String, AnyObject>?){
        delegate.payWithOtherPay(subRef: subRef, codeISO: codeISO, amount: amount, dictionary: dictionary )
    }
    
    func cancelSub(){
        delegate.cancelSub()
    }


    // MARK: - DEMO Data

    
    func demoData(){
        let valDateRenew = Date()

        let item1 = BLAMPaymentItemModel.init(awesomeIcon: "\u{f015}", strTitle: "Single user", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Single Asset", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE",  price : 0, codeISO : "USD", subRef : "SINGLE", isActive: "FALSE", dateRenew: valDateRenew)
        let item2 = BLAMPaymentItemModel.init(awesomeIcon: "\u{f0c0}", strTitle: "Team", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Team", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "",  price : 9.99, codeISO : "USD",  subRef : "TEAM", isActive: "TRUE", dateRenew: valDateRenew)
        let item3 = BLAMPaymentItemModel.init(awesomeIcon: "\u{f234}", strTitle: "Business", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Business", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "",  price : 9.99, codeISO : "USD",  subRef : "BUSINESS", isActive: "FALSE", dateRenew: valDateRenew)

        let item4 = BLAMPaymentItemModel.init(awesomeIcon: "\u{f19c}", strTitle: "Team", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Team", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "",  price : 9.99, codeISO : "USD",  subRef : "TEAM", isActive: "FALSE", dateRenew: valDateRenew)

        let item5 = BLAMPaymentItemModel.init(awesomeIcon: "\u{f0ac}", strTitle: "Enterprise", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Enterprise", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "",  price : 9.99, codeISO : "USD",  subRef : "ENTERPRISE", isActive: "FALSE", dateRenew: valDateRenew)

        dictData = ["item1": item1, "item2": item2, "item3": item3, "item4": item4, "item5": item5 ]

   
        
    }

}
