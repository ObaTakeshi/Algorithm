//
//  FirstSelecterScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/03.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class FirstSelectorScene: SKScene {
    override func didMove(to view: SKView) {
        let label = SKLabelNode()
        label.text = "Visualized Algorithm"
        label.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.midY)!)
        self.addChild(label)
        
        let bubbleLabel = SKLabelNode()
        bubbleLabel.text = "BubbleSort"
        bubbleLabel.position = CGPoint(x: (self.view?.frame.maxX)! / 3 * 2, y: (self.view?.frame.maxY)! / 3 * 2)
        bubbleLabel.name = "BubbleSort"
        self.addChild(bubbleLabel)
        
        let heapLabel = SKLabelNode()
        heapLabel.text = "HeapSort"
        heapLabel.position = CGPoint(x: (self.view?.frame.maxX)! / 3, y: (self.view?.frame.maxY)! / 3)
        heapLabel.name = "HeapSort"
        self.addChild(heapLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if touchedNode.name == "BubbleSort" {
                let newScene = BubbleSortScene(size: self.frame.size)
                self.view?.presentScene(newScene)
            } else if touchedNode.name == "HeapSort" {
                let newScene = HeapSortScene(size: self.frame.size)
                self.view?.presentScene(newScene)
            }
        }
    }
}
