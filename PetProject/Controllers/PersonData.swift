//
//  ViewController.swift
//  PetProject
//
//  Created by Халим Магомедов on 02.11.2021.
//

import UIKit

class PersonData: UIViewController, UITextViewDelegate {
    
  
    let button: UIButton! = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 35 , y: 200, width: 320 , height: 80)
        button.setTitle("Добавить ребенка", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGhoticNeo-Thin", size: 30)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2054327252, green: 0.4428912012, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = button.frame.height/2
        button.setImage( UIImage(systemName: "plus"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 55)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(newChild), for: .touchUpInside)
        return button
    }()
    
    @objc func newChild (){
        //let view = UIView()
    }
    
    let notePlaceholder: UILabel = {
        let notePlaceholder = UILabel()
        notePlaceholder.text = "Имя"
        return notePlaceholder
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 35, y: 100, width: 320, height: 80)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
       // textView.text = "Имя"
        textView.contentInset = UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 17)

            return textView
    }()

    func textViewDidChange(_ textView: UITextView) {
        textView.updateVisibility(notePlaceholder)

        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(textView)
       
        textView.addPlaceholder(notePlaceholder)
    

        //textView.text = "something in code"
       
        // Do any additional setup after loading the view.
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


extension UITextView {
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
      ph.frame.origin = CGPoint(x: 15, y: -15)
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
