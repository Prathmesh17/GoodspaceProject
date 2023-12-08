//
//  PopUpView.swift
//  GoodSpace
//
//  Created by Prathmesh Parteki on 08/12/23.
//

import UIKit

class PopUpView: UIView {
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height:  frame.height))
    }
    
    @IBOutlet weak var correctTextFieldText: UITextField!
    @IBOutlet weak var popUpVerifyButton: UIButton!
    
    
    @IBAction func popUpVerifyButtonPressed(_ sender: Any) {
        OTPModel.shared.getOTPMethod(textPhone: correctTextFieldText.text ?? " ")
    }
    
    func xibSetup(frame:CGRect){
        let view = loadxib()
        view.frame = frame
        addSubview(view)
    }
    
    func loadxib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUpView", bundle: bundle)
        let view = nib.instantiate(withOwner: self,options: nil).first as? UIView
        return view!
    }
}
