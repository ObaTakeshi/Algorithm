//
//  HeapSortScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/05.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class HeapSortScene: SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var numeric: [Int] = []
    var linearShapeNode: SKShapeNode!
    var i: Int = 0
    var j: Int = 0
    var start: Bool = false
    var downHeapEnd: Bool = false
    let lineWidth: Double = 5.0
    
    override func didMove(to view: SKView) {
        shokika()
        shuffle()
        lineDraw()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if start == true && i != 1 {
            self.removeAllChildren()
            heapsort()
            lineDraw()
        } else {
            back()
        }
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
    
    func shokika() {
        numeric.append(0)
        for i in 0...Int(myBoundSize.width / CGFloat(lineWidth)) - 1 {
            numeric.append(i+1)
        }
    }
    
    func lineDraw() {
        for m in 1...numeric.count - 1 {
            var points = [CGPoint(x: Double(m)*lineWidth-lineWidth/2.0, y: 0),
                          CGPoint(x: Double(m)*lineWidth-lineWidth/2.0, y: Double(numeric[m])*1.4*lineWidth)]
            linearShapeNode = SKShapeNode(points: &points,count: points.count)
            linearShapeNode.lineWidth = CGFloat(lineWidth)
            if m == i && start == true {
                linearShapeNode.strokeColor = UIColor.red
            }
            self.addChild(linearShapeNode)
        }
    }
    
    func shuffle() {
        for i in 1...numeric.count - 1 {
            let tmp1 = Int(arc4random()) % (numeric.count - 1)
            if tmp1 != 0 {
                let tmp = numeric[tmp1]
                numeric[tmp1] = numeric[i]
                numeric[i] = tmp
            }
        }
        i = numeric.count - 1
        j = numeric.count / 2
    }
    
    func back() {
        let backLabel = SKLabelNode()
        backLabel.text = "Back"
        backLabel.fontSize = 20
        backLabel.position = CGPoint(x: 25, y: (self.view?.frame.maxY)! - 40)
        backLabel.name = "Back"
        self.addChild(backLabel)
    }
    
    func heapsort() {
        if downHeapEnd == false {
            if j > 0 {
                downHeap(start: j, end: numeric.count - 1)
            } else if j == 0 {
                downHeapEnd = true
            }
            j -= 1
        } else {
            if i >= 2 {
                let tmp = numeric[i]
                numeric[i] = numeric[1]
                numeric[1] = tmp
                downHeap(start: 1, end: i-1)
            }
            i -= 1
        }
    }
    
    func downHeap(start: Int, end: Int) {
        var start = start
        var pivot: Int
        var tmp: Int
        
        while 2*start <= end {
            if 2*start+1 > end {
                pivot = 2 * start
            } else {
                if numeric[2*start] > numeric[2*start+1] {
                    pivot = 2 * start
                } else {
                    pivot = 2 * start + 1
                }
            }
            if numeric[pivot] > numeric[start] {
                tmp = numeric[pivot]
                numeric[pivot] = numeric[start]
                numeric[start] = tmp
            } else {
                return
            }
            start = pivot
        }
    }
}
