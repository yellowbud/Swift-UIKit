//
//  ViewControllerFour.swift
//  UITabBarController
//
//  Created by Huang Lei on 2022/3/18.
//

import UIKit

class ViewControllerFour: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "个人中心"
        
        //设置提示视图背景
        self.tabBarItem.badgeColor = UIColor.red
        
        //设置提示文字
        self.tabBarItem.badgeValue = "新消息"
        self.view.backgroundColor = UIColor.orange
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

/*
 -----------------------------标签栏上标签的溢出与排序功能-------------------------------------
 
 如果标签栏控制器中管理的视图控制器过多，标签栏上的标签会怎样排布呢?
 
 UITabBarController有自动处理标签溢出的功能，默认标签栏上最多可以并列展示5个标签。如果标签数量超出5个，便签栏上最后一个标签会变成一个系统管理的更多样式的标签，其内部会自动创建一个以表视图控制器作为根视图控制器的导航控制器，将溢出的标签以列表的形式排列其中。
 
 
 
 
 
 */
