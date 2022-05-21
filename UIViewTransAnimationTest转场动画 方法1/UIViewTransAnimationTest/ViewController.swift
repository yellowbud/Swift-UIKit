//
//  ViewController.swift
//  UIViewTransAnimationTest
//
//  Created by Huang Lei on 2022/3/23.
//

/*
 
 UIView层转场动画的应用。
 
 属性过渡动画通常用于视图属性改变，而视图本身没有切换的场景，而转场动画通常用于视图间切换的场景，或者视图本身没有切换但视图上的整体内容进行了切换的场景，这会给用户带来视图切换效果的错觉。
 
 在View Controller类中创建一个UIView类型的属性，用于动画演示的载体视图
 
 
 
 */




import UIKit

class ViewController: UIViewController {
    
    var animationView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建视图
        animationView = UIView(frame: CGRect(x: 20, y: 100, width: 280, height: 300))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.transition(with: animationView!, duration: 3, options: .transitionCurlUp, animations: {
            //这里可以进行视图上内容的重构
        }, completion: nil)
    }


}

/*
 
 UIView类的transition(_:,duration: ,options :,animations :, completion:)方法用于重构视图，其中第1个参数为要展现动画的视图；第2:动画执行的时间，第3个参数：设置动画的转场效果 ，第4个参数是 一个闭包，其可以编写抓场后要执行的代码，一般与视图的修改有关；最后一个参数为动画完成后的回调闭包。
 这个方法并不会切换掉原视图，只是在原视图上作了一个动画效果，可以将视图要改变部分的代码写在animations闭包中。
 如果animation闭包中什么都不写，视图依然会执行转场动画，只是转场后的视图与原视图表现一致。
 
 transition(_:,duration: ,options :,animations :, completion:)方法在做阅读类软件时作用很大，很多情况下，用户对图书的翻页操作并没有真正切换视图控制器，也没有切换视图，只是将当前视图上展示的内容进行了更换，这种场景使用转场动画将十分方便。

 
 
 */
