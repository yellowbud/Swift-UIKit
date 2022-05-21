//
//  ViewController.swift
//  20_UIAlertControllerTest
//
//  
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func popAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "我是警告框弹窗", message:"这里填写内容", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "登录", style: .default) { (action) in
            print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addTextField { (textField) in
            //在闭包中可以对UITextField进行配置
            textField.placeholder = "请输入用户名"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "请输入密码"
            //密码模式
            textField.isSecureTextEntry = true
        }
        self .present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func popSheet(_ sender: Any) {
        //使用弹窗风格的警告控制器
        let alertController = UIAlertController(title: "我是抽屉弹窗",message: "这里填写内容", preferredStyle: .actionSheet)
        let alertAction1 = UIAlertAction(title: "确定", style: .default) { (action) in
            print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        self .present(alertController, animated: true, completion: nil)
    }
}

