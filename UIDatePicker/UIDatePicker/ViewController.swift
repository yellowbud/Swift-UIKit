//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建UIDatePicker实例
        let dataPicker = UIDatePicker(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        
        //设置时间选择器的模式
        dataPicker.datePickerMode = UIDatePicker.Mode.countDownTimer
        
        self.view.addSubview(dataPicker)
        
        dataPicker.addTarget(self, action: #selector(sele), for: UIControl.Event.valueChanged)
        
    }

    //在交互方法中，开发者可以获取到用户选择的日期时间信息，示例如下：
    @objc func sele(datePicker:UIDatePicker) {
        //获取当前选择的日期或者时间
        let date = datePicker.date
        let time = datePicker.countDownDuration
        print(date,time)
    }

}

//UIDatePickerMode中的枚举值定义如下：
public enum UIDatePickerMode : Int {
    
    //时间模式
    case time
    
    //日期模式
    case date
    
    //日期与时间混合模式
    case dateAndTime
    
    //计时模式
    case countDownTimer
    
}

/*
 UIDatePicker控件在创建时将默认选中当前的系统日期和时间.也可以对UIDatePicker进行一些简单的初始配置,常用属性与方法列举如下：


设置控件的地区，不设置则默认为当前地区
public var locale: Locale?

设置控件的时区，不设置则默认为当前时区
public var timeZone: TimeZone?

控件选中的日期
public var date: Date

控件所显示的最小日期
public var minimumDate: Date?

控件所显示的最大日期
public var maximumDate: Date?

计时模式下的控件所显示的时间差
public var countDownDuration: TimeInterval

计时模式下的控件相邻时间的时间间隔
public var minuteInterval: Int
 
 
 虽然UIDatePicker在UI展现上和 UIPickerView十分相似，但它并不是UIPickerView的子类，也不可以通过协议的方式进行配置或用户交互。实际上， UIDatePicker继承
 自UIControl，其通过addTarget（）方法来添加用户交互事件
 */
