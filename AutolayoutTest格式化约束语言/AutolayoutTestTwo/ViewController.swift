//
//  ViewController.swift
//  AutolayoutTestTwo
//
//  Created by Huang Lei on 2022/3/25.
//
/*
 仅仅是将其个视图约束在界面的中心，开发者跳锅要織写大量的创建约束的代码，这种方式十分不直观，且工程代码复制冗余。
 VFL (Visual Format Language  格式化约束语言创建约束对象
 
 使用象形的方式帮助开发者将复杂的约束关系转换为NSLayoutConstraint约束对象。例加，如
 果要创建一个视图，将其左、上、右边距都设为60个单位，高度设为200个单位
*/

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
        
        let stringH = "H:|-60-[view]-60-|"
        let stringV = "V:|-160-[view(200)]"
        let constraintArrayH = NSLayoutConstraint.constraints(withVisualFormat: stringH, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["view":view])
        let constraintArrayV = NSLayoutConstraint.constraints(withVisualFormat: stringV, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["view":view])
        self.view.addConstraints(constraintArrayH)
        self.view.addConstraints(constraintArrayV)
        
        /*
         NSLayoutConstraint类中提供了constraints（）方法来将VFL字符串翻译成约束对象。
         这个方法中的withVisualFormat参数为VFL字符串，views参数要设置为VFL字符串中使用到的视图控件的名称与对应的视图控件对象的映射。
         在VFL语言中，H代表水平方向的约束，V代表竖直方向的约束，｜符号表示父视图的边沿，-60-表示相距60个单位的距离，[]内是要摆放的视图控件的名称，（）内为约束值
         上面的两句VFL代码可以解释为，约束视图的高度为200个单位，约束其距离父视图左、上、右边距为60个单位。
         */
        
        
        
        
//        //创建约束对象
//        let layoutConstraint = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
//
//        let layoutConstraint2 = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
//
//        let layoutConstraint3 = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
//
//        let layoutConstraint4 = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
//
//        //为当前界面添加约束
//        self.view.addConstraints([layoutConstraint,layoutConstraint2,layoutConstraint3,layoutConstraint4])
        
    }


}



