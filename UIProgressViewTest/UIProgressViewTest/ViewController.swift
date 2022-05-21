//
//  ViewController.swift
//  UIProgressViewTest
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建进度条控件实例
        let progressView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        
        //设置位置和宽度
        progressView.frame = CGRect(x: 20, y: 100, width: 280, height: 10)
        
        //设置当前进度
        progressView.progress = 0.5
        
        //设置已走过进度条颜色
        progressView.progressTintColor = UIColor.green
        
        //未走过进度条
        progressView.trackTintColor = UIColor.red
        
        self.view.addSubview(progressView)
        
        //开发者也可以通过设置图片来对UIProgressView的UI进行自定义
        
        //设置己走过进度的进度条图案
        progressView.progressImage = UIImage(named: "imageH")
        
        //未走过进度的进度条图案
        progressView.trackImage = UIImage(named: "imageN")
    }


}

/*
 UIProgressView控件并没有用户交互的功能，其只用来负责显示当前进度。在实际应用中，开发者需要根据事件完成的比例实时调整UIProgressViow控件的进度值。 UIProgresView中的progress属性就是用来设置进度条的进度的，progress属性类型为浮点值类型，其取值范围是0~1，默认为0，最大为1。
 
 
 */
