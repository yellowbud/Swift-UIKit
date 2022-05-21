//
//  ViewController.swift
//  UIViewAnimationTest
//
//  Created by Huang Lei on 2022/3/22.
//

/*
  
 //----------UIView 层的属性过渡动画--------------//
 
 UIView类中添加创建阻尼动画的方法，有了这个方法，开发者可以方便地创建出类似弹簧效果的炫酷动画
 
 
 */



import UIKit

class ViewController: UIViewController {
    
    var animationView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初始化视图
        animationView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        //设置背景色
        animationView?.backgroundColor = UIColor.red
        
        //将其添加到当前界面视图上
        self.view.addSubview(animationView!)
    }
    
    //为了便于看到动画执行的效果，在ViewController类中实现如下方法

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,options: [],animations: {
            self.animationView?.center = CGPoint(x: 150, y: 350)
        }, completion: nil)
    }
 
}
        /*
         
         usingSpringWithDamping参数设置阻尼系数,其取值范围为0～1，1表示无弹回效果，0表示剧烈回弹效果
         
         initialSpringVelocity参数设置初始速度，取值范围也是 0～1
         
         */

