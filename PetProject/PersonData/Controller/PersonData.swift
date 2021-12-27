//
//  ViewController.swift
//  PetProject
//
//  Created by Халим Магомедов on 02.11.2021.
//

import UIKit

class PersonData: UIViewController, UITextViewDelegate {
    
    
    let addNewChildbutton: UIButton! = {
        let addNewChildbutton = UIButton(cornerRadius: 50, title: "Добавить ребенка", borderWidth: 1, borderColor: #colorLiteral(red: 0.06270365313, green: 0.1854296108, blue: 1, alpha: 1))
        addNewChildbutton.frame = CGRect(x: 35 , y: 200, width: 320 , height: 80)
        addNewChildbutton.titleLabel?.font = UIFont(name: "AppleSDGhoticNeo-Thin", size: 30)
        addNewChildbutton.setImage( UIImage(systemName: "plus"), for: .normal)
        addNewChildbutton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 55)
        addNewChildbutton.imageView?.contentMode = .scaleAspectFill
        addNewChildbutton.addTarget(self, action: #selector(newChild(sender: )), for: .touchUpInside)
        return addNewChildbutton
    }()
    
    let deleteButton: UIButton! = {
        let deleteButton = UIButton(cornerRadius: 50, title: "Удалить данные", borderWidth: 0, borderColor: nil)
        deleteButton.frame = CGRect(x: 25, y: 600, width: 320 , height: 80)
        deleteButton.titleLabel?.font = UIFont(name: "AppleSDGhoticNeo-Thin", size: 30)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 55)
        deleteButton.imageView?.contentMode = .scaleAspectFill
        deleteButton.addTarget(self, action: #selector(newChild(sender: )), for: .touchUpInside)
     //   deleteButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteButton
    }()
    
    let firstNewChild =  AddNewChild(frame: CGRect(x: 0, y: 300, width: 400, height: 250))
    let secondNewChild = AddNewChild(frame: CGRect(x: 0, y: 600, width: 400, height:250))
    let thirdNewChild =  AddNewChild(frame: CGRect(x: 0, y: 900, width: 400, height: 250))
    let fourNewChild =   AddNewChild(frame: CGRect(x: 0, y: 1200, width: 400, height: 250))
    let fiveNewChild =   AddNewChild(frame: CGRect(x: 0, y: 1500, width: 400, height: 250))
    
    // var scrollViewSize = view.frame.height
    
    var shapeLayer: CAShapeLayer! = { 
        let shapeLayer = CAShapeLayer()
            shapeLayer.lineWidth = 2
            shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        return shapeLayer
    }()
    
    
    
    @objc func newChild (sender: UIButton){
        //  let colorArray: [UIColor] = [.black, .blue, .cyan, .gray, .red]
        //меняя свойство button.tag заставляем повторно создавать вью на экране
        var ss = view.frame.height
        
        switch addNewChildbutton.tag  {
        case 0:
            view.addSubview(firstNewChild)
            view.addSubview(deleteButton)
            scrollView.addSubview(firstNewChild)
            ss += 250
            self.scrollView.contentSize = CGSize(width: view.frame.width, height: ss)
            addNewChildbutton.tag += 1
            
        case 1:
            view.layer.addSublayer(shapeLayer)
            view.addSubview(secondNewChild)
            scrollView.addSubview(secondNewChild)
            ss += 250
            self.scrollView.contentSize = CGSize(width: view.frame.width, height: ss)
            addNewChildbutton.tag += 1
        case 2:
            view.addSubview(thirdNewChild)
            scrollView.addSubview(thirdNewChild)
            ss += 250
            self.scrollView.contentSize = CGSize(width: view.frame.width, height: ss)
            addNewChildbutton.tag += 1
        case 3:
            view.addSubview(fourNewChild)
            scrollView.addSubview(fourNewChild)
            ss += 250
            self.scrollView.contentSize = CGSize(width: view.frame.width, height: ss)
            addNewChildbutton.tag += 1
        case 4:
            view.addSubview(fiveNewChild)
            scrollView.addSubview(fiveNewChild)
            ss += 500
            self.scrollView.contentSize = CGSize(width: view.frame.width, height: ss)
            addNewChildbutton.tag += 1
        default:
            addNewChildbutton.isHidden =  true
            
        }
    }
    
    let textView: UITextView = {
        let textView = UITextView(borderWidth: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), font: 17)
        textView.frame =  CGRect(x: 25, y: 100, width: 320, height: 80)
        textView.contentInset = UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 0)
        let notePlaceholder: UILabel = {
            let notePlaceholder = UILabel()
            notePlaceholder.text = "Имя"
            return notePlaceholder
        }()
        textView.addPlaceholder(notePlaceholder)
        return textView
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(addNewChildbutton)
        scrollView.addSubview(textView)
        scrollView.layer.addSublayer(shapeLayer)
        
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        //        deleteButton.topAnchor.constraint(equalTo: self.firstNewChild.bottomAnchor).isActive = true
        
        
        //        deleteButton.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
}


//    func actionSheet (){
//
//    let optionMenu: UIAlertController = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
//
//    let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
//        (alert: UIAlertAction!) -> Void in
//        print("Saved")
//    })
//
//    let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
//        (alert: UIAlertAction!) -> Void in
//        print("Deleted")
//    })
//
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
//        (alert: UIAlertAction!) -> Void in
//        print("Cancelled")
//    })
//    optionMenu.addAction(deleteAction)
//    optionMenu.addAction(saveAction)
//    optionMenu.addAction(cancelAction)
//        self.present(optionMenu, animated: true, completion: nil)
//    }
// устанавливаем дя вью закругленные края врех левый и нижний правый
// shapeLayer.backgroundColor = .init(red: 10, green: 10, blue: 10, alpha: 1)
// shapeLayer.path = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 30, height: 30)).cgPath
//
