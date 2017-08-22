//
//  QuickSortScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/20.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

struct Stack {
    var items = [Int]()
    mutating func push(left: Int, right: Int) {
        items.append(left)
        items.append(right)
    }
    mutating func pop() -> (right: Int, left: Int) {
        return (items.removeLast(), items.removeLast())
    }
    
    mutating func empty() -> Bool {
        if items.isEmpty {
            return true
        } else {
            return false
        }
    }
}

class QuickSortScene: SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var numeric: [Int] = []
    var linearShapeNode: SKShapeNode!
    var i: Int = 0
    var j: Int = 0
    var pivot: Int = 0
    var start: Bool = false
    var stack = Stack()
    let lineWidth: Double = 5.0
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        shokika()
        shuffle()
        lineDraw()
        stack.push(left: 0, right: numeric.count - 1)
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
        if start == true && !stack.empty() {
            self.removeAllChildren()
            quicksort()
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
            if (m == pivot) {
                linearShapeNode.strokeColor = UIColor.yellow
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
    
    func quicksort() {
        let pop = stack.pop()
        let left = pop.left
        let right = pop.right
        pivot = numeric[(left + right) / 2]
        
        i = left
        j = right
        
        while (i <= j) {
            while (numeric[i] < pivot) {
                i += 1
            }
            while (numeric[j] > pivot) {
                j -= 1
            }
            if (i <= j) {
                let tmp = numeric[i]
                numeric[i] = numeric[j]
                numeric[j] = tmp
                i += 1
                j -= 1
            }
        }
        
        if (left < j) {
            stack.push(left: left, right: j)
        }
        if (i < right) {
            stack.push(left: i, right: right)
        }
    }
}
