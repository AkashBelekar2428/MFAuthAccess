//
//  EmailView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

protocol pinViewSetDelegate{
    func setPinView()
}
public class Email_Address: UIView {
    @IBOutlet weak public var emailAddressView:UIView!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var sendPINBtn:UIButton!
    
    
    let nibName = "Email_Address"
    
    var delegate:pinViewSetDelegate?
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
    @IBAction func sendPINClicked(_ sender:UIButton){
        delegate?.setPinView()
        sendPINBtn.setTitle("Validate", for: .normal)
        if (Utility.shared.isValideEmail(email:tfEmail.text!)){
            print("Email is Validate")
        }else{
            Utility.shared.showAltersBtn(title: "Email", msg: "Email is InValide", firstAction: "OK", secondAction: "CANCLE", firstComplition: {
                //Action
            }, secondComplition: {
                //Action
            }, viewController: UIViewController())
        }
    }
}
