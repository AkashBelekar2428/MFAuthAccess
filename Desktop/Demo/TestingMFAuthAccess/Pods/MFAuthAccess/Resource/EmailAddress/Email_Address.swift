//
//  EmailView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

//MARK: Protocol EmailAddressDelegate
public protocol EmailAddressDelegate{
    func sendPINBtnAction()
}

public class Email_Address: UIView {
    
    //MARK: Outlets
    @IBOutlet weak public var imgHeaderLogo:UIImageView!
    @IBOutlet weak public var lblHeaderLogin:UILabel!
    @IBOutlet weak public var viewHeader:UIView!
    @IBOutlet weak public var viewEmailAddress:UIView!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var btnSendPIN:UIButton!
    @IBOutlet weak public var imgReminder:UIImageView!
    @IBOutlet weak public var lblEmailAddress:UILabel!
    
    
    //MARK: Variables
    let nibName = "Email_Address"
    public var pinViewIns = PINView()
    public var delegate:EmailAddressDelegate?
    public var emailConfig = AuthenticationConfiguration()    
    
    //MARK: System methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    //MARK: Custom methods
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        tfEmail.delegate = self
        self.addSubview(view)
    }
 
    func loadViewFromNib() -> UIView? {
        let bundel = Bundle(for: Email_Address.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
    
    public func setThemeWithEmailConfiguration(config:AuthenticationConfiguration){
        self.imgHeaderLogo.image = config.logo
        self.lblHeaderLogin.textColor = config.textColor
        self.lblHeaderLogin.font = config.font
        self.lblHeaderLogin.text = config.text
        self.viewHeader.backgroundColor = config.backgroundColor
        self.btnSendPIN.backgroundColor = config.btnBackgroundColor
        self.tfEmail.placeholder = config.placeHolderText
        self.tfEmail.textColor = config.textColor
        self.tfEmail.font = config.placeHolderFont
        self.imgReminder.tintColor = config.imgIconColor
        self.lblEmailAddress.textColor = config.textColor
    }
    
    
    //MARK: IBAction
    @IBAction func sendPINClicked(_ sender:UIButton){
        delegate?.sendPINBtnAction()
    }
}

extension Email_Address:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

    

