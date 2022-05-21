//
//  ViewController.swift
//  UISwitchTest
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         //UISwitch控件有其本身的UI样式，无须设置尺寸，只需要设置位置。
        //实例化开关控件
        let swi = UISwitch()
        //设置控件的位置。center属性用于设置视图控件的中心点坐标
        swi.center = CGPoint(x: 100, y: 100)
        //设置开启状态的颜色
        swi.onTintColor = UIColor.green
        //设置开关滑块的颜色
        swi.thumbTintColor = UIColor.purple
        //设置开关初始状态。isOn属性需要设置为Bool值，如果设置为true， 则开关控件的初始状态为开
        swi.isOn = true
        self.view.addSubview(swi)
        
        /*
         UISwitch控件也可以添加用户交互事件，和UIButton按钮控件不同的是，按钮控件监听的是用户手指触发的动作，而开关控件监听的是按钮的开关状态
         */
        swi.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
    }
    
    //在ViewController.swift类中实现change方法
    @objc func change(swi:UISwitch) {
        print("开关状态\(swi.isOn)")
    }

}

/*
 
 UISwitch控件又被称为开关控件，其在UI上表现为固定样式的按钮形状，在逻辑上只有开与关两种状态.
 
 
 
 */
