//
//  ViewController.swift
//  GIFAnimationTest
//
//  Created by Huang Lei on 2022/3/23.
//
//使用原生的 UlImageView 来播放 GIF 动态图

import UIKit
import ImageIO

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
                self.view.addSubview(imageView)
                self.playGIFOnImageView(name: "animation", imageView: imageView)
    }
    
    func playGIFOnImageView(name:String,imageView:UIImageView) {
        
        //创建素材路径
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        //通过路径创建素材 url
        let url = URL.init(fileURLWithPath: path!)
        //创建素材实例
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
        //获取素材中图片的张数
        let count = CGImageSourceGetCount (source!)
        
        //创建数组用于存放所有图片
        var imageArray = Array<UIImage>()
        
        //创建数组用于存放图片的宽度
        var imagesWidth = Array<Int>()
        
        //创建数组用于存放图片的高度
        var imagesHeight = Array<Int>()
        
        //用于存放GIF播放时长
        var time:Int = Int()
        
        //遍历素材
        for index in 0..<count {
            //从素材实例中获取图片
           let image = CGImageSourceCreateImageAtIndex(source!, index, nil)

            //将图片加入数组中
            imageArray.append(UIImage(cgImage: image!))
            
            //获取图片信息数组
            let info = CGImageSourceCopyPropertiesAtIndex(source!, index, nil) as!Dictionary<String,AnyObject>
            
            //获取宽高
            let width = Int(truncating: info[kCGImagePropertyPixelWidth as String]! as! NSNumber)
            let height = Int(truncating: info[kCGImagePropertyPixelHeight as String]! as! NSNumber)
            imagesWidth.append(width)
            imagesHeight.append(height)
            //获取时间信息
            let timeDic = info[kCGImagePropertyGIFDictionary as String] as! Dictionary<String,AnyObject>
            //进行时间累加
            time += Int(truncating: timeDic[kCGImagePropertyGIFDelayTime as String] as! NSNumber)
        }
        //重设imageView尺寸
        //由于大部分GIF文件中的图片尺寸相同 这里随便取一个即可
        imageView.frame = CGRect(x: 0, y: 100, width: imagesWidth[0], height: imagesHeight[0])
        //进行动画播放
        imageView.animationImages = imageArray
        imageView.animationDuration = TimeInterval(time)
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        }
        
    


}

/*
 
 ##通过GIF文件播放动画
 GIF是一种常用的动态图文件格式。iOS开发框架中没有现成的接口供开发者展示。
 UIImageView类专门来负责图片数据的渲染，同时提供了播放一组图片的帧动画接口。
 我们可以通过两种方式来播放Gif动态图：
 一种方式是通过ImageIO框架中的方法将GIF文件文件中的数据解析成图片数组，使用UIImageView的帧动画接口进行播放
 另一种方式是直接通过WKWebView来渲染GIF图，使用浏览器提供的引擎进行播放
 
 ###使用原生的 UIImageView 来播放GIF动态图
 GIF动态图文件中包含一组图片及信息，其中的信息主要用来记录每一帧图片的播放时长。如
 果开发者在获取到GIF文件中所有图片素材的同时又获取到每一帧图片播放的时间，就可以使用UIImageView类对其进行帧动画的播放。
 
 ImageIO是ios中专门用来处理图片的框架，其中代码比较底层。
 在ViewController类中封装一个方法，用来对GIF文件进行解析并且将解析后的数据填充到UIImageView实例中进行动画的播放
 
 */

/*
 通过解析GIF文件中的数据来获取图片数组、图片尺寸和播放一轮动画所需要的时间
 
 
 */
