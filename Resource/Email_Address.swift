//
//  EmailView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

//MARK: Protocol EmailAddressDelegate
public protocol EmailAddressDelegate{
    func sendPINBtnAction(email:String)
}
//public protocol navigateEmailViewDelegate{
//    func navEmail()
//}

public class Email_Address: UIView{
    
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
    // public var emailNavDelegate:navigateEmailViewDelegate?
    public var emailConfig = AuthenticationConfiguration()
    lazy var  myUtility = Utility()
    public weak var emailController: UIViewController?
    
    public var emailNav = ComponentManager()
    
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
    
    public func setEmailDefaultThemes(){
        let configObj = AuthenticationConfiguration()
        configObj.textAlignment = .left
        configObj.text = "LogIn"
        configObj.numberOfLines = 2
        configObj.font = .systemFont(ofSize: 18)
        configObj.textColor = .darkGray
        configObj.logo = UIImage(named: "twitter")!
        configObj.backgroundColor = UIColor.lightGray
        configObj.btnBackgroundColor = UIColor.green
        configObj.imgIconColor = .gray
        configObj.placeHolderFont = .systemFont(ofSize: 14)
        configObj.placeHolderText = "Enter Your Email"
        configObj.btnTitle = "Validations"
        configObj.viewType = .email
        
        self.setThemeWithEmailConfiguration(config: configObj)
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
        self.btnSendPIN.titleLabel?.text = config.btnTitle
    }
    
    //MARK: IBAction
    @IBAction func sendPINClicked(_ sender:UIButton){
        //     emailNavDelegate?.navEmail()
        if myUtility.isValideEmail(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!)
        {
            delegate?.sendPINBtnAction(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!)
        }
        else
        {
            myUtility.showAlter(title: "EMAIL", msg: "Invalide Email", action: "OK", viewController: self.emailController!)
        }
    }
}

extension Email_Address:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

    

