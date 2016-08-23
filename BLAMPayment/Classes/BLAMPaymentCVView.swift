//
//  BLAMPaymentCVView.swift
//  Pods
//
//  Created by Peter Todd Air on 23/08/2016.
//
//

import UIKit

private let reuseIdentifier = "BLAMPaymentCVCell"


public class BLAMPaymentCVView: UIView {
    public var collectionView : UICollectionView!
    let dataSource = BLAMPaymentCVDataSource()
    var dictData : Dictionary <String, BLAMPaymentItemModel>!


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func drawRect(rect: CGRect) {
        // Drawing code
        configAll()

    }

    

    
    public func configAll(){
        if collectionView != nil{
            collectionView.removeFromSuperview()

        }
        self.configView()
        configCV()
    }
    
    func configView(){
        self.backgroundColor = UIColor.redColor()
    }
    
    func configCV(){
        demoData()
        dataSource.dictData = dictData

        let layout = BLAMPaymentCVLayout()
        collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        // Register cell classes
        let podBundle = NSBundle(forClass: BLAMPaymentCVC.self)
        let bundleURL = podBundle.URLForResource("BLAMPayment", withExtension: "bundle")
        let bundle = NSBundle(URL: bundleURL!)!
        
        
        self.collectionView!.registerNib( UINib(nibName: "BLAMPaymentCVCell", bundle: podBundle), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set datasource
        collectionView.dataSource = dataSource
        

        
        self.addSubview(collectionView)

    }
    
    func demoData(){
        let item1 = BLAMPaymentItemModel.init(awesomeIcon: "fa-subway", strTitle: "Single user", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Single Asset", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        let item2 = BLAMPaymentItemModel.init(awesomeIcon: "fa-user", strTitle: "Team", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Team", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        let item3 = BLAMPaymentItemModel.init(awesomeIcon: "fa-home", strTitle: "Business", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Business", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        let item4 = BLAMPaymentItemModel.init(awesomeIcon: "fa-globe", strTitle: "Team", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Team", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        let item5 = BLAMPaymentItemModel.init(awesomeIcon: "fa-lightbulb-o", strTitle: "Enterprise", strDesc: "Manage a single rental asset.  Record property details, bookings, tenants and income /expenditure.", text1: "Enterprise", text2: "Multiple device sync", text3: "No team sharing", text4: "No client sharing", textPrice: "FREE")
        dictData = ["item1": item1, "item2": item2, "item3": item3, "item4": item4, "item5": item5 ]

   
        
    }

}
