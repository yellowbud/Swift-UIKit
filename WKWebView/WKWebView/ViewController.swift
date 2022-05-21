//
//  ViewController.swift
//  WKWebView
//
//  Created by Huang Lei on 2022/3/18.
//

import UIKit
import WebKit


class ViewController: UIViewController,WKUIDelegate {
    
        var webView: WKWebView?
        var buttonGoBack:UIButton!
        var buttonGoForward: UIButton!

//
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let myURL = URL(string: "https://www.apple.com")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
//    }
    
        override func viewDidLoad(){
        super.viewDidLoad()
            
        let webView = WKWebView(frame: self.view.bounds)
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        self.view.addSubview(webView)
            
            
            
            
    }


}

/*
 
 若要支持HTTP协议，需要在info.plist文件中配置相关参数。Info plist文件用于对工程进行一些功能配置
 
 向Info plist文件中添加一个配置项App Transport security Settings,向其中添加一个Boolean类型的键Allow Arbitary Loads，设置为YES
 
 
 
 */
