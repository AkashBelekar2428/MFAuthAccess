//
//  AuthenticationConfiguration.swift
//  MFAuthAccess
//
//  Created by Akash Belekar on 09/05/23.
//

import Foundation

//MARK: AuthenticationConfiguration
public class AuthenticationConfiguration{
    
    public var textAlignment : NSTextAlignment = .left
    public var font: UIFont = UIFont.systemFont(ofSize: 16)
    public var lblFirstFiledFont: UIFont =  UIFont.systemFont(ofSize: 18)
    public var lblSecondFiledFont: UIFont = UIFont.systemFont(ofSize: 18)
    public var textColor : UIColor = UIColor.brown
    public var numberOfLines: Int = 0
    public var text:String = "Login"
    public var logo:UIImage = UIImage(systemName: "homekit")!
    public var btnFont:UIFont = UIFont.systemFont(ofSize: 18)
    public var backgroundColor:UIColor = UIColor.yellow
    public var btnBackgroundColor: UIColor = UIColor.brown
    public var authType: String = "User"
    public var placeHolderText: String = "Enter Email"
    public var placeHolderPasswordText: String = "Enter Password"
    public var placeHolderTextColor: UIColor =  UIColor.brown
    public var imgIconColor: UIColor =  UIColor.brown
    public var placeHolderFont: UIFont =  UIFont.systemFont(ofSize: 18)
    public var pinText: String = "Please Enter Numbers"
    public var viewType: AuthType = .none
    
    public init() {}
}

//MARK: Enum
public enum AuthType{
    case pinView, email, mobile, authLog, none
    
}
