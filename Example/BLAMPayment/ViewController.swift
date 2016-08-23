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

    }
    
 //  override func viewDidLayoutSubviews() {
  //  }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        viewBLAMPayment.configAll()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

