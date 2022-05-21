//
//  ViewController.swift
//  UIAlertController
//
//  Created by Huang Lei on 2022/3/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //创建了一个UIAlertController实例并向其中加入了两个交互按钮UTAlertAction
    @IBAction func popAlert(_ sender: Any){
        let alertController = UIAlertController(title: "我是警告框弹窗", message: "这里填写内容", preferredStyle: .alert)
        
        let alertAction1 = UIAlertAction(title: "登录", style: .default){
            (action) in
            print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        
        alertController.addTextField { (textField) in
            //在闭包中可以对UITextField进行配置
            textField.placeholder = "请输入用户名"
        }
        
        alertController.addTextField{ (textField) in
            textField.placeholder = "请输入密码"
            //密码模式
            textField.isSecureTextEntry = true
            
        }
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func popSheet(_ sender:Any){
        //使用弹窗风格的警告控制器
        let alertController = UIAlertController(title: "我是抽屉弹窗", message: "这里填写内容", preferredStyle: .actionSheet)
        
        let alertAction1 = UIAlertAction(title: "确定", style: .default)
        { (action) in
            print(alertController.textFields?.first?.text ?? "未输入文宇")
        }
        
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    //actionSheet风格的UIAlertController会以上拉抽屉的方式展现
}



/*
 
 -----------------警告视图控制器的应用-------------------
 
 警告视图控制器是ios开发中一种特殊的视图控制器， UAlertController实例的创建和正常的UIViewController有很大差异。首先从功能上讲，其并不是为了管理和组合视图，其作用更像是一个独立的视图控件；从UI展现上讲，UIAlettController有两种表现形式，分别是警告框弹窗和上拉抽屉弹窗。警告视图控制器被应用在需要用户进行选项选择或操作确认的场景中。
 
 -----------------认识 UIAlertAction类-------------------
 
 学习UTAlertController控制器首先要了解UTAlertAction类。
 首先， UIAlertController的主要作用是创建弹窗，弹窗展现后，上面都会提供一些按钮或者其他用户交互控件供用户进行操作。用户的操作行为可以理解为Action，因此，UIAlertAction的作用是处理用户交互行为。
 
 UIAlertAction类只有一个构造方法，在构造方法中，开发者需要完成对UIAlertAction实例的标题、风格以及用户交互回调方法的设置
 
 let action = UIAlertAction(title: "按钮一", style: UIAlertAction.Style.default)
 {
     (action) in
     print("用户点击了按钮一")
 }
 
 
 第1个参数需要传递一个字符串值，其会作为标题显示在弹窗的用户交互按钮上
 第2个参数设置此交互按钮的显示风格，需要设置为UTAlertAction.Style类型的枚举值
 第3个参数为一个闭包，在此闭包中，开发者可以写入用户点击此按钮后执行的代码。
 
 UIAlertActionStyle枚举值及意义列举如下：
 
 public enum Style : Int {
     
     case 'default'
     
     //取消按钮风格
     case cancel
     
     //消极按钮风格
     case destructive
 }
 
 UIAlertAction类的设计十分简洁，除了构造方法中设置的属性外，UIAlertAction类中还有一个isEnabled的布尔类型属性，这个属性可以控制此交互按钮的状态是否为可用。
 
 
 ------------------------------------使用 UIAlertController 创建警告框弹窗-------------------------------------------------
 
 UIAlertController的功能之一便是快捷创建警告框弹窗
 
 UIAlertAction就是一个封装了UI和交互方法的类，当警告框弹窗中的按钮个数超出两个时，按钮的排列方式将由水平排列变为坚直排列
 
 除了展现简单的警告标题和警告信息外，开发者还可以在警告框上设置一个文本输入框，这个特点可以帮助开发 者方便地开发登录框控件，将popAlert()方法中的代码修改如下：
 
 UIAlertController 类中的addTextField()方法只能在警告控制器的风格为 Alert 时才可以使用,抽屉弹窗是不可以添加文本输入框的，否则运行时将产生错误，造成程序崩溃。
 
 */
