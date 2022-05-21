//
//  ViewController.swift
//  CALayerTest
//
//  Created by Huang Lei on 2022/3/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //创建图层对象
        let gradientLayer = CAGradientLayer()
        //设置图层尺寸与位置
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        gradientLayer.position = CGPoint(x: 100, y: 100)
        //设置要进行色彩渐变的颜色
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor, UIColor.blue.cgColor]
        //设置要进行渐变的临界位置
        gradientLayer.locations = [NSNumber(value: 0.2),NSNumber(value: 0.5), NSNumber(value: 0.7)]
        //设置渐变的起始点与结束点
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        //添加到当前视图上
        self.view.layer.addSublayer(gradientLayer)
        
        
        
        
    }
    
    
    
    


}


/*
每个UIView对象内部都封装了一个CALayer对象，因此可以直接将要测试的Layer作为子图层添加到这个CALayer对象上

CAGradientLayer专门用来创建颜色新变的图层效果
 
 
 需要将CAGradientLayer类的locations属性设置为以NSNumber类型为元素的数组，其中的数组对象为从0~1递增，代表颜色渐变的临界比例。例如上面的示例代码的含义是当红色渲染到1/5后开始向绿色进行渐变，绿色渲染到1/2后开始向蓝色进行渐变，当到达7/10距离后完成渐变过程，开始渲染为纯蓝色。
 
 startPoint与endPoint属性用于设置渐变的起止位置，其取值范围也是0~1，通过这两个属性，开发者可以灵活控制渐变的方向，其(0,0)点为左上角，(1,1)点为右下角。如果读者需要让图层从对角线方向进行色彩渐变，修改这两个属性的代码如下：
 
 gradientLayer.startPoint = CGPoint (x: 0, y: 0)
 gradientlayer.endPoint = CGPoint (x: 1, y: 1)
 
*/
