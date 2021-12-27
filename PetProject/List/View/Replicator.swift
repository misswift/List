//
//  Replicator.swift
//  PetProject
//
//  Created by Халим Магомедов on 07.11.2021.
//

import Foundation
import UIKit

class Replicator: UIView {
    
    let replicatorLayer = CAReplicatorLayer()
    let sourceLayer = CALayer()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(sourceLayer)
        replicatorLayer.frame = self.bounds
        replicatorLayer.position = self.center
        sourceLayer.frame = CGRect(x: 0, y: 0, width: 3, height: 17)
        sourceLayer.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor
        sourceLayer.position = self.center
        sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
      }
    
    func startAnimation(delay: TimeInterval, replicates: Int) {
        replicatorLayer.instanceCount = replicates
        let angle = CGFloat(2.0 * Double.pi) / CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0.0, 1.0)
        replicatorLayer.instanceDelay = delay
        
        sourceLayer.opacity = 0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = Double(replicates)*delay
        opacityAnimation.repeatCount = Float.infinity
        sourceLayer.add(opacityAnimation, forKey: nil)
    }
    
}
