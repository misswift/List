//
//  ViewController.swift
//  PetProject
//
//  Created by Халим Магомедов on 02.11.2021.
//

import UIKit

class PersonData: UIViewController, UITextViewDelegate {
    
    
    let button: UIButton! = {
        let button = UIButton(cornerRadius: 50, title: "Добавить ребенка", borderWidth: 1, borderColor: #colorLiteral(red: 0.06270365313, green: 0.1854296108, blue: 1, alpha: 1))
        button.frame = CGRect(x: 35 , y: 200, width: 320 , height: 80)
       // button.setTitle("Добавить ребенка", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGhoticNeo-Thin", size: 30)
      //  button.layer.borderWidth = 1
      //  button.layer.borderColor = #colorLiteral(red: 0.2054327252, green: 0.4428912012, blue: 0.9686274529, alpha: 1)
      //  button.layer.cornerRadius = button.frame.height/2
        button.setImage( UIImage(systemName: "plus"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 55)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(newChild(sender: )), for: .touchUpInside)
        return button
    }()
    
    let firstNewChild = AddNewChild(frame: CGRect(x: 0, y: 300, width: 400, height: 300))
    let secondNewChild = AddNewChild(frame: CGRect(x: 0, y: 600, width: 400, height:300))
    let thirdNewChild = AddNewChild(frame: CGRect(x: 0, y: 900, width: 400, height: 300))
    let fourNewChild = AddNewChild(frame: CGRect(x: 0, y: 1200, width: 400, height: 300))
    let fiveNewChild = AddNewChild(frame: CGRect(x: 0, y: 1500, width: 400, height: 300))
    
    @objc func newChild (sender: UIButton){
        //за
//        let colorArray: [UIColor] = [.black, .blue, .cyan, .gray, .red]
        //меняя свойство button.tag заставляем повторно создавать вью на экране
        switch button.tag  {
        case 0:
            view.addSubview(firstNewChild)
//            firstNewChild.backgroundColor = colorArray[button.tag]
            button.tag += 1
        case 1:
            view.addSubview(secondNewChild)
//            secondNewChild.backgroundColor = colorArray[button.tag]
            button.tag += 1
        case 2:
            view.addSubview(thirdNewChild)
//            thirdNewChild.backgroundColor = colorArray[button.tag]
            button.tag += 1
        case 3:
            view.addSubview(fourNewChild)
//            fourNewChild.backgroundColor = colorArray[button.tag]
            button.tag += 1
        case 4:
            view.addSubview(fiveNewChild)
//            fiveNewChild.backgroundColor = colorArray[button.tag]
            button.tag += 1
        default:
            button.isHidden =  true
            
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(textView)
        
    }
    
  
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}





//extension UIView {
//    func allSubViews() -> [UIView] {
//        var all: [UIView] = []
//
//        func getSubview(view: UIView) {
//            all.append(view)
//            guard view.subviews.count > 0 else { return }
//            view.subviews.forEach{ getSubview(view: $0) }
//        }
//        getSubview(view: self)
//        return all
//    }
//}
