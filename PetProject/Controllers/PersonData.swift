//
//  ViewController.swift
//  PetProject
//
//  Created by Халим Магомедов on 02.11.2021.
//

import UIKit

class PersonData: UIViewController {
    
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
        return button
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "Имя"
        textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 17)
        return textView
    }()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(textView)
        self.view.addSubview(button)

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
