//
//  ViewController.swift
//  35_RequestTest


import UIKit

class ViewController: UIViewController {
    //请求url 格式化字符串
    let urlString = "http://api.tianapi.com/wxnew/index?key=%@&num=1"
    //apikey  这里需要替换成有效的key
    let apikey = "cc1fe4c3da4e38cf4f50cfbfe9dexxxx"
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建请求配置
        let config = URLSessionConfiguration.default
        //创建请求URL
        let url = URL(string: String(format: urlString, apikey))
        //创建请求实例
        let request = URLRequest(url: url!)
        //创建请求Session
        let session = URLSession(configuration: config)
        //创建请求任务
        let task = session.dataTask(with: request) { (data, response, error) in
            let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(dictionary ?? "未解析到数据")
        }
        //激活请求任务
        task.resume()
    }


}

