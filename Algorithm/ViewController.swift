//
//  ViewController.swift
//  Algorithm
//
//  Created by 大庭　武志 on 2017/08/01.
//  Copyright © 2017年 ObaTakeshi. All rights reserved.
//

//import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let myView = MyView(frame: view.bounds)
//        myView.backgroundColor = UIColor.white
//        view.addSubview(myView)
        //SKViewを取得する。
        let skView = self.view as! SKView?
        
        //SKViewと同じサイズのSKSceneインスタンスを生成する。
        let scene = TestScene(size:(skView?.frame.size)!)
        
        //現在シーンを設定する。
        skView?.presentScene(scene)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class MyView2: MyView {
    override func draw(_ rect: CGRect) {
        
    }
}
class MyView: UIView {
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var numeric: [Int] = []
    
    override func draw(_ rect: CGRect) {
        shokika()
        shuffle()
        lineDraw()
        bubblesort()
//        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(1.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
//            self.lineShokika()
//        })
        lineDraw()
        
        
    }
    
    func shokika() {
        for i in 0...Int(myBoundSize.width / 5.0) {
            numeric.append(i+1)
        }
    }
    
    func lineDraw() {
        for i in 0...Int(myBoundSize.width / 5.0) {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: i * 5, y: Int(myBoundSize.height)))
            path.addLine(to: CGPoint(x: i * 5, y: Int(myBoundSize.height) - numeric[i] * 7))
            path.lineWidth = 5.0 // 線の太さ
            UIColor.black.setStroke() // 色をセット
            path.stroke()
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
