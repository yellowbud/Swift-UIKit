//
//  ViewController.swift
//  UIViewAnimationTest
//
//  Created by Huang Lei on 2022/3/22.
//

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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        UIView.animate(withDuration: 1, animations: {
            //在1s内animationView 的背景色由红色过渡到蓝色
            self.animationView?.backgroundColor = UIColor.blue
        })  { (finish) in
            //这个闭包会在上一层动画执行完成后调用
            UIView.animate(withDuration: 2, animations: {
                //在2s内animationview 的中心点由 （150,150)移动到 (150,300)
                self.animationView?.center = CGPoint(x: 150, y: 300)
                
            })
            
        }
    }
        
}
        
    /*
    
     
     可以看到animationView首先执行了背景色的过渡动画，之后进行了位置平移动画。通过这个方法，开发者可以十分容易地实现组合动画效果。
     */
        
        
/*
  
 //----------UIView 层的属性过渡动画--------------//
 
 其可以让开发者在动面完成之后继续执行一些操作，通过这个方法，开发者可以十分方便地实现动画的嵌套执行
 
 
 */
