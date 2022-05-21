//
//  ViewController.swift
//  UINavigationController
//
//  Created by Huang Lei on 2022/3/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "第2个视图控制器"
        
        let item = UIBarButtonItem(title: "Pop", style: UIBarButtonItem.Style.plain, target: self, action: #selector(pop))
        
        self.navigationItem.rightBarButtonItem = item
        
        
    }
    
    @objc func pop() {
        
        //返回被弹出的视图控制器
        self.navigationController?.popViewController(animated: true)
        
        
        //使用匿名变量接收，可以消除“返回值未使用”警告
        _ = self.navigationController?.popViewController(animated: true)
    } //在第2个视图控制器中，点古导航栏上的Pop功能按钮与Back按钮的作用一样。
    
    /*
     在导航控制器中，除了可以进行界面的逐级跳转与返回外，也可以指定返回导航栈中的某一个ViewController。
     如果采用这种方式，则会将此ViewController上的所有视图控制器都弹出导航栈，方法如下：
     
     //弹出到某个指定的视图控制器，这个方法将会把所有被弹出的视图控制器以数组的形式返回
     
     public func popViewController(_viewController:UIViewController, animated:Bool) -> [UIViewController]?
     
     */
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
