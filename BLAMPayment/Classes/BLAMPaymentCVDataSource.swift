//
//  BLAMPaymentCVDataSource.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit

private let reuseIdentifier = "BLAMPaymentCVCell"


class BLAMPaymentCVDataSource: NSObject, UICollectionViewDataSource {
    
    var dictData : Dictionary <String, BLAMPaymentItemModel>!

    
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
        let keys = Array(dictData.keys)
        let key = keys[indexPath.row]
        let dataModel = dictData[key]
        let strIconU = "\u{f015}"
        
        let strIcon = String.fontA
        
        
      //  cell.lblIcon.text =
     //   cell.lblTitle.text = dataModel?.strTitle
        
        
        
        return cell
    }
 



}
