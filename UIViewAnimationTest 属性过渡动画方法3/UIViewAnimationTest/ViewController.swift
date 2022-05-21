//
//  ViewController.swift
//  UIViewAnimationTest
//
//  Created by Huang Lei on 2022/3/22.
//

/*
  
 //----------UIView 层的属性过渡动画--------------//
 
 UIView层的第三个属性过渡动画方法除了可以完成 第一种第二种方法的功能外，还可以进行动画参数与延时的配置
 
 
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
        UIView.animate(withDuration: 1, delay: 2, options: [UIView.AnimationOptions.repeat], animations: {
            self.animationView?.backgroundColor = UIColor.blue
        }, completion: nil)

    }
    /*

     设置动画的执行时间为1秒，延时2秒后开始执行，将动画设置为循环执行，即当第一次动画执行结束后，会马上从原始状态开始执行第二次动画。
     
     UIView层动画的options参数可以配置为一个数组，其中可以定义多个参数配置。
     
     UIViewAnimationOptions为一个结构体，其中定义了许多动画配置参数的静态属性，列举如下：


    
    public struct AnimationOptions : OptionSet {
        //---------------------------------这部分设罝动画基础属性--------------------------------------//
        
        //设置子视图随父视图展示动画
        public static var layoutSubviews: UIView.AnimationOptions { get }
        
        //设置动画在执行时允许用户与其交互
        public static var allowUserInteraction: UIView.AnimationOptions { get }
        
        //设置允许动画在执行时执行新的动画
        public static var beginFromCurrentState: UIView.AnimationOptions { get }
        
        //设置动画循环执行
        public static var 'repeat': UIView.AnimationOptions { get }
     
        //设置动画逆向执行
        public static var autoreverse: UIView.AnimationOptions { get }
     
        //设置强制使用内层动画的执行时间值
        public static var overrideInheritedDuration: UIView.AnimationOptions { get }
     
        //设置强制使用内层动画的变速效果
        public static var overrideInheritedCurve: UIView.AnimationOptions { get }
     
        //设置动画视图实时刷新
        public static var allowAnimatedContent: UIView.AnimationOptions { get }
     
        //设置视图在切换时隐藏，而不是移除
        public static var showHideTransitionViews: UIView.AnimationOptions { get }
     
        //不使用任何动画参数配置
        public static var overrideInheritedOptions: UIView. Animationoptions { get }
     
     
     //---------------------------------这部分设置动画执行的变速效果--------------------------------------//
     
     //淡入淡出效果
     public static var curveEaseInOut: UIView.Animationoptions { get }
     
     //淡入效果
     public static var curveEaseIn: UIView.Animationoptions { get }
     
     //淡出效果
     public static var curveEaseOut: UIView.AnimationOptions { get }
     
     //线性匀速执行
     public static var curveLinear: UIView.Animationoptions { get }
     
     //---------------------------------这部分设置视图转场效果--------------------------------------//
     
     //从左侧切入
     public static var transitionFlipFromLeft: UIView.Animationoptions { get }
     
     //从右侧切入
     public static var transitionFlipFromRight: UIView.Animationoptions { get }
     
     //从上到下立体翻入
     public static var transitionCurlUp:UIView.Animationoptions { get }
     
     //从下到上立体翻入
     public static var transitionCurlDown: UIView.AnimationOptions { get }
     
     //溶解效果
     public static var transitionCrossDissolve:UIView.Animationoptions { get }
     
     //从上侧切入
     public static var transitionFlipFromTop: UIView.Animationoptions { get }
     
     //从下侧切入
     public static var transitionFlipFromBottom: UIView.Animationoptions { get }

    }
     
     UIView层的属性过渡动画十分强大，其基本可以满足一般应用开发中的所有过渡效果，上面的代码只演示了背景色与位置的过渡动画，UTView层属性的过渡动画支持的所有属性如下：\
     
     frame：对视图位置和尺寸的修改执行过渡动画
     bounds：对视图的尺寸修改执行过渡动画。
     center：对视图的中心位置修改执行过渡动画。
     transform：对视图的形态变化执行过渡动画
     alpha：对视图的透明度修政执行过渡动画。
     backgroundColor：对视图的背景色修改执行过渡动画。
     contentStretch：对视图的内容拉伸方式修改执行过渡动画。
     
     其中contentStretch属性动画不太常用，只有在UIImageView控件中可能会用到，其他属性动画都十分常见。
     
    
}
        

    
     */
    
}
        

