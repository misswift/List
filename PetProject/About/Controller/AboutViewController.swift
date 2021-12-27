//
//  New.swift
//  ListForAvito
//
//  Created by Халим Магомедов on 18.09.2021.
//

import UIKit

class AboutViewController: UIViewController, CAAnimationDelegate, UIViewControllerTransitioningDelegate {
    
    let ai = Replicator(frame: CGRect(x: 100, y: 200, width: 10, height: 10))

    
    lazy var button: UIButton! = {
        let button = UIButton(cornerRadius: 50, title: "Внести данные", borderWidth: 1, borderColor: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
        //определяем размер кнопки и положение относительно фрейма вью
        button.frame = CGRect(x: 35 , y: 200, width: 320 , height: 80)
        // определяем цвет текста кнопки
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        //определяем шрифт и размер шрифта
        button.titleLabel?.font = UIFont(name: "AppleSDGhoticNeo-Thin", size: 30)
        //добавляем сист картинку и меняем цвет системной картинки чтоб она не менялась при тапе
        button.setImage( UIImage(systemName: "plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //определяем положение сис картинки
        button.imageEdgeInsets = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 55)
        //растягиваем картинку
        button.imageView?.contentMode = .scaleAspectFill
        //добавление действия перехода на следующую вью при нажатии на кнопку
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()
    
    @objc func tapped(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        //конечная точка анимации
        animation.toValue = 1
        //анимация длится 1 секунды
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        // чтобы анимация не пропала после завершения
        animation.isRemovedOnCompletion = false
        //подписываем нашу анимацию под делегата чтобы получить доступ к фукнциям
        animation.delegate = self
        //добавляем анимацию на нашу фигуру
        overShapeLayer.add(animation, forKey: nil)
    }
    
    //прописываем что произойдет по окончанию анимации
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let personDataVC = PersonData()
        //personDataVC.transitioningDelegate = AboutViewController()
        personDataVC.modalPresentationStyle = .custom
        present(personDataVC, animated: true, completion: nil)
        
    }
    
    //    func nextButton (){
    //        let personData =  PersonData()
    //           self.navigationController?.pushViewController(personData, animated: true)
    //
    //    }
    
    var shapeLayer: CAShapeLayer! {
        didSet{
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet{
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0.2
            let color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet{
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    override func viewDidLoad(){
        //добавляем градиентную заливку вью
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        self.definesPresentationContext = true
        //добавляем полоску
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        //добавляем перекрывающую полоску
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        // добавляем кнопку на вью
        self.view.addSubview(button)
        //nextButton()
        self.view.addSubview(ai)
        ai.startAnimation(delay: 0.1, replicates: 30)

    }
    
    override func viewDidLayoutSubviews() {
        //определяем размер фигуры при поворотах
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer){
        //прорисовываем положение фигуры в отдельной функции потому что нужны одинаковые координаты
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 ))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2 ))
        shapeLayer.path = path.cgPath
    }
    
    
}
