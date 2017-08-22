//
//  SleepSortScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/21.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class SleepSortScene: SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var numeric: [Int] = []
    var numericAlt: [Int] = []
    var linearShapeNode: SKShapeNode!
    var start: Bool = false
    var count: Int = 0
    let lineWidth: Double = 5.0
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        shokika()
        shuffle()
        lineDraw()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if touchedNode.name == "Back" {
                let newScene = FirstSelectorScene(size: self.frame.size)
                self.view?.presentScene(newScene)
            } else {
                start = !start
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (start == true && count == 0) {
            self.removeAllChildren()
            count += 1
        } else if (start == true && count != numeric.count + 1) {
            sleepsort(count: count)
            count += 1
        } else {
            back()
        }
    }
    
    func back() {
        let backLabel = SKLabelNode()
        backLabel.text = "Back"
        backLabel.fontSize = 20
        backLabel.position = CGPoint(x: 25, y: (self.view?.frame.maxY)! - 40)
        backLabel.name = "Back"
        self.addChild(backLabel)
    }
    
    func shokika() {
        for i in 0...Int(myBoundSize.width / CGFloat(lineWidth)) - 1  {
            numeric.append(i+1)
        }
    }
    
    func lineDraw() {
        for m in 0...numeric.count - 1 {
            var points = [CGPoint(x: Double(m)*lineWidth+lineWidth/2.0, y: 0),
                          CGPoint(x: Double(m)*lineWidth+lineWidth/2.0, y: Double(numeric[m])*7.0/5.0*lineWidth)]
            linearShapeNode = SKShapeNode(points: &points,count: points.count)
            linearShapeNode.lineWidth = CGFloat(lineWidth)
            self.addChild(linearShapeNode)
        }
    }
    
    func shuffle() {
        for i in 0...numeric.count - 1 {
            let tmp1 = Int(arc4random()) % (numeric.count - 1)
            let tmp = numeric[tmp1]
            numeric[tmp1] = numeric[i]
            numeric[i] = tmp
        }
    }
    
    func sleepsort(count: Int) {
        for m in 0...numeric.count - 1 {
            if (numeric[m] == count) {
                numericAlt.append(numeric[m])
                var points = [CGPoint(x: Double(numericAlt.count-1)*lineWidth+lineWidth/2.0, y: 0),
                              CGPoint(x: Double(numericAlt.count-1)*lineWidth+lineWidth/2.0, y: Double(numericAlt[numericAlt.count-1])*7.0/5.0*lineWidth)]
                linearShapeNode = SKShapeNode(points: &points,count: points.count)
                linearShapeNode.lineWidth = CGFloat(lineWidth)
                self.addChild(linearShapeNode)
            }
        }
    }
}
