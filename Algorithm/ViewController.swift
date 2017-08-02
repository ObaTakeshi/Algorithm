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
