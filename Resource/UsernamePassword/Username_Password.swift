//
//  AuthView.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

protocol UserNamePasswordvalidateBtnDelegate{
    func validate(username:String,password:String,addView:UIViewController)
}

public class Username_Password: UIView {
    @IBOutlet weak public var usernameLbl:UILabel!
    @IBOutlet weak public var tfUsername:UITextField!
    @IBOutlet weak public var tfPassword:UITextField!
    @IBOutlet weak public var validateBtn:UIButton!
    @IBOutlet weak public var eyeImg:UIImageView!
    
    let nibName = "Username_Password"
    var delegate:UserNamePasswordvalidateBtnDelegate?
    
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
        setBtnStyle()
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    //MARK: Action
    @IBAction func validateBtnAction(_ sender:UIButton){
        
        if (Utility.shared.isValidateUsername(username:tfUsername.text!)){
            print("Username is valide")
            if (Utility.shared.isPhoneValide(phone: tfPassword.text!)){
                print("password is valide")
                print("Success")
            }
            else {
                Utility.shared.showAltersBtn(title: "Phone", msg: "Invalide Phone Number", firstAction: "OK", secondAction: "Done", firstComplition: {
                    //Action
                }, secondComplition: {
                    //Action
                }, viewController: UIViewController())
            }
        }else{
            Utility.shared.showAltersBtn(title: "UserName", msg: "Invalide User Name", firstAction: "OK", secondAction: "Done", firstComplition: {
                //Action
            }, secondComplition: {
                //Action
            }, viewController: UIViewController())
        }
    }
    
    //MARK: SetButtonStyle
    
    func setBtnStyle(){
        validateBtn.setTitle("Send PIN   -->", for: .normal)
        validateBtn.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 28)
    }
    

}
