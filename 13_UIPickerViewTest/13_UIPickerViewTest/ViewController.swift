//
//  ViewController.swift
//  13_UIPickerViewTest
//
//  
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建选择器控件实例
        let pickerView = UIPickerView(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        //设置代理
        pickerView.delegate = self
        //设置数据源
        pickerView.dataSource = self
        //将选择器控件添加到当前视图上
        self.view.addSubview(pickerView)
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            //创建属性字符串
            let attri = NSMutableAttributedString(string: "第\(component+1)组第\(row)行")
            //为属性字符串添加颜色属性
        attri.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: attri.length))
            return attri
        }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//            let view = UIImageView(image: UIImage(named: "image"))
//            view.frame = CGRect(x: 0, y: 0, width: 110, height: 30)
//            return view
//        }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 110
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }

}

