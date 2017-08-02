//
//  Scene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/02.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class TestScene:SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var numeric: [Int] = []
    var linearShapeNode: SKShapeNode!
    var i: Int = 0
    var j: Int = 0
    var start: Bool = false
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        shokika()
        shuffle()
        lineDraw(comp1: -1, comp2: -1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        start = !start
    }
    
    override func update(_ currentTime: TimeInterval) {
        if start == true {
            self.removeAllChildren()
            bubblesort()
            lineDraw(comp1: j, comp2: j-1)
        }
    }
    
    func shokika() {
        for i in 0...Int(myBoundSize.width / 5.0 - 1) {
            numeric.append(i+1)
        }
        j = numeric.count - 1
    }
    
    func lineDraw(comp1: Int, comp2: Int) {
        for m in 0...numeric.count - 1 {
            var points = [CGPoint(x: Double(m)*5.0+2.5, y: 0),
                          CGPoint(x: Double(m)*5.0+2.5, y: Double(numeric[m]*7))]
            linearShapeNode = SKShapeNode(points: &points,count: points.count)
            linearShapeNode.lineWidth = 5.0
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
                }
                j -= 1
            }
        }
    }
}
