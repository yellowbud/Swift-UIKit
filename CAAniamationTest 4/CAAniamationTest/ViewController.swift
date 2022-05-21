//
//  ViewController.swift
//  CAAniamationTest
//
//  Created by Huang Lei on 2022/3/24.
// CoreAnimation 框架中的转场动画与组合动画

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //创建转场动画实例
        let transAni = CATransition()
        
        //设置转场动画类型
        transAni.type = CATransitionType.push
        
        //设置转场动画方向
        transAni.subtype = CATransitionSubtype.fromTop
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(transAni,forKey:"")
        self.view.layer.addSublayer(layer)
    }
    


}

/*
 
 CoreAnimation 框架中的属性动画介绍
  
 CATransition类用来创建转场动画，与CAPropertyAnimation最大的区别在于属性过渡动画用于在图层属性发生变化时展示动画效果，而转场动画则是在Layer层出现时产生动画效果。
 
 
 
 CATranstion类的type属性用于设置转场动画的类型，可选常量如下：
 //渐入效果
 public static let fade: CATransitionType
 
 //移入效果
 public static let moveIn: CATransitionType
 
 //压入效果
 public static let push: CATransitionType
 
 //溶解效果
 public static let reveal: CATransitionType
 
 subtype属性主要用于设置转场动画执行的方向，可选常量如下：
 //从右侧执行
 public static let fromRight: CATransitionSubtype
 
 //从左侧执行
 public static let fromLeft: CATransitionSubtype
 
 //从上侧执行
 public static let fromTop: CATransitionSubtype
 
 //从下侧执行
 public static let fromBottom: CATransitionSubtype
 
 
*/
