//
//  ViewController.swift
//  GoodSpace
//
//  Created by Prathmesh Parteki on 07/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var textPhone : String = ""
    var otpModel : OTPModel = OTPModel()

    @IBOutlet weak var textFieldText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func getOTPFromNumber(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(identifier: "VerifyViewController") as! VerifyViewController
        if let phoneNumberText = textFieldText.text  {
            textPhone = phoneNumberText
        }
        vc.mobileNumber = textPhone
        OTPModel.shared.getOTPMethod(textPhone: textPhone)
        navigationController?.pushViewController(vc, animated: true)
        
    }

    
    
}

