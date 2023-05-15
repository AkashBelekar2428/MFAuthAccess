//
//  ViewController.swift
//  TestingMFAuthAccess
//
//  Created by Akash Belekar on 11/05/23.
//

import UIKit
import MFAuthAccess

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var containerView:UIView!
    
    //MARK: variables
    lazy var emailAddress = Email_Address()
    lazy var mobileNumber = Mobile_Number()
    lazy var pinView = PINView()
    var authenticationLogin = AuthenticationLogIn()
        
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: init Controllers
        emailAddress = Email_Address.init()
        mobileNumber = Mobile_Number.init()
        pinView = PINView.init()
        authenticationLogin = AuthenticationLogIn.init()
        
        //MARK: Assign ViewController to present show alert msg
        emailAddress.emailController = self
        mobileNumber.mobileController = self
        pinView.pinController = self
        authenticationLogin.authController = self
       
        //MARK: Protocol Delegates
        emailAddress.delegate = self
        mobileNumber.delegate = self
        authenticationLogin.delegate = self
        pinView.delegate = self
      
        containerView.addSubview(mobileNumber)
    }
    
    //MARK: viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //MARK: Set Frames
        emailAddress.frame = containerView.bounds
        mobileNumber.frame = containerView.bounds
        pinView.frame = containerView.bounds
        authenticationLogin.frame = containerView.bounds
        
        //MARK: EmailAddressConfiguration
        let configObj = AuthenticationConfiguration()
        configObj.textAlignment = .left
        configObj.text = "LogIn"
        configObj.numberOfLines = 2
        configObj.font = .systemFont(ofSize: 18)
        configObj.textColor = .darkGray
        configObj.logo = UIImage(named: "twitter")!
        configObj.backgroundColor = UIColor.lightGray
        configObj.btnBackgroundColor = UIColor.red
        configObj.imgIconColor = .gray
        configObj.placeHolderFont = .systemFont(ofSize: 14)
        configObj.placeHolderText = "Enter Your Email"
        configObj.viewType = .email
        
        self.emailAddress.setThemeWithEmailConfiguration(config: configObj)
        
        //MARK: MobileNumberConfiguration
        let mobileConfig = AuthenticationConfiguration()
        mobileConfig.backgroundColor = UIColor.lightGray
        mobileConfig.textColor = .black
        mobileConfig.font = .systemFont(ofSize: 18)
        mobileConfig.text = "LogInn"
        mobileConfig.logo = UIImage(named: "fb")!
        mobileConfig.btnFont = .boldSystemFont(ofSize: 18)
        mobileConfig.placeHolderText = "Enter Your MobileNumber"
        mobileConfig.placeHolderFont = .systemFont(ofSize: 14)
        mobileConfig.imgIconColor = .gray
        mobileConfig.placeHolderTextColor = .black
        mobileConfig.viewType = .mobile
        
        self.mobileNumber.setThemeWithMobileConfiguration(config: mobileConfig)
        
        
        //MARK: PINViewConfiguration
        let pinViewConfig = AuthenticationConfiguration()
        pinViewConfig.logo = UIImage(named: "twitter")!
        pinViewConfig.textColor = .black
        pinViewConfig.font = .boldSystemFont(ofSize: 18)
        pinViewConfig.textAlignment = .left
        pinViewConfig.backgroundColor = .gray
        pinViewConfig.text = "LogIn"
        pinViewConfig.pinText = "Please enter your 6-Digit PIN."
        pinViewConfig.viewType = .pinView
        
        self.pinView.setThemeWithPINConfiguration(config: pinViewConfig)
        
        
        //MARK: AuthenticationConfiguration
        let authConfiguration = AuthenticationConfiguration()
        authConfiguration.authType = "EmailAddress"
        authConfiguration.text = "LogIn"
        authConfiguration.backgroundColor = .gray
        authConfiguration.font = .boldSystemFont(ofSize: 24)
        authConfiguration.lblFirstFiledFont = .boldSystemFont(ofSize: 14)
        authConfiguration.lblSecondFiledFont = .boldSystemFont(ofSize: 14)
        authConfiguration.textColor = .black
        authConfiguration.logo = UIImage(named: "twitter")!
        authConfiguration.placeHolderTextColor = .gray
        authConfiguration.placeHolderText = "Enter Your Email"
        authConfiguration.placeHolderPasswordText = "Enter Your Password"
        authConfiguration.placeHolderFont = .systemFont(ofSize: 14)
        authConfiguration.imgIconColor = .gray
        authConfiguration.viewType = .authLog
        
        self.authenticationLogin.setThemWithAuthConfiguration(config: authConfiguration)
    }
}

//MARK: MobileNumber
extension ViewController:MobileNumberDelegate{
    func sendPINAction(mobileNumber: String) {
        
    }
}

//MARK: EmailAddress
extension ViewController:EmailAddressDelegate{
    func sendPINBtnAction(email: String) {
        
    }
}

//MARK: AuthenticationLogInDelegate
extension ViewController:AuthenticationLogInDelegate{
    func sendPinBtnAction(email: String, password: String) {
        
    }
}

//MARK: PINViewDelegate
extension ViewController:PINViewDelegate{
    func validateBtnAction(pinNumber: String) {
        
    }
}
