//
//  Extensions.swift
//  PetProject
//
//  Created by Халим Магомедов on 06.11.2021.
//

import Foundation
import UIKit


extension UIButton {
    convenience init(cornerRadius: CGFloat, title: String, borderWidth: CGFloat?, borderColor: CGColor? ) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderColor ?? nil
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UITextView {
    convenience init(borderWidth: CGFloat, borderColor: CGColor, font: CGFloat) {
        self.init()
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.contentInset = UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 0)
        self.font = UIFont.systemFont(ofSize: font)
      //  self.contentInset = contentInset
    }
    
    private func add(_ placeholder: UILabel) {
            for view in self.subviews {
                if let lbl = view as? UILabel  {
                    if lbl.text == placeholder.text {
                        lbl.removeFromSuperview()
                    }
                }
            }
            self.addSubview(placeholder)
        }
        
        func addPlaceholder(_ placeholder: UILabel?) {
            if let ph = placeholder {
                ph.numberOfLines = 1  // support for multiple lines
                ph.font = UIFont.italicSystemFont(ofSize: (self.font?.pointSize)!)
                ph.sizeToFit()
                self.add(ph)
                ph.frame.origin = CGPoint(x: 25, y: -15)
                ph.textColor = UIColor(white: 0, alpha: 0.3)
                updateVisibility(ph)
            }
        }
        
        func updateVisibility(_ placeHolder: UILabel?) {
            if let ph = placeHolder {
                ph.isHidden = !self.text.isEmpty
            }
        }
    
}
