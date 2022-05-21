//
//  ViewController.swift
//  UIPageControlTest
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //实例化 UIPageControl
        let pageControl = UIPageControl(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        
        //设置页数
        pageControl.numberOfPages = 10
        
        //设置页码点的颜色
        pageControl.pageIndicatorTintColor = UIColor.green
        
        //设置选中页码点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        //设置当前选中的页码数
        pageControl.currentPage = 3
        
        self.view.addSubview(pageControl)
        
        pageControl.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
    }

    @objc func change(pageControl:UIPageControl) {
        print("当前所在页码\(pageControl.currentPage)")
    }
    //如上所示，在change方法中传入当前分页控制器，可以通过currentPage属性来获取当前选中的页码数
}

/*
 分页控制器通常与滑动视图结合使用，读者可以简单将其理解为页码点，应用于多页视图中，用于标识用户当前所在的分页位置。
 
 用户在点击分页控制器左半部分时，选中的页码点会向左移动；点击分页控制器右半部分时，选中的页码点会向右移动。
 实际开发中，在轮播广告中经常会使用这种效果。分页控制器的用户交互触发方式和UISwitch相似，开发者可以监听其页码值的改变，示例代码如下：
 
 添加用户交互事件
 pageControl.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
 
 */
