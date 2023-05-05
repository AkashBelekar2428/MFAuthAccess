//
//  Google_Authenticator.swift
//  Reusable
//
//  Created by Akash Belekar on 28/04/23.
//

import UIKit

public class Google_Authenticator: UIView {
    let nibName = "Google_Authenticator"
 
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
        let bundel = Bundle(for: Google_Authenticator.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
    
}
