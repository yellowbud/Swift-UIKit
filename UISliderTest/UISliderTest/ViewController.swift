//
//  ViewController.swift
//  UISliderTest
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let slider = UISlider(frame:CGRect(x: 20, y: 100, width: 280, height: 30))
        
        slider.maximumValue = 10
        slider.minimumValue = 0
        
        //初始化滑块控件的值
        slider.value = 5
        
//        //设置滑块左侧进度条的颜色
//        slider.minimumTrackTintColor = UIColor.red
//        slider.maximumTrackTintColor = UIColor.green
//
//        //设置滑块颜色
//        slider.thumbTintColor = UIColor.blue
        
        self.view.addSubview(slider)
        
        //设置滑块图片
        slider.setThumbImage(UIImage(named: "image"), for: .normal)
        
        //设置滑块左侧进度图片
        slider.setMinimumTrackImage(UIImage(named: "imageS"), for: .normal)
        
        slider.setMaximumTrackImage(UIImage(named: "imageS"), for: .normal)
        
        //UISlider控件的用户交互事件也是通过改变控件值来获知的
        slider.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
        
        slider.isContinuous = false
        //默认isContinuous属性 为true，即在滑动过程中UISlider控件的触发方法将不断被调用；设置isContinuous属性 为false，只有当用户手指离开滑块时， UISlider控件的触发方法才会被执行，并且直接获取到滑块停止时的值。
        
    }
    
    //在ViewController类中实现触发方法change()
    @objc func change(slider:UISlider) {
        print(slider.value)
    }
    
    //change()方法是连续不断执行的,表现在Xcode开发工具打印调试区的现象就是连续不断地打印输出UISlider当前的值.
    //但是，如果开发者只想在拖曳动作结束后触发用户交互的事件，可以通过设置UISlider的isContinuous属性做到。

}

/*
 滑块控件使用它可以方便地调节一些需要连续变化的数据。比如屏幕亮度的调节，用户可以通过滑动滑块来调节亮暗，并实时看到调节后的效果。
 
 与UISegementedControl、UISwitch等，UISlider控件值的变化可以是连续的。
 
 maximumValue属性用于设置滑块控件的最大值，minimumValue属性用于设置滑块控件的最小值，value属性用于设置滑块控件当前的值，
 默认情况下，滑块控件的初始值为0，即滑块在进度条的最左端。
 
 */
