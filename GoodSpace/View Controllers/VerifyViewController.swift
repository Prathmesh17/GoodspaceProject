//
//  VerifyViewController.swift
//  GoodSpace
//
//  Created by Prathmesh Parteki on 07/12/23.
//

import UIKit

class VerifyViewController: UIViewController {
    
    var mobileNumber : String = ""
    var editPhoneNumberPopUp : PopUpView!

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var MobileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        textField2.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        textField3.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        textField4.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        MobileLabel.text = mobileNumber 
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "edit", image: UIImage(systemName: "pencil"), target: self, action: #selector(popUpView))
    }
    
    @objc func popUpView(){
        self.editPhoneNumberPopUp = PopUpView(frame: self.view.frame)
        self.editPhoneNumberPopUp.popUpVerifyButton.addTarget(self, action: #selector(popUpVerifyButtonTapped), for: .touchUpInside)
        self.view.addSubview(editPhoneNumberPopUp)
    }
    @objc func popUpVerifyButtonTapped(){
        self.editPhoneNumberPopUp.removeFromSuperview()
    }
    
    @objc func textFieldChange(textField : UITextField){
        let text = textField.text
        if text?.count == 1 {
            switch textField {
            case textField1:
                textField2.becomeFirstResponder()
            case textField2:
                textField3.becomeFirstResponder()
            case textField3:
                textField4.becomeFirstResponder()
            case textField4:
                textField4.resignFirstResponder()
            default:
                break
            }
        }
        if text?.count == 0 {
            switch textField {
            case textField1:
                textField1.becomeFirstResponder()
            case textField2:
                textField1.becomeFirstResponder()
            case textField3:
                textField2.becomeFirstResponder()
            case textField4:
                textField3.becomeFirstResponder()
            default:
                break
            }
        }
    }
    @IBAction func resendButtonPressed(_ sender: Any) {
        OTPModel.shared.getOTPMethod(textPhone: mobileNumber)
    }
    
    @IBAction func verifyPhoneButtonPressed(_ sender: Any) {
        var otp = textField1.text!
        otp.append(textField2.text!)
        otp.append(textField3.text!)
        otp.append(textField4.text!)
        let userCanLogIn = OTPModel.shared.verifyOTPMethod(number: mobileNumber, otp: otp)
        if userCanLogIn {
            let vc = self.storyboard?.instantiateViewController(identifier: "DashboardViewController") as! DashboardViewController
            navigationController?.pushViewController(vc, animated: true)
        }else{
            
        }
       
    }
    
}
