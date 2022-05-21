//
//  ViewController.swift
//  36_UserDefaultsTest
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取应用程序默认的userDefaults实例
        let userDefaults = UserDefaults.standard
        //进行url数据的存储
        userDefaults.set(URL(string: "http://www.baidu.com"), forKey: "urlKey")
        //进行字符串数据的存储
        userDefaults.set("stringValue", forKey: "stringKey")
        //进行Bool值数据的存储
        userDefaults.set(true, forKey: "boolKey")
        //进行Double类型数据的存储
        userDefaults.set(Double(0.1), forKey: "doubleKey")
        //进行Float类型数据的存储
        userDefaults.set(Float(1.5), forKey: "floatKey")
        //进行Int类型数据的存储
        userDefaults.set(5, forKey: "intKey")
        //进行字典数据的存储
        userDefaults.set(["1":"一"], forKey: "dicKey")
        //进行数组数据的存储
        userDefaults.set([1,2,3,4], forKey: "arrKey")
        //进行Data数据的存储
        userDefaults.set(Data(), forKey: "dataKey")
        //将操作进行同步
        userDefaults.synchronize()
        
        
        
        /*
         每一个应用程序，系统都会默认为其创建一个UserDefaults实例，通过UserDefaults类的standard
         属性可以拿到这个实例对象，通过它可以对常见类型的数据进行持久化存储。由于数据的存储操作
         与写入磁盘之间有一定的延时，调用synchronize（）方法可以将存储的数据立即同步到磁盘。
         
         
         
         
         
         */
        
    }


}

