//
//  AddNewChild.swift
//  PetProject
//
//  Created by Халим Магомедов on 03.11.2021.
//

import Foundation
import UIKit

class AddNewChild: UIView {
    var label: UILabel = UILabel()
        var myNames = ["dipen","laxu","anis","aakash","santosh","raaa","ggdds","house"]

//        override init(){
//            super.init()
//        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            self.addCustomView()
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func addCustomView() {
            label.frame = CGRect(x: 50, y: 10, width: 200, height: 100)
            label.backgroundColor=UIColor.white
            label.textAlignment = NSTextAlignment.center
            label.text = "test label"
            label.isHidden = true
            self.addSubview(label)

            var btn: UIButton = UIButton()
            btn.frame = CGRect(x: 50, y: 120, width: 200, height: 100)
            btn.backgroundColor=UIColor.red
            btn.setTitle("button", for: .normal)
            btn.addTarget(self, action: "changeLabel", for: .touchUpInside)
            self.addSubview(btn)

            var txtField : UITextField = UITextField()
            txtField.frame = CGRect(x: 50, y: 250, width: 100,height: 50)
            txtField.backgroundColor = UIColor.gray
                   self.addSubview(txtField)
               }
}
