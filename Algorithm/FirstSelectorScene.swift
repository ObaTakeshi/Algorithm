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
        label.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.maxY)! - label.fontSize * 1.5)
        self.addChild(label)
        
        let bubbleLabel = SKLabelNode()
        bubbleLabel.text = "BubbleSort"
        bubbleLabel.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.maxY)! / 4 * 3)
        bubbleLabel.name = "BubbleSort"
        self.addChild(bubbleLabel)
        
        let heapLabel = SKLabelNode()
        heapLabel.text = "HeapSort"
        heapLabel.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.maxY)! / 2)
        heapLabel.name = "HeapSort"
        self.addChild(heapLabel)
        
        let quickLabel = SKLabelNode()
        quickLabel.text = "QuickSort"
        quickLabel.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.maxY)! / 4)
        quickLabel.name = "QuickSort"
        self.addChild(quickLabel)
        
        let sleepLabel = SKLabelNode()
        sleepLabel.text = "SleepSort"
        sleepLabel.position = CGPoint(x: (self.view?.frame.midX)!, y: 0)
        sleepLabel.name = "SleepSort"
        self.addChild(sleepLabel)
        
        let kmeansLabel = SKLabelNode()
        kmeansLabel.text = "K-means"
        kmeansLabel.position = CGPoint(x: 0, y: 0)
        kmeansLabel.name = "K-means"
        self.addChild(kmeansLabel)
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
            } else if touchedNode.name == "QuickSort" {
                let newScene = QuickSortScene(size: self.frame.size)
                self.view?.presentScene(newScene)
            } else if touchedNode.name == "SleepSort" {
                let newScene = SleepSortScene(size: self.frame.size)
                self.view?.presentScene(newScene)
            } else if touchedNode.name == "K-means" {
                let newScene = KmeansScene(size: self.frame.size)
                self.view?.presentScene(newScene)
            }
        }
    }
}
