//
//  MobilePinView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit
import Foundation

//MARK: Protocol MobileNumberDelegate
public protocol MobileNumberDelegate{
    func sendPINAction()
}

public class Mobile_Number:UIView {
    
    //MARK: IBOutlets
    @IBOutlet weak public var imgHeaderLogo:UIImageView!
    @IBOutlet weak public var lblHeaderLogin:UILabel!
    @IBOutlet weak public var viewHeader:UIView!
    @IBOutlet weak public var btnSendPin:UIButton!
    @IBOutlet weak public var viewMobile:UIView!
    @IBOutlet weak public var tfMobileNum:UITextField!
    @IBOutlet weak public var lblCountryCode:UILabel!
    @IBOutlet weak public var lblMobile:UILabel!
    @IBOutlet weak public var imgReminder:UIImageView!

    
    //MARK: Variables
    let nibName = "Mobile_Number"
    public var delegate:MobileNumberDelegate?
    public var mobileConfig = AuthenticationConfiguration()
    
    
    //MARK: System methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
  public func setThemeWithMobileConfiguration(config:AuthenticationConfiguration)
    {
        self.imgHeaderLogo.image = config.logo
        self.lblHeaderLogin.text = config.text
        self.lblHeaderLogin.font = config.font
        self.lblHeaderLogin.textColor = config.textColor
        self.lblCountryCode.textColor = config.textColor
        self.viewHeader.backgroundColor = config.backgroundColor
        self.lblMobile.textColor = config.textColor
        self.tfMobileNum.placeholder = config.placeHolderText
        self.tfMobileNum.font = config.placeHolderFont
        self.tfMobileNum.textColor = config.placeHolderTextColor
        self.imgReminder.tintColor = config.imgIconColor
    }
    
    //MARK: Custom methods
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        tfMobileNum.delegate = self
        setupToolBar()
//        copyAndPasteNumber()
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundel = Bundle(for: Mobile_Number.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
    
    
    func setupToolBar(){
        let barBtn = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneBtnTapped(_ :)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        barBtn.items = [flexSpace,flexSpace,doneBtn]
        barBtn.sizeToFit()
        tfMobileNum.inputAccessoryView = barBtn
    }
    @objc func doneBtnTapped(_ tap:UITapGestureRecognizer){
        viewMobile.endEditing(true)
    }
    
    func copyAndPasteNumber(){
        guard let textFieldText = tfMobileNum.text else { return }
        let regex = try! NSRegularExpression(pattern: "\\d+")
        let matches = regex.matches(in: textFieldText, range: NSRange(textFieldText.startIndex..., in: textFieldText))
        let numbersOnly = matches.map { String(textFieldText[Range($0.range, in: textFieldText)!]) }.joined()
        UIPasteboard.general.string = numbersOnly
    }
    
    //MARK: IBAction
    @IBAction func mobileValidations(_ sender:UIButton){
        delegate?.sendPINAction()
        
    }
}

extension Mobile_Number:UITextFieldDelegate{
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfMobileNum{
            
            if range.location < 10{
                print("range",range.location)
                return true
            }else{
                return false
            }
        }else{
            return true
        }
    }
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
