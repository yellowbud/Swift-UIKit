//
//  ViewController.swift
//  CAAniamationTest
//
//  Created by Huang Lei on 2022/3/24.
// 组合动面CAAnimationGroup十分简单，其用于对多个动画效果进行组合，使其同步展示

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //创建背景色过渡动画
        let basicAni = CABasicAnimation(keyPath: "backgroundColor")
        basicAni.toValue = UIColor.green.cgColor
        
        //创建形变动画
        let basicAni2 = CABasicAnimation(keyPath: "transform.scale.x")
        basicAni2.toValue = NSNumber(value: 2)
        
        //设置动画方向
        let groupAni = CAAnimationGroup()
        groupAni.animations = [basicAni,basicAni2]
        groupAni.duration = 3
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(groupAni, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    


}

/*
 
 CoreAnimation 框架中的属性动画介绍
  
 CATransition类用来创建转场动画，与CAPropertyAnimation最大的区别在于属性过渡动画用于在图层属性发生变化时展示动画效果，而转场动画则是在Layer层出现时产生动画效果。

 
 
*/
