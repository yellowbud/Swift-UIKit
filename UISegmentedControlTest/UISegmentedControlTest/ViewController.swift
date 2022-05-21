//
//  ViewController.swift
//  UISegmentedControlTest
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let segmentedControl = UISegmentedControl(items: ["按钮1","按钮2","按钮3","按钮4"])
        segmentedControl.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        segmentedControl.selectedSegmentTintColor = UIColor.blue
        self.view.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(sele), for: UIControl.Event.valueChanged)
        
        //插入新的文字item
        segmentedControl.insertSegment(withTitle: "按钮5", at: 0, animated: true)
        //向SegmentedControl中插入新的图片item
        segmentedControl.insertSegment(with: UIImage(named: "image")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), at: 4, animated: true)
        
        //删除某个位置的 item
        segmentedControl.removeSegment(at: 0, animated: true)
        
        //删除所有item
        segmentedControl.removeAllSegments()
        
        //修改某个item的图片
        segmentedControl.setImage(UIImage(named: "image")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),forSegmentAt: 1)
        
        //修改某个item 的标题
        segmentedControl.setTitle("new", forSegmentAt: 1)
        
        //为每个item设置不同的宽度
        let segmentedControl2 = UISegmentedControl(items: ["1","按钮","按钮按钮","按钮按钮按钮"])
        segmentedControl2.setWidth(8, forSegmentAt: 0)
        segmentedControl2.setWidth(32, forSegmentAt: 1)
        segmentedControl2.setWidth(85, forSegmentAt: 3)
        
        //UISegmentedControl类中提供了一种自适应宽度的方法,apportionSegmentWidthByContent属性为true，UISegmentedConrol会根据其中每个item内容的长短自动控制每个item的宽度
        segmentedControl2.apportionsSegmentWidthsByContent  = true
        
        
        
    }
    
    //sele方法实现如下：
    @objc func sele(seg:UISegmentedControl) {
        print("(选择了\(seg.selectedSegmentIndex)")
    }
    
   

}

/*
 
 UISegmentedControl控件在UI展现上为一组切换按钮，其常用于多界面切换的场景，用户选中UISegmentedControl控件中一个分部按钮后即可完成界面的切换。
 
 在创建UISegmentedControl控件实例时，需要开发者传入一个items数组参数，这个数组的元素可以是String类型或者UImage类型,如果是是String字符串，则会将其对应的按钮渲染为带文字标题的按钮，如果是UIImage类型，则会将其对应的按钮渲染为带图片背景的按钮。
 
 当用户点击分部控制器上的某个按钮后，默认此按钮一直保持选中状态。
 UISegmentedControl类中有一个名为isMomentary的布尔属性，这个属性默认为false
 
 如果开发者将其手动设置为true，则当用户按下按钮时，按钮会呈现选中状态，当用户抬起手指后，按钮又会变回正常状态，不再保持选中。
 
 给分部控制器添加用户交互事件的方法与UIPageControl一致，通过获取UISegmentedControl类的selectedSegmentIndex属性值来获知用户选择的按钮
 
 //-----------------UISegmentedControl 控件中按钮的增、删、改操作----------------------------//
 
 除了对UISegmentedControl类进行实例化时可以对其中的item进行设置外，UISegmentedControl还支持运行中对其中的按钮进行动态更新，更新操作主要包括增、删、改
 
 
 //----------------USegmentedControl控件中按钮的尺寸问题------------------//
 
 UISegementedControl中所有item是平均分配控件的总宽度的，无论item中标题的长短是多少。
 
 在ios开发中通常用什么方式来展示一组图片动画？
 1.UTTmageView 组件可以用来展示图片组。
 2.在使用 UImageView 进行图片展示时，要设置循环次数、图片组和动画时间。
 
 ios 开发中经常用什么组件来作为按钮使用？
 1.UIButton 是最基础的按钮组件，可以设置用户按下按钮、手指从按钮抬起、手指在按钮范围内外拖拽等事件的回调
 2.UISegmentedControl 也是一种按钮组件，其提供一组按钮可以进行切换
 3.UISwitch 是一种特殊的按钮组件，其也被称为开关组件，它有两种状态，分别表示开和关。
 
 */
