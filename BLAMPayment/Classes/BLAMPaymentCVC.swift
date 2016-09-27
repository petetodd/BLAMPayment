//
//  BLAMPaymentCVC.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit

private let reuseIdentifier = "BLAMPaymentCVCell"

class BLAMPaymentCVC: UICollectionViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Cell
        let podBundle = Bundle(for: BLAMPaymentCVC.self)
        
      
        self.collectionView!.register( UINib(nibName: "BLAMPaymentCVCell", bundle: podBundle), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Dynamically load font
        let fontURL = podBundle.url(forResource: "fontawesome-webfont", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL as! CFURL, CTFontManagerScope.process, nil)
        var fontAwesome = UIFont(name: "fontawesome-webfont", size: 60)
        var attrs = [NSFontAttributeName : fontAwesome!,
                     NSForegroundColorAttributeName : UIColor.red,
                     NSBaselineOffsetAttributeName : 0.0] as AnyObject
        
        let nameAttrSring = NSAttributedString(string: "\u{f073}", attributes: attrs as! [String : Any])
        
        let dataSource:BLAMPaymentCVDataSource = (self.collectionView?.dataSource as? BLAMPaymentCVDataSource)!
        
        dataSource.strAwesome = nameAttrSring


        
    }



}
