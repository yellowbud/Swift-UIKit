//
//  ViewController.swift
//  CALayerTest
//
//  Created by Huang Lei on 2022/3/23.
//CAShapeLayer是图形Layer层，开发者可以通过它自定义一些图形形状.以简单的三角形为例

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //创建图层
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint.zero
        //创建图形路径
        let path = CGMutablePath()
        //设置路径起点
        path.move(to: CGPoint(x: 100, y: 100))
        //进行画线
        path.addLine(to: CGPoint(x: 300, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 100, y: 100))
        //设置图层路径
        shapeLayer.path = path
        //设置图形边缘线条起点
        shapeLayer.strokeStart = 0
        //设置图形边缘线条终点
        shapeLayer.strokeEnd = 1
        //设置填充规则
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        //设置填充颜色
        shapeLayer.fillColor = UIColor.red.cgColor
        //设置边缘线条颜色
        shapeLayer.strokeColor = UIColor.blue.cgColor
        //设置边缘线条宽度
        shapeLayer.lineWidth = 1
        self.view.layer.addSublayer(shapeLayer)
        
        
        

    }
    
    
    
    


}


/*
 
每个UIView对象内部都封装了一个CALayer对象，因此可以直接将要测试的Layer作为子图层添加到这个CALayer对象上


 
 
*/
