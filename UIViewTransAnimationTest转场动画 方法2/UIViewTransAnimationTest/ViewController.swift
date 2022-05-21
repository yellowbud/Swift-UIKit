//
//  ViewController.swift
//  UIViewTransAnimationTest
//
//  Created by Huang Lei on 2022/3/23.
//

/*
 
 UIView层转场动画的应用。

 用于真正切换视图的转场动画方法
 
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
    
    //真正切换视图的转场动画方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let otherView = UIView(frame: CGRect(x: 20, y: 100, width: 280, height: 300))
        otherView.backgroundColor = UIColor.blue
        UIView.transition(from: animationView!, to: otherView, duration: 3, options: .transitionFlipFromRight, completion: nil)
    }
    /*
     
     UIView的类方法transition(from: , to: , duration: ,options: ,completion:)需要两个视图控件作为参数，from参数为被切换的视图，to参数为切换的目标试图，duration参数设置动画执行的时间，options参数设置转场动画的效果，completion参数设置动画执行完成后要执行的操作。
     这个方法的实质是将原视图控件从其父视图上移除，而将新的视图控件添加到原控件的父视图上，其动画效果实际上作用在它们的父视图上，这个方法可以直接切换整个视图控件，对于变化较大或者
     完全无关联的两种视图的内容切换十分有用。
     
     
     
     
     */
    


}

/*
 
 UIView类的transition(_:,duration: ,options :,animations :, completion:)方法用于重构视图，其中第1个参数为要展现动画的视图；第2:动画执行的时间，第3个参数：设置动画的转场效果 ，第4个参数是 一个闭包，其可以编写抓场后要执行的代码，一般与视图的修改有关；最后一个参数为动画完成后的回调闭包。
 这个方法并不会切换掉原视图，只是在原视图上作了一个动画效果，可以将视图要改变部分的代码写在animations闭包中。
 如果animation闭包中什么都不写，视图依然会执行转场动画，只是转场后的视图与原视图表现一致。
 
 transition(_:,duration: ,options :,animations :, completion:)方法在做阅读类软件时作用很大，很多情况下，用户对图书的翻页操作并没有真正切换视图控制器，也没有切换视图，只是将当前视图上展示的内容进行了更换，这种场景使用转场动画将十分方便。

 
 
 */
