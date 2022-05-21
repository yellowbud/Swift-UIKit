//
//  ViewController.swift
//  25_UIViewAnimation


import UIKit

class ViewController: UIViewController {
    var animationView:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化视图
        animationView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        //设置背景色
        animationView?.backgroundColor = UIColor.red
        //将其添加到当前界面视图上
        self.view.addSubview(animationView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
//        //这里采用了后置闭包的写法
//        UIView.animate(withDuration: 1) {
//          self.animationView?.backgroundColor = UIColor.blue
//        }
        
//        UIView.animate(withDuration: 1, animations: {
//                                                                  //在1s内 animationView的背景色由红色过渡到蓝色
//            self.animationView?.backgroundColor = UIColor.blue
//            }) { (finish) in
//                                                                  //这个闭包会在上一层动画执行完成后调用
//                UIView.animate(withDuration: 2, animations: {
//                    //在2s内 animationView的中心点由(150,150)移动到(150,300)
//                    self.animationView?.center = CGPoint(x: 150, y: 300)
//                })
//        }
//        UIView.animate(withDuration: 1, delay: 2, options: [UIView.AnimationOptions.repeat], animations: {
//                    self.animationView?.backgroundColor = UIColor.blue
//                    }, completion: nil)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                    self.animationView?.center = CGPoint(x: 150, y: 350)
                    }, completion: nil)
    }


}

