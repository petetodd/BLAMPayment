//
//  BLAMPaymentCVView.swift
//  Pods
//
//  Created by Peter Todd Air on 23/08/2016.
//
//

import UIKit

private let reuseIdentifier = "BLAMPaymentCVCell"


class BLAMPaymentCVView: UIView {
    var collectionView : UICollectionView!
    let dataSource = BLAMPaymentCVDataSource()

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configView()
        configCV()
    }
    
    func configView(){
        self.backgroundColor = UIColor.redColor()
    }
    
    func configCV(){
        let layout = UICollectionViewFlowLayout()
        
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

}
