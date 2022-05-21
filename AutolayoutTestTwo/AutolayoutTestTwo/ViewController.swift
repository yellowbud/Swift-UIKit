//
//  ViewController.swift
//  AutolayoutTestTwo
//
//  Created by Huang Lei on 2022/3/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let view = UIView()
        //要使用自动布局，需要将视图的translatesAutoresizingMaskIntoConstraints 设置false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        //在添加约束之前，需要将视图添加到父视图上
        self.view.addSubview(view)
        //创建约束对象
        let layoutConstraint = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let layoutConstraint2 = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        
        let layoutConstraint3 = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        
        let layoutConstraint4 = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        
        //为当前界面添加约束
        self.view.addConstraints([layoutConstraint,layoutConstraint2,layoutConstraint3,layoutConstraint4])
        
    }


}

/*
 
 将一个自定义视图的宽度和高度都约束为200个单位,且将视图的位置约束到其父视图的中心。
 
 在使用代码进行Autolayout自动布局时，首先需要将自动布局的视图控件的translatesAutoresizingMaskIntoConstraints属性设置为false，并且在添加约束之前，将子视图添加到父视图上
 
 NSLayoutConstraint类用于创建具体的约束对象。其构造方法中，item参数为要添加约束的视图控件，attribute参数需设置为约束的属性，对应NSLayoutAttibute的枚举值。
 
 relatedBy参数为约束的方式，对应NSLayoutRelation类型的枚举
 
 toltem参数为其约束参照的另一个视图控件，其后的attribute参数为约束的属性。multiplier参数为要进行约束的比例，constant参数设置约束值。
 
 
 NSLayoutAttribute枚举中定义了所有可以进行约束的属性，常用列举如下：
 
 lef：左侧约束。
 right：右侧约束
 top：上侧约束。
 bottom：下侧约束。
 leading：正方向的边距约束。
 trailing：逆方向的边距约束。
 width：宽度约束。
 height：高度约束
 centerX：水平中心约束。
 centerY：竖直中心约束。
 notAnAttribute：无意义。
 
 其中notAnAttribute值用于不需要参照视图的约束中，例如约束某个控件的宽度与高度。
 NSLayoutConstraint构造方法的toltem参数可以设置为nil，其后的attribute参数就可以设置为notAnAttribute
 
 NSLayoutRelation枚举中定义的约束方式如下：
 
 public enum NSLayoutRelation : Int {
     //实际值要不大于约朿值
     case lessThanOrEqual
     
     //实际值严格等于约束值
     case equal
     
     //实际值不小于约束值
     case greatThanOrEqual
 }

 仅仅是将其个视图约束在界面的中心，开发者跳锅要織写大量的创建约束的代码，这种方式十分不直观，且工程代码复制冗余。
 VFL (Visual Format Language  格式化约束语言创建约束对象
 
 
 
 
*/

