//
//  ViewController.swift
//  18_UINavigationControllerTest
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.title = "第2个视图控制器"
        
        let item = UIBarButtonItem(title: "Pop", style: UIBarButtonItem.Style.plain, target: self, action: #selector(pop))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func pop() {
        //返回被弹出的视图控制器
        //self.navigationController?.popViewController(animated: true)
        //使用匿名变量接受 可以消除“返回值未使用”警告
        _ = self.navigationController?.popViewController(animated: true)
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
