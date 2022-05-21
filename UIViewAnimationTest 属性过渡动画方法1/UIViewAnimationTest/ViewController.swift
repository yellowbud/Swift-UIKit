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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //这里采用了后置闭包的写法
        UIView.animate(withDuration: 1) { //UIView中的animate(withDuration:,animations：)方法，第一参数：时长，第2个参数：要执行动画的过渡属性闭包
            self.animationView?.backgroundColor = UIColor.blue
        } //在这个闭包中，需要将要展示过渡动画的属性修改代码编写进去
    }

}


/*
 
 UIView层动画技术是iOS动画开发中比较上层的API，其封装性较强。在使用时，只要调用UIView的类方法，将需要进行的动画操作作为闭包参数传入即可。UIView层动画主要用于视图控件的属性过渡或视图切换，例如位置的移动、尺寸的渐变、透明度的渐变、背景色的渐变以及两个视图间的切换过渡动画等。
 
 //----------UIView 层的属性过渡动画--------------//
 
 所谓属性过渡动画，是指当视图控件的某些属性发生改变时，将改变过程以渐变的动画效果展现出来。
 首先在ViewController类中添加一个UIView视图属性，将这个视图作为执行动画的载体
 var animationView:UIView?
 
 

 touchesBegan(_ : , with: )方法在用户点击视图控制器的界面时会被调用，我们可以将动画执行的代码编写在这个方法中。当用户点击设备屏幕时，就会执行动画，这对测试动画效果十分方便。
 
 UIView类中封装的属性过渡动画方法主要有4个,其中最简单的实现方式：
 
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     //这里采用了后置闭包的写法
     UIView.animate(withDuration: 1) {
         self.animationView?.backgroundColor = UIColor.blue
     }
 }
 
 上面的示例代码中使用了UIView中的animate(withDuration:,animations：)方法。它需要两个参数：
 
 第1个参数为动画要执行的时长，第2个参数为要执行动面的过渡属性闭包。在这个闭包中，需要将要展示过渡动画的属性修改代码编写进去。
 animationView的初始背景色为红色，在闭包中将其背景色修改为蓝色，当执行动画时，animationView视图的背景色会在1秒内由红色过渡到蓝色。
 
 
 
 */
