//
//  ViewController.swift
//  UITabBarController
//
//  Created by Huang Lei on 2022/3/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //设置标签标题
        self.tabBarItem.title = "首页"
        
        //设置标签图标
        self.tabBarItem.image = UIImage(named: "imageNormal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        //设置选中状态下的标签
        self.tabBarItem.selectedImage = UIImage(named: "imageSelect")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        self.view.backgroundColor = UIColor.red
    }


}


/*
 
 导航控制器用于处理多个控制器为层级结构的情况。
 
 在实际开发中，并列结构的视图控制器也十分常见，层级结构的界面之间往往有一些或多或少的关联，可进行交互与传值等。
 并列结构的视图控制器之间往往没有什么必然联系，例如一款新闻类应用可以分为首页、推荐、直播和个人中心4个版块，这4个版块各自独立，在开发中就可以使用并列结构来处理这种情况。
 
 UITabBarController是一种容器视图控件，其可以管理多个视图控制器，UTabBarController进行管理的视图控制器为并列的关系。
 和导航类似，UITabBarController会默认生成一个标签栏，每一个标签对应一个视图界面，并且可以将UINavigationController作为并列关系的子视图控制器，实现多个导航结构的并列关系。
 
 首先打开Main.storyboard文件，将其中自动创建的View Controller删掉。找到视图控件模板中的Tab Bar Controller，将其拖入
 界面中，此时可以看到Storyboard界面上自动生成了一个TabBarController和两个ViewController
 
 TabBarController被称为标签栏控制器，因其中管理的视图控制器都是并列的，因此不存在根视图控制器的概念
 
 
 当项目首启动时，TabBarController 上除了第一个标签外，其余标签的标题并不是代码中所设置的那样，原因是前面的演示代码都写在 viewDidload()方法中，这个方法在
 视图控制器第一次展现在屏幕上之前是不会被调用的，只有读者点击过标签，其标题才会显示。因此在实际开发中，对标签控制器中标签标题的设置可以在视图控制器的构造方法中进行
 */
