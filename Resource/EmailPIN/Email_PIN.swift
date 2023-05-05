//
//  PINView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import Foundation
import UIKit


public class Email_PIN:UIView{
    @IBOutlet weak public var PINView:UIView!
    
    let nibName = "Email_PIN"
 
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
        let bundel = Bundle(for: Email_PIN.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }

}
