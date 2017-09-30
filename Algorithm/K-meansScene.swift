//
//  K-meansScene.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/09/29.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

import Foundation
import SpriteKit

class KmeansScene: SKScene {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var point: [SKShapeNode] = []
    var pointCount = 20
    var cluster: [SKShapeNode] = []
    var clusterCount = 3
    var line: [SKShapeNode] = []
    var centerX = [CGFloat](repeating: 0, count: 3)
    var centerY = [CGFloat](repeating: 0, count: 3)
    var belongCluster: [Int] = []
//    var linearShapeNode: SKShapeNode!
//    var i: Int = 0
//    var j: Int = 0
//    var start: Bool = false
//    var end: Int = 0
//    let lineWidth: Double = 5.0
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        initDraw()
        initRandom()
        //line[i].removeFromParent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clusterMove()
//        for touch: AnyObject in touches {
//            let location = touch.location(in: self)
//            let touchedNode = self.atPoint(location)
//
//            if touchedNode.name == "Back" {
//                let newScene = FirstSelectorScene(size: self.frame.size)
//                self.view?.presentScene(newScene)
//            } else {
//                start = !start
//            }
//        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        if start == true && end != numeric.count - 1 {
//            self.removeAllChildren()
//
//        } else {
//
//        }
    }
    
    func initDraw() {
        let length = 5.0
        for i in 0..<pointCount {
            let h = (arc4random_uniform(UInt32(myBoundSize.height)))
            let w = (arc4random_uniform(UInt32(myBoundSize.width)))
            
            point.append(SKShapeNode(circleOfRadius: 5))
            point[i].position.x = CGFloat(w)
            point[i].position.y = CGFloat(h)
            point[i].fillColor = UIColor.white
            self.addChild(point[i])
        }
        
        for i in 0..<clusterCount {
            let h = (arc4random_uniform(UInt32(myBoundSize.height)))
            let w = (arc4random_uniform(UInt32(myBoundSize.width)))
            
            var points = [CGPoint(x:length, y:-length / 2.0),
                          CGPoint(x:-length, y:-length / 2.0),
                          CGPoint(x: 0.0, y: length),
                          CGPoint(x:length, y:-length / 2.0)]
            cluster.append(SKShapeNode(points: &points, count: points.count))
            cluster[i].position.x = CGFloat(w)
            cluster[i].position.y = CGFloat(h)
            cluster[i].fillColor = UIColor.blue
            self.addChild(cluster[i])
        }
    }
    
    func initRandom() {
        for i in 0..<pointCount {
            let tmp = Int(arc4random_uniform(UInt32(clusterCount)))
            lineDraw(point: point[i], cluster: cluster[tmp])
            belongCluster.append(tmp)
        }
    }
    
    func lineDraw(point: SKShapeNode, cluster: SKShapeNode) {
        var points = [CGPoint(x: point.position.x, y: point.position.y),
                      CGPoint(x: cluster.position.x, y: cluster.position.y)]
        line.append(SKShapeNode(points: &points, count: points.count))
        //linearShapeNode.lineWidth = CGFloat(lineWidth)
        self.addChild(line.last!)
    }
    
    func lineRemove() {
        for i in 0..<line.count {
            line[i].removeFromParent()
        }
    }
    
    func clusterMove() {
        center()
        
        for i in 0..<clusterCount {
            cluster[i].removeFromParent()
            
            cluster[i].position.x = centerX[i]
            cluster[i].position.y = centerY[i]
            self.addChild(cluster[i])
        }
    }
    
    func center() {
        var tmpX = [CGFloat](repeating: 0, count: clusterCount)
        var tmpY = [CGFloat](repeating: 0, count: clusterCount)
        var c = [Int](repeating: 0, count: clusterCount)
        for i in 0..<pointCount {
            for l in 0..<clusterCount {
                if belongCluster[i] == l {
                    tmpX[l] += point[i].position.x
                    tmpY[l] += point[i].position.y
                    c[l] += 1
                }
            }
        }
        for l in 0..<clusterCount {
            centerX[l] = tmpX[l] / CGFloat(c[l])
            centerY[l] = tmpY[l] / CGFloat(c[l])
        }
    }
}
