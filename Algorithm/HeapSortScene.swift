//
//  HeapSortScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/05.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class HeapSortScene: BubbleSortScene {
    var downHeapEnd: Bool = false
    
    override func didMove(to view: SKView) {
        shokika()
        shuffle()
        lineDraw()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if start == true && i != 1
        {
            self.removeAllChildren()
            heapsort()
            lineDraw()
        }
    }
    
    override func shokika() {
        numeric.append(0)
        for i in 0...Int(myBoundSize.width / 5.0 - 1) {
            numeric.append(i+1)
        }
        i = numeric.count - 1
        j = numeric.count / 2
    }
    
    override func lineDraw() {
        for m in 1...numeric.count - 1 {
            var points = [CGPoint(x: Double(m)*5.0-2.5, y: 0),
                          CGPoint(x: Double(m)*5.0-2.5, y: Double(numeric[m]*7))]
            linearShapeNode = SKShapeNode(points: &points,count: points.count)
            linearShapeNode.lineWidth = 5.0
            if m == i && start == true {
                linearShapeNode.strokeColor = UIColor.red
            }
            self.addChild(linearShapeNode)
        }
    }
    
    override func shuffle() {
        for i in 1...numeric.count - 1 {
            let tmp1 = Int(arc4random()) % (numeric.count - 1)
            if tmp1 != 0 {
                let tmp = numeric[tmp1]
                numeric[tmp1] = numeric[i]
                numeric[i] = tmp
            }
        }
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
