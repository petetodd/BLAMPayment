//
//  MenuViewController.swift
//  BLAMPayment
//
//  Created by Peter Todd Air on 16/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

enum DisplayOption {
    case normal
    case subscribe
    case subscribeText
}

class MenuViewController: UIViewController {

    
    var displayOption = DisplayOption.normal
    var paymentTypeText : String?
    

    @IBOutlet weak var txtCustom: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueShowSelector")
        {
            let destVC = segue.destination as! ViewController
            destVC.displayOption = self.displayOption
            if paymentTypeText != nil{
                destVC.paymentTypeText = self.paymentTypeText
            }
        }
    }
    

    @IBAction func butDefaultAction(_ sender: AnyObject) {
        displayOption = DisplayOption.normal
        performSegue(withIdentifier: "segueShowSelector", sender: self)
    }
    

    @IBAction func butSubscribeTextAction(_ sender: AnyObject) {
        displayOption = DisplayOption.subscribeText
        if (txtCustom.text?.count ?? 0 > 0){
            paymentTypeText = txtCustom.text
        }else {
            paymentTypeText = ""
        }
        performSegue(withIdentifier: "segueShowSelector", sender: self)
    }
    
    
}
