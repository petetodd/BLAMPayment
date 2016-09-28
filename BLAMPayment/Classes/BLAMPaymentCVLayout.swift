//
//  BLAMPaymentCVLayout.swift
//  Pods
//
//  Created by Peter Todd Air on 22/08/2016.
//
//

import UIKit

class BLAMPaymentCVLayout: UICollectionViewFlowLayout {
    
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    var xOffset:Int = 20
    var yOffset:Int = 0

    // Cell size
    var cellWidth = 300
    var cellHeight = 600
    
    override var collectionViewContentSize : CGSize {
        screenSize = self.collectionView!.frame
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // Size the contentview to show 41 years (20 years past and future plus current year
        let dataSource:BLAMPaymentCVDataSource = (self.collectionView?.dataSource as? BLAMPaymentCVDataSource)!
        let intItemCt = dataSource.dictData.count
        let widthView =  xOffset + ((xOffset + cellWidth) * intItemCt)
        
        // Calculate a yOffset to center items
        if Int(screenHeight) > cellHeight{
            let diff = Int(screenHeight) - cellHeight
            yOffset = diff / 2
        }
        
        return CGSize(width: CGFloat(widthView), height: CGFloat(cellHeight))
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // Cells
        var attributesToReturn = [UICollectionViewLayoutAttributes]()
        var visibleRect = CGRect.zero
        visibleRect.origin = (self.collectionView?.contentOffset)!
        visibleRect.size = (self.collectionView?.bounds.size)!

        
        // Cells
        // Could restrict this to the visible cells - might need this with a more complex dash
        for indexPath in indexPathsOfItemsInRect(visibleRect)
        {
            attributesToReturn.append((layoutAttributesForItem(at: indexPath as! IndexPath)!))
        }
        
 
        
        // Background decoration view
  //      let decorationIndexPath = (NSIndexPath(forItem: 0, inSection: 0))
 //       attributesToReturn.append((layoutAttributesForDecorationViewOfKind("BackgroundView", atIndexPath: decorationIndexPath))!)
        
        
        
        return attributesToReturn
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        var frame = CGRect.zero
        frame.size.height = CGFloat(cellHeight)
        frame.size.width = CGFloat(cellWidth)
        
        let xPt = xOffset + ((indexPath as NSIndexPath).row * cellWidth) + (xOffset * (indexPath as NSIndexPath).row)
        
        frame.origin.x = CGFloat(xPt)
        frame.origin.y = CGFloat(yOffset)
        attributes.zIndex = 20
        attributes.frame = frame

        
        
        
        return attributes
    }
    
    
    // MARK: - Helpers
    func indexPathsOfItemsInRect(_ rect:CGRect) ->NSArray
    {
        let indexPaths = NSMutableArray()
        
        let dataSource:BLAMPaymentCVDataSource = (self.collectionView?.dataSource as? BLAMPaymentCVDataSource)!
        // Create an array of the visible Index paths (or as we have a small number just add all to the array
        for i in 0 ..< dataSource.dictData.count{
            indexPaths.add(IndexPath(item: i, section: 0))
        }

        return indexPaths
        
    }

}
