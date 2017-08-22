//
//  Scene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/02.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class BubbleSortScene: SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var numeric: [Int] = []
    var linearShapeNode: SKShapeNode!
    var i: Int = 0
    var j: Int = 0
    var start: Bool = false
    var end: Int = 0
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
        if start == true && end != numeric.count - 1 {
            self.removeAllChildren()
            bubblesort()
            lineDraw()
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
        for i in 0...Int(myBoundSize.width / CGFloat(lineWidth)) - 1 {
            numeric.append(i+1)
        }
        j = numeric.count - 1
    }
    
    func lineDraw() {
        for m in 0...numeric.count - 1 {
            var points = [CGPoint(x: Double(m)*lineWidth+lineWidth/2.0, y: 0),
                          CGPoint(x: Double(m)*lineWidth+lineWidth/2.0, y: Double(numeric[m])*1.4*lineWidth)]
            linearShapeNode = SKShapeNode(points: &points,count: points.count)
            linearShapeNode.lineWidth = CGFloat(lineWidth)
            if (m == j || m == i) && start == true {
                linearShapeNode.strokeColor = UIColor.red
            }
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
    
    func bubblesort() {
        if i >= numeric.count - 1 {
            i = 0
            end = 0
        }
        if j <= i {
            j = numeric.count - 1
            i += 1
        }
        if i < numeric.count - 1 {
            if j > i {
                if numeric[j] < numeric[j-1] {
                    let tmp = numeric[j]
                    numeric[j] = numeric[j-1]
                    numeric[j-1] = tmp
                } else {
                    if i == 0 {
                        end += 1
                    }
                }
                j -= 1
            }
        }
    }
}
