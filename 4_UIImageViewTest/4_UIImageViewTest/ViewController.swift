//
//  ViewController.swift
//  4_UIImageViewTest
//
//  Created by Huang Lei on 2022/3/14.
/*
 
 可以通过图片素材名称创建UIImage实例，也可以通过Data数据或者文件路径来创建UIImage实例
 
 //通过图片素材名称创建 UIImage 实例.
 let image = UIImage(named: "imageName")
 
 ///通过文件路径创建 UIImage 实例
 let image2 = UIImage(contentsOfFile: "filePath")
 
 //通过 Data 数据创建 UTImage 实例
 let image3 = UIImage(data: Data())
 
 上面示例的3个构造方法中,使用图片素材名称作为参数的构造方法最为常用，
 
 创建了UTimage实例后，开发者可以通过UIimage类中的size属性获取图片的尺寸信息，示例如下：
 
 //获取图片尺寸，返回 CGsize 类型的结构体
 let size = image?.size
 
 */



import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "image")
        
        //创建 UIImageview 控件
        let imageView = UIImageView(image: image)
        
        //设置 UIImageview 控件的位置和尺寸
        imageView.frame = CGRect(x: 30, y: 30, width: 200, height: 200)
        
        //将控件添加在当前视图上
        self.view.addSubview (imageView)
        
        
        
        //创建一个数组，用于存放动画图片
        var imageArry = Array<UIImage>()
        
        //进行图片的循环创建
        for index in 1...8{
            
            //使用格式化的字符串进行创建
            let birdImage = UIImage(named: "bird\(index)")
            
            //将创建的图片添加进数组中
            imageArry.append(birdImage!)
        }
        
        //创建 UIImageView
        let birdImageView = UIImageView(frame: CGRect(x: 30, y: 250, width: 200, height: 100))
        
        //设置动画数组
        birdImageView.animationImages = imageArry
        
        //设置动画播放时长
        birdImageView.animationDuration = 3
        
        //设置动画播放次数
        birdImageView.animationRepeatCount = 0
        
        self.view.addSubview(birdImageView)
        
        //开始播放动画
        birdImageView.startAnimating()
        
    }


}

/*
 
 ----------------使用 Ullmage View 播放动画---------------
 UIImageView控件支持将一系列的图片快速切换，进而产生动画效果
 首先需要向工程中引入一系列动作连续的静态图片素材。需要注意：使用多张静态图片进行
 动画的创建时，导入的图片素材应规范命名并且遵循一定的规律，这样不容易出错且十分有利于代码的编写。
 
 
 
 */
