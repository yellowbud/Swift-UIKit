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

        let keyframeAni = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        keyframeAni.values = [NSNumber(value: 0),NSNumber(value: Double.pi/4),NSNumber(value: 0),NSNumber(value: Double.pi)]
        keyframeAni.duration = 3
        self.view.layer.add(keyframeAni, forKey: "")
        
    }
    


}

/*
 
 CoreAnimation 框架中的属性动画介绍
 
 CAKeyframeAnimation动画与CABasicAnimation动画十分相似，不同的是CABasicAnimation动面只能设置动画属性变化的起始值与终止值,fromValue与toValue.
 
 而CAKeyframeAnimation动画则可以灵活设置多个过渡值，因此其又被称为关键帧动画。
 
*/
