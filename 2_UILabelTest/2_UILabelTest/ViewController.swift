//
//  ViewController.swift
//  2_UILabelTest
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {// override可知是覆写父类的方法
        
        super.viewDidLoad() //viewDidLoad（）方法会在视图控制器已经加载时调用。一般会将视图控制器中控件的创建工作放入viewDidLoad（）方法中
        //创建UILabel控件对象
        //使用UILabel(frame:)构造方法进行UILabel控件的创建，其中frame参数为CGRect类型的矩形，CGReo(xy width:height)构造方法中前两个参数用于设置控件的x坐标与y坐标，坐标原点在左上角
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        //设置文本
        label.text = "我是一个普通的便签控件"
        //将其添加到当前视图上
        self.view.addSubview(label)
        
        //创建自定义的UILabel控件对象
        let label2 = UILabel(frame: CGRect(x: 20, y: 160, width: 200, height: 30))
        //设置文本
        label2.text = "我是一个自定义的便签控件"
        //设置字体 这里设置字号为20 加粗的系统字体
        label2.font = UIFont.boldSystemFont(ofSize: 20)
        //设置字体颜色
        label2.textColor = UIColor.red
        //设置阴影颜色
        label2.shadowColor = UIColor.green
        //设置阴影的位置偏移
        label2.shadowOffset = CGSize(width: 2, height: 2)
        //设置文字对齐模式
        label2.textAlignment = NSTextAlignment.center
        //将其添加到当前视图上
        self.view.addSubview(label2)
        
        //创建长文本的UILabel控件对象
          let label3 = UILabel(frame: CGRect(x: 20, y: 210, width: 200, height: 150))
          //设置文本
          label3.text = "我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本"
          //设置显示行数
          label3.numberOfLines = 7; //numberorLines属性用于设置显示的文本行数，如果设置为0，则代表不限制显示行数，但这并不表示UILabel控件的高度会自动扩展。如果文本行数总和的高度超出了控件本身的高度，文字依然会被截断。
          self.view.addSubview(label3)
        
        
        //上面的演示代码对UILabe控件中所有文本进行了统一设置，还支持对部分独立的文本进行个性化的设置。
        //创建UILabel控件对象
        let label4 = UILabel(frame: CGRect(x: 20, y: 390, width: 200, height: 30))
        //设置个性化文本
        let attri = NSMutableAttributedString(string: "我是个性化文本")
        attri.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: 2))
        attri.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor:UIColor.blue], range: NSRange(location: 3, length: 3))
        label4.attributedText = attri
        //将其添加到当前视图上
        self.view.addSubview(label4)
    }
}

/*
 使用了一个新的类NSMutableAttributedString，这个类用于配置个性化字符串，addAttribute（_;range:)方法用于追加个性化设置,其中第1个参数为个性化设置字典，第2个参数为此个性化设置在字符串中的生效范围。
 
 
 个性化字典的使用，系统已经为我们定义了许多属性键，开发者选择需要的属性并设置相关值即可，常用键名定义如下：
 
 设置字体，对应值为 UIFont 类型
 font
 
 设置段落风格，对应值为 NSParagraphStyle 类型
 paragraphStyle
 
 设置文本颜色，对应值为 UIColor 类型
 foregroundColor
 
 设置背景颜色，对应值为 UIColor 类型
 backgroundColor
 
 设置下画线风格，对应值为 NSNumber 类型
 underlineStyle
 
 设置阴影，对应值为 NSShadow 类型
 shadow
 
 设置超链接，对应值可以为 NSURL 或者 NSString 类型
 link
 
 设置下画线颜色，对应值为 UIColor 类型
 underlineColor
 
 
 

 
 */
