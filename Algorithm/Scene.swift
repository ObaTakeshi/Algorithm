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
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        shokika()
        shuffle()
        lineDraw()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeAllChildren()
        bubblesort()
        lineDraw()
    }
    
    func shokika() {
        for i in 0...Int(myBoundSize.width / 5.0) {
            numeric.append(i+1)
        }
    }
    
    func lineDraw() {
        for i in 0...Int(myBoundSize.width / 5.0) {
            var points = [CGPoint(x: i*5, y: 0),
                          CGPoint(x: i*5, y: numeric[i]*7)]
            linearShapeNode = SKShapeNode(points: &points,count: points.count)
            linearShapeNode.lineWidth = 5.0
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
        for i in 0 ... numeric.count - 2 {
            for j in (i+1 ... numeric.count - 1).reversed() {
                if numeric[j] < numeric[j - 1] {
                    let tmp = numeric[j]
                    numeric[j] = numeric[j-1]
                    numeric[j-1] = tmp
                }
            }
        }
    }
    
    func arrayPrint() {
        for i in 0...Int(myBoundSize.width / 5.0) {
            print(numeric[i])
        }
    }
}
