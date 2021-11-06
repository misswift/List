//
//  AddNewChild.swift
//  PetProject
//
//  Created by Халим Магомедов on 03.11.2021.
//

import Foundation
import UIKit

@IBDesignable //маска для быстрого просмотра изменений в классе
class AddNewChild: UIView, UIActionSheetDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        //        let shapeLayer = CAShapeLayer()
        //устанавливаем дя вью закругленные края врех левый и нижний правый
        //        shapeLayer.backgroundColor = .init(red: 10, green: 10, blue: 10, alpha: 1)
        //        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        //        //добавляем наши вью для отображания
        addSubview(nameTextView)
        addSubview(ageTextView)
        addSubview(button)
        //        layer.mask = shapeLayer
    }
    
    let nameTextView: UITextView = {
        let textView = UITextView(borderWidth: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor, font: 17)
        textView.frame = CGRect(x: 25, y: 10, width: 320, height: 80)
        textView.contentInset = UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 0)
        let notePlaceholder: UILabel = {
            let notePlaceholder = UILabel()
            notePlaceholder.text = "Имя"
            return notePlaceholder
        }()
        textView.addPlaceholder(notePlaceholder)
        return textView
    }()
    
    
    
    
    let ageTextView: UITextView = {
        let textView = UITextView(borderWidth: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor, font: 17)
        textView.contentInset = UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 0)
        textView.frame =  CGRect(x: 25, y: 100, width: 320, height: 80)
        let notePlaceholder: UILabel = {
            let notePlaceholder = UILabel()
            notePlaceholder.text = "Возраст"
            return notePlaceholder
        }()
        textView.addPlaceholder(notePlaceholder)
        return textView
    }()
    
    let button: UIButton! = {
        let button = UIButton(cornerRadius: 50, title: "Удалить", borderWidth: 0, borderColor: nil)
        button.frame = CGRect(x: 35 , y: 200, width: 320 , height: 80)
        button.titleLabel?.font = UIFont(name: "AppleSDGhoticNeo-Thin", size: 30)
        button.imageEdgeInsets = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 55)
        button.addTarget(self, action: #selector(deleteChild(sender: )), for: .touchUpInside)
        return button
    }()
    
    
    @objc func deleteChild(sender: UIButton){
        nameTextView.text = nil
        ageTextView.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
