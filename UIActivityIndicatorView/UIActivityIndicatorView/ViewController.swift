//
//  ViewController.swift
//  UIActivityIndicatorView
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        
        activity.center = self.view.center
        
        //开始播放
        activity.startAnimating()
        
        //添加到当前视图
        self.view.addSubview(activity)
        
        activity.color = UIColor.green
    }


}

/*
 UIActivityIndicatorView活动指示器控件有一个更加形象的俗名风火轮。活动指示器是ios系统中自带动画的原生视图控件，其作用是提示用户某项任务正在进行中。
 在网络条件较差的情況下，网络数据的请求往往需要一定时间，为了告知用户当前请求正在进行，防止用户误操作而将应用程序关闭，通常会使用活动指示器来指示用户
 
 UActivity IndicatorView 控件有自己的UI尺寸，开发者只需要设置其位置即可.
 
 stopAnimating()方法后，活动指示器控件会自动隐藏，这个功能是由UIActivityIndicatorView的hidesWhenStopped属性控制的。
 hideWhenStopped属性需要设置为一个Bool，默认true，当活动指示器动画停止时，活动指示器本身也将隐藏
 如果设置为false，动画停止后，活动指示器则不会隐藏
 
 */
