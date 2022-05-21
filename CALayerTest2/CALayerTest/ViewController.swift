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

            
        //创建拷贝图层
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.position = CGPoint.zero
        //创建内容图层
        let subLayer = CALayer ()
        subLayer.bounds = CGRect (x: 0, y: 0, width: 20, height: 20)
        subLayer.position = CGPoint (x: 30, y: 100)
        subLayer.backgroundColor=UIColor.red.cgColor
        replicatorLayer.addSublayer(subLayer)
        //设置每次拷贝将副本沿 ×轴平移 30个单位
        replicatorLayer.instanceTransform=CATransform3DMakeTranslation(30,0,0)
        //设置拷贝副本的个数
        replicatorLayer.instanceCount=10
        self.view.layer.addSublayer (replicatorLayer)
    }
    
    
    
    


}


/*
每个UIView对象内部都封装了一个CALayer对象，因此可以直接将要测试的Layer作为子图层添加到这个CALayer对象上

CAGradientLayer专门用来创建颜色新变的图层效果

CAReplicatorLayer类与普通的Layer略有不同，读者可以简单将其理解为一个拷贝视图容器，开发者可以通过它对其中的子Layer层进行拷贝并进行一些差异处理
例如，通过拷贝一个色块使界面展示平移排列的色块组
 
 实际上除了平移拷贝外，CAReplicaLayer也支持对其中的子Layer进行颜色渐变拷贝、3D变换拷贝，用它也可以轻松绘制出倒影效果
 
 
*/
