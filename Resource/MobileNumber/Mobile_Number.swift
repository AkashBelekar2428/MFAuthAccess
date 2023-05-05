//
//  MobilePinView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit
import Foundation

public class Mobile_Number:UIView {
    @IBOutlet weak public var sendPinBtn:UIButton!
    @IBOutlet weak public var mobileView:UIView!
    @IBOutlet weak public var tfMobileNum:UITextField!
    
    let nibName = "Mobile_Number"
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func mobileValidations(_ sender:UIButton){
        if (Utility.shared.isPhoneValide(phone: tfMobileNum.text!)){
            print("phone number is valide")
        }else{
            Utility.shared.showAltersBtn(title: "Phone Number", msg: "Invalide Phone Number", firstAction: "OK", secondAction: "CANCLE", firstComplition: {
                //Action
            }, secondComplition: {
                //Action
            }, viewController: UIViewController())

        }
    }
}
