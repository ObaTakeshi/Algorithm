//
//  K-meansScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/09/29.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class KmeansScene: SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var point: [SKShapeNode] = []
//    var linearShapeNode: SKShapeNode!
//    var i: Int = 0
//    var j: Int = 0
//    var start: Bool = false
//    var end: Int = 0
//    let lineWidth: Double = 5.0
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        pointDraw()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
//            let location = touch.location(in: self)
//            let touchedNode = self.atPoint(location)
//
//            if touchedNode.name == "Back" {
//                let newScene = FirstSelectorScene(size: self.frame.size)
//                self.view?.presentScene(newScene)
//            } else {
//                start = !start
//            }
//        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        if start == true && end != numeric.count - 1 {
//            self.removeAllChildren()
//
//        } else {
//
//        }
    }
    
    func pointDraw() {
        for i in 0...19 {
            let h = (arc4random_uniform(UInt32(myBoundSize.height)))
            let w = (arc4random_uniform(UInt32(myBoundSize.width)))
            
            point.append(SKShapeNode(circleOfRadius: 5))
            point[i].position.x = CGFloat(w)
            point[i].position.y = CGFloat(h)
            point[i].fillColor = UIColor.white
            self.addChild(point[i])
        }
        
    }
}
