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
        
        //创建动画实例，keyPath 为要进行属性动画的属性路径
        let basicAni = CABasicAnimation(keyPath: "transform.rotation.z")
        
        //从0度开始旋转
        basicAni.fromValue = NSNumber(value: 0)
        
        //旋转到180度
        basicAni.toValue = NSNumber(value:Double.pi)
        
        //设置动画播放的时长
        basicAni.duration = 2
        
        //将动画作用于当前界面的视图 Layer 层上
        self.view.layer.add(basicAni, forKey: nil)
        
    }
    


}

/*
 
 CoreAnimation 框架中的属性动画介绍
 
 
 CoreAnimation 框架中有十分重要的类CAAnimation,是CoreAnimation框架中各种动画类的父类。继承自她而来的动画类主要分为3部分：
 以CAPropertyAnimation类为体系的属性动画类
 以CATransition为体系的转场动画类
 和以CAAnimationGroup为体系的组合动画类

 首先，CAAnimation类中封装了许多与动画相关的基础属性与方法，例如动画执行的变速效果，动画执行过程的代理回调等。
 CAPropertyAnimation是CAAniamation的一个子类，其用于创建Layer的属性过渡动画。CAPropertyAnimation类所创建的属性动画是作用于Layer层之上的
 
 CAPropertyAnimation 类也有两个子类：CABasicAnimation类与CAKeyframeAnimation类，这两个类分别用于创建基础的属性过渡动画与关键帧属性过渡动画。
 
 CoreAnimation框架更为强大的原因在于其直接操作Layer层，而不是View层，因此可以十分便捷地实现UIView层难以做到的属性过渡动画，例如在三维坐标系内的翻转等。
 
 
 对CABasicAnimation类进行实例化时，keyPath参数需设置为进行动画操作的属性,其支持通过点语法对属性进行链式访问.
 例如transform.rotation.z代表的是图层变换属性中以z轴为中心轴的旋转属性。运行工程，可以看到当前界面视图在2秒内旋转了180度。
 
 CAKeyframeAnimation动画与CABasicAnimation动画十分相似，不同的是CABasicAnimation动面只能设置动画属性变化的起始值与终止值,即上面的示例代码中的fromValue与toValue.
 
 而CAKeyframeAnimation动画则可以灵活设置多个过渡值，因此其又被称为关键帧动画。
 
*/
