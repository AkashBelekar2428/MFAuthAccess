//
//  AuthView.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

//MARK: Protocol AuthenticationLogInDelegate
public protocol AuthenticationLogInDelegate{
    func validateBtnAction()
}

public class AuthenticationLogIn: UIView {
    
    //MARK: IBOutlets
    @IBOutlet weak public var imgHeaderLogo:UIImageView!
    @IBOutlet weak public var lblHeaderLogin:UILabel!
    @IBOutlet weak public var viewHeader:UIView!
    @IBOutlet weak public var lblAuthType:UILabel!
    @IBOutlet weak public var tfUsername:UITextField!
    @IBOutlet weak public var tfPassword:UITextField!
    @IBOutlet weak public var btnValidate:UIButton!
    @IBOutlet weak public var imgEye:UIImageView!
    @IBOutlet weak public var imgReminder:UIImageView!
    @IBOutlet weak public var lblPassword:UILabel!
    
    //MARK: Variables
    let nibName = "AuthenticationLogIn"
    public var delegate:AuthenticationLogInDelegate?
    public var authConfig = AuthenticationConfiguration()
    
    
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
        tfUsername.delegate = self
        tfPassword.delegate = self
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundel = Bundle(for: AuthenticationLogIn.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
    
    public func setThemWithAuthConfiguration(config:AuthenticationConfiguration)
    {
        self.imgHeaderLogo.image = config.logo
        self.lblHeaderLogin.text = config.text
        self.lblHeaderLogin.textAlignment = config.textAlignment
        self.lblHeaderLogin.textColor = config.textColor
        self.lblHeaderLogin.font = config.font
        self.lblAuthType.font = config.lblFirstFiledFont
        self.viewHeader.backgroundColor = config.backgroundColor
        self.btnValidate.backgroundColor = config.backgroundColor
        self.lblAuthType.text = config.authType
        self.lblPassword.font = config.lblSecondFiledFont
        self.tfUsername.placeholder = config.placeHolderText
        self.tfUsername.font = config.placeHolderFont
        self.tfUsername.textColor = config.textColor
        self.tfPassword.placeholder = config.placeHolderPasswordText
        self.tfPassword.font = config.placeHolderFont
        self.tfPassword.textColor = config.textColor
        self.imgEye.tintColor = config.imgIconColor
        self.imgReminder.tintColor = config.imgIconColor
    }
    
    //MARK: IBAction
    @IBAction func validateBtnAction(_ sender:UIButton){
        delegate?.validateBtnAction()
    }
}

extension AuthenticationLogIn:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

