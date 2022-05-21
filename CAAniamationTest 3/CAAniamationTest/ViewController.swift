//
//  ViewController.swift
//  CAAniamationTest
//
//  Created by Huang Lei on 2022/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let keyframeAni = CAKeyframeAnimation(keyPath: "transform.rotation.z")
//        keyframeAni.values = [NSNumber(value: 0),NSNumber(value: Double.pi/4),NSNumber(value: 0),NSNumber(value: Double.pi)]
//        keyframeAni.duration = 3
//        self.view.layer.add(keyframeAni, forKey: "")
        
        
        //UIView层动面中的阻尼动画，CoreAnimation框架中也支持，CASpringAnimation类继承自CABasicAnimation类，其用来创建弹簧效果的阻尼动画
        
        let springAni = CASpringAnimation(keyPath: "position.y")
        //模拟重物质量，必须大于 0，默认为 1，会影响惯性
        springAni.mass = 2
        //模拟弹簧劲度系数，必须大于 0，这个值越大则回弹越快
        springAni.stiffness = 5
        //设置阻尼系数，必须大于 0，这个值越大，回弹的幅度越小
        springAni.damping = 2
        springAni.toValue = 300
        springAni.duration = 3
        
        //创建演示动画的 Layer
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer)
        layer.add(springAni, forKey: "")
        
    }
    


}

/*
 
 CoreAnimation 框架中的属性动画介绍
 
 CAKeyframeAnimation动画与CABasicAnimation动画十分相似，不同的是CABasicAnimation动面只能设置动画属性变化的起始值与终止值,fromValue与toValue.
 
 而CAKeyframeAnimation动画则可以灵活设置多个过渡值，因此其又被称为关键帧动画。
 
 
 UIView层动面中的阻尼动画，CoreAnimation框架中也支持，CASpringAnimation类继承自CABasicAnimation类，其用来创建弹簧效果的阻尼动画
 
*/
