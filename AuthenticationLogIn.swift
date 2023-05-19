//
//  AuthView.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

//MARK: Protocol AuthenticationLogInDelegate
public protocol AuthenticationLogInDelegate{
    func sendPinBtnAction(email: String, password: String)
}

@available(iOS 13.0, *)
public class AuthenticationLogIn: UIView {
    
    @IBOutlet weak public var imgHeaderLogo:UIImageView!
    @IBOutlet weak public var lblHeaderLogin:UILabel!
    @IBOutlet weak public var viewHeader:UIView!
    @IBOutlet weak public var lblAuthType:UILabel!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var tfPassword:UITextField!
    @IBOutlet weak public var btnValidate:UIButton!
    @IBOutlet weak public var btnEye:UIButton!
    @IBOutlet weak public var viewContainerAuth:UIView!
    @IBOutlet weak public var btnForgotPassword:UIButton!
    @IBOutlet weak public var btnReminder:UIButton!
    @IBOutlet weak public var lblPassword:UILabel!
    @IBOutlet weak public var viewSpaceHeight:UIView!
    
    //MARK: Variables
    let nibName = "AuthenticationLogIn"
    public var delegate:AuthenticationLogInDelegate?
    public var authConfig = AuthenticationConfiguration()
    var myUtility = Utility()
    public weak var authController: UIViewController?
    
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
        tfPassword.delegate = self
        
        self.addSubview(view)
        self.viewContainerAuth.isHidden = true
    }
    
    func loadViewFromNib() -> UIView? {
        let bundel = Bundle(for: AuthenticationLogIn.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
    
    public func setAuthDefaultThemes(){
        let authConfiguration = AuthenticationConfiguration()
        authConfiguration.firstLblText = "EmailAddress"
        authConfiguration.secondLblText = "Password"
        authConfiguration.text = "LogIn"
        authConfiguration.backgroundColor = .blue
        authConfiguration.font = .boldSystemFont(ofSize: 24)
        authConfiguration.lblFirstFiledFont = .boldSystemFont(ofSize: 14)
        authConfiguration.lblSecondFiledFont = .boldSystemFont(ofSize: 14)
        authConfiguration.textColor = .black
        authConfiguration.logo = UIImage(named: "twitter")!
        authConfiguration.placeHolderTextColor = .gray
        authConfiguration.firstPlaceHolderText = "Enter Your Email"
        authConfiguration.secondplaceHolderText = "Enter Your Password"
        authConfiguration.firstPlaceholderFont = .systemFont(ofSize: 14)
        authConfiguration.secondPlaceholderFont = .systemFont(ofSize: 8)
        authConfiguration.imgIconColor = .gray
        authConfiguration.btnBackgroundColor = .green
        authConfiguration.btnTitle = "Validate"
        authConfiguration.containerViewBorderWidth = 4
        authConfiguration.containerViewBorderColor = .gray
        authConfiguration.viewType = .authLog
        
        self.setThemWithAuthConfiguration(config: authConfiguration)
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
        self.btnValidate.backgroundColor = config.btnBackgroundColor
        self.lblAuthType.text = config.firstLblText
        self.lblPassword.text = config.secondLblText
        self.lblPassword.font = config.lblSecondFiledFont
        self.tfEmail.placeholder = config.firstPlaceHolderText
        self.tfPassword.placeholder = config.secondplaceHolderText
        self.tfEmail.font = config.firstPlaceholderFont
        self.tfEmail.textColor = config.textColor
        self.tfPassword.font = config.secondPlaceholderFont
        self.tfPassword.textColor = config.textColor
        self.btnEye.tintColor = config.imgIconColor
        self.btnReminder.tintColor = config.imgIconColor
        self.btnValidate.titleLabel?.text = config.btnTitle
        self.viewContainerAuth.layer.borderWidth = CGFloat(config.containerViewBorderWidth)
        self.viewContainerAuth.layer.borderColor = config.containerViewBorderColor.cgColor
        self.viewSpaceHeight.layer.borderColor = config.viewTintColor.cgColor
        self.btnForgotPassword.titleLabel?.text = config.resendPinBtnTitleText
        self.viewContainerAuth.isHidden = false
    }
    
    //MARK: IBAction
    @IBAction func validateBtnAction(_ sender:UIButton){
        if myUtility.isValideEmail(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!)
        {
            if myUtility.isPasswordValide(password: (tfPassword.text?.trimmingCharacters(in: .whitespaces))!)
            {
                delegate?.sendPinBtnAction(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!, password: (tfPassword.text?.trimmingCharacters(in: .whitespaces))!)
            }
            else
            {
                myUtility.showAlter(title: "PASSWORD", msg: "Invalide Password", action: "OK", viewController: self.authController!)
            }
        }
        else
        {
            myUtility.showAlter(title: "EMAIL", msg: "Invalide Email", action: "OK", viewController: self.authController!)
        }
    }
    
    @IBAction func eyeBtnAction()
    {
        tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        let btneyeImg = tfPassword.isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
        btnEye.setImage(btneyeImg, for: .normal)
    }
    @IBAction func reminderBtnAction()
    {
        
    }
}

@available(iOS 13.0, *)
extension AuthenticationLogIn:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

