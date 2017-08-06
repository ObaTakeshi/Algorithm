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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first as UITouch? {
//            let scene = BubbleSortScene(size:self.frame.size)
            let scene = HeapSortScene(size:self.frame.size)
            self.view?.presentScene(scene)
        }
    }
}
