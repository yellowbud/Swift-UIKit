//
//  ViewController.swift
//  UIPickerView
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
  


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pickerView = UIPickerView(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        
        pickerView.delegate = self //设置代理 设置为控制器ViewController实例本身
        
        pickerView.dataSource = self //设罝数据源 设置为控制器ViewController实例本身
        
        self.view.addSubview(pickerView)
        
    }
    
    
    //通过协议方法，开发者可以十分灵活地设计UIPickerView控件的分组数与每个分组的行数
    
    //这个协议方法需要返回选择器控件每个分组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //这个协议方法需要返回选择器控件的分组数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //这个协议方法需要返回每个分组中每行数据的标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component+1)组第\(row)行"
    }
    
    //--------------可以对文本的属性进行自定义设置------------------//
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        //创建属性字符串
        let attri = NSMutableAttributedString(string: "第\(component+1)组第\(row)行")
        
        //为属性字符串添加颜色属性
        attri.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], range: NSRange(location: 0, length: attri.length))
        
        return attri
        
    }

    //实现上面的方法，可以将选择器控件上的文本修改为红色。这里需要使用到 NSMutableAttributedString 类，这个类专门用来创建属性字符串，其addAttributes（）方法可以追加属性设置，其中支持的属性有字体 文字颜色 下画线等
    
    
    //例如将UIPickerView中每条数据都以图片的方式展现，可实现如下协议方法：
    /*
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIImageView(image: UIImage(named: "image"))
        view.frame = CGRect(x: 0, y: 0, width: 110, height: 30)
        return view
    }
    */
    
    
    //开发者也可以自定义设置UIPickerView控件的行宽与行高，需要实现的协议方法如下：
    
    //设置选择器控件各个组的行宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 180
        }else{
            return 10
        }
    }
    
    //设置选择控件的行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
    }
}

/*
 
 其他控件通过 addTarget（）方法来完成交互，UIPickerView则不同，其主要是通过协议来实现控件配置及用户交互的，UIPickerView选择器是代理设计模式下的一款视图控件。
 
UIPickerView控件也支持自定义每条数据的内容视图，例如将UIPickerView中每条数据都以图片的方式展现，可实现如下协议方法：
 
 UIPickerView控件的核心配置都是通过协议方法来实现的，同样，其用户交互的功能也是通过协议方法来实现的。当用户滑动UIPickerView控件选中一条数据时，系统会调用如下协议方法，开发者可以在其中获取用户选择的数据信息：
 
 func piclerView（_ pickerView:UIPickerView, didSelectRow row: Int,inComponent component: Int）{
                print("用户选择了\(component）组\(row)行")
 }
 
 
 */

/*
 UPickerView类中封装了一些属性和方法，方便开发者对选择器控件进行控制以及对相关信息进行获取，常用属性与方法列举如下：
 
 //获取 UIPickerView 控件有多少个组
 public var numberOfComponents: Int { get }


 //获取 UIPickerview 控件某个组有多少行
 public func numberOfRows(inComponent component: Int) -> Int

 //获取 UIPickerView 某个组的行尺寸
 public func rowSize(forComponent component: Int) -> CGSize

 //获取某个分组某行的自定义视图，可能为 nil
 public func view(forRow row: Int, forComponent component: Int)-> UIView?

 //重新加载 UIPickerview 控件的全部分组数据
 public func reloadAllComponents()

 //重新加载 UIPickerview 控件的某个分组
 public func reloadComponent(_component: Int)

 //使用代码选中某个分组的某一行，可以决定是否带动画效果
 public func selectRow( row: Int, inComponent component: Int, animated: Bool)

 //获取某个分组用户选中的行
 public func selectedRow(inComponent component: Int)-> Int

 */



/*
 
 UIPickerView 在调用 reloadComponent()方法进行重新加载的时候，实际上是从头再次执行一遍协议方法.
 通常情况下，开发者会将 UIPickerView 上要显示的数据放入一个集合中,以便在协议方法中获取集合中的数据，当集合中的数据发生变化时，通过调用reloadComponent()方法，重新加載 UIPickerView 所有分组的数据，以实现界面的刷新操作。
 
 
 */
