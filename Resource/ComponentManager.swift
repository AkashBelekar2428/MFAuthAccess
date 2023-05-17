//
//  UtilityManager.swift
//  MFAuthAccess
//
//  Created by Akash Belekar on 11/05/23.
//

import Foundation

public protocol componentNavDelegate{
    func navigationComponet()
}

public class ComponentManager{
    
      public var navDelegate:componentNavDelegate?
//    public var mobileNumNav = Mobile_Number.init()
//    public var emailNav = Email_Address.init()
//    public var pinNav = PINView.init()
//    public var authNav = AuthenticationConfiguration.init()
    
    
    func navView(view:ComponentManager){
        navDelegate?.navigationComponet()
    }
    
    public init() {}
}
