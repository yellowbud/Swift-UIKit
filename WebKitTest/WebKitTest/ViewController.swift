//
//  ViewController.swift
//  WebKitTest
//
//  Created by Huang Lei on 2022/3/20.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKUIDelegate,WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body,message.name)
    }
    

    
    
    var progressView:UIProgressView?
    
    //声明wKwebView属性
    var wkView:WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建网页配置
        let configuration = WKWebViewConfiguration()
        
        //对网页视图进行实例化
        wkView = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(wkView!)
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        wkView!.load(request)
        
        //-----------------使用 WKProcessPool类为WKWebView实例配置一个进程池-----------------------------//
        //配置进程池.
        let processPool = WKProcessPool()
        configuration.processPool = processPool
        
        //---------------------对WKWebView实例进行自定义的偏好配置----------------------//
        //偏好配置
        let prefrence = WKPreferences()
        
        //设置网页界面的最小字号
        prefrence.minimumFontSize = 0
        
        //设置是否允许不经过用户交互由代码自动打开窗口。是否允许自动弹出网页
        prefrence.javaScriptCanOpenWindowsAutomatically = true
        
        configuration.preferences = prefrence
        
        //--------------------WKWebpagePreferences-------------------------------//
        
        let webpagePreferences = WKWebpagePreferences()
        //设置是否支持Javascript脚本
        webpagePreferences.allowsContentJavaScript = true
        
        configuration.defaultWebpagePreferences = webpagePreferences
        
        //可将WKPreferences类实例的javaScriptCanOpenWindowsAutomaticlly属性,简单理解为是否允许自动弹出网页
        
        //-----------使用 WKUserContentController类进行原生与JavaScript交互相关配置---------------//
        
        //进行原生与Javascript交互配置
        let userContentController = WKUserContentController()
        
        //设置代理并且注册要被Javascript代码调用的原生方法名称
        userContentController.add(self, name: "nativeFunc")
        
        //向网页中注入一段Javascript代码
        let javaScriptString = "function userFunc(){window.webkit.messageHandlers.nativeFunc.postMessage({\"banji\":\"xuet\"})};userFunc()"
            
        let userScript = WKUserScript(source: javaScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
      
        //进行注入
        userContentController.addUserScript(userScript)
        configuration.userContentController = userContentController
        
        /*
         
         WKUserContentController实例调用add(_:;name:)方法用于设置JavaScript方法回调的代理和要监听的方法名。
         在WebKit中注册了nativeFunc方法的监听，当JavaScript代码对nativeFunc进行调用时，就会通知WKScriptMessageHandler协议中约定的方法，开发者可进行后续的逻辑处理。
         
         WKUserContentController实例调用addUserScript（）方法用于向网页中注入JavaScript代码，其中注入的JavaScript代码是封装入 WKUserScript的对象，WKUserScript类的构造
         方法WKUserScript(source: ,injecttTime:,forMainFrameOnly:)第1个参数为注入的JavaScript代码字符串，第2个参数设置注入的时机，第3个参数设置是否只在主界面注入。注入的时机定义在如下枚举中：
         
         public enum WKUserScriptInjectionTime: Int {
             //在文档首部进行注入
             case atDocumentStart
             //在文档尾部进行注入
             case atDocumentEnd
         }
         
         上面的示例代码中注入的JavaScript代码如下：
         
         function userFunc(){
             window.webkit.messageHandlers.nativeFunc.postMessage({\"banji\":\"xuet\"})
         };
         userFunc()
         
         这段JavaScript代码创建了一个函数userFunc()，函数中向nativeFunc方法发送了一个字典消息,字典中的键为 “banji”,值为“xuet”，之后调用了userFunc()方法。
         这里手动向JavaScript注入了代码，代码的功能是与原生nativeFunc方法进行通信
         
        为ViewController类添加如下协议：
         class ViewController:UIViewController,WKScriptMessageHandler
         
         实现协议中的方法如下：
         func userContentController（_ userContentController:WKUserContentController, didReceive message: WKScriptMessage）{
                print (message.body, message.name)
         }
         
         当JavaScript代码向 Webkit中注册的交互方法发送消息后，系统会调用这个协议方法,这个方法会传入一个 WKScriptMessago类型的message参数，其中封装了传递的消息内容，WKScriptMessage类中提供的重要属性如下：
         
         public class WKScriptMessage: NSObject {
         
         //消息体，对应上面传递的字典
         @ NSCopying public var body: Any0bject { get }
         
         //此消息的网页视图来源
         weak public var webView: WKWebView? { get }
         
         //传递消息的方法名
         public var name: String { get }
         
         }
         
         开发者也可以使用原生代码来调用网页中的JavaScript方法，使用WKWebView类中的如下方法：
         
         public func evaluateJavascript（_ javaScriptString: String, completionHandler:((AnyObject?, NSError?) -> Swift.Void)? = nil)
         
         */
        
        //创建进度条控件
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 10))
        progressView?.progressTintColor = UIColor.green
        progressView?.progress = 0
        self.view.addSubview(progressView!)
        
        //对WKWebView实例的estimatedProgress属性进行监听
        wkView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView?.progress = Float (wkView!.estimatedProgress)
        }
    }
    
    /*
     KVO ( Key-Value-Observe，键值监听）是iOS开发中一种常用的属性监听技术，其通过设置监听者来监听某个类的某个属性，当属性值发生改变时就会通知监听者，在回调的通知方法中，开发者可以获取到所监听的属性值的相关信息。
     
     
     */
    
}


/*
 使用 WKWebViewConfiguration 对网页视图进行配置
 
 
 开发者一般不需要对进程池进行配置，配置为同一进程池中的 WKWebView实例会共享一些资源，进程池在需要使用多个WKWebView实例时会使用到.
 
 
 //----------WkWebView 中重要的属性和方法解析--------------//
 
 WKWebview中提供了backFor wardList属性，如下：
 
 public var backForwardList: WKBackForwardList ( get }
 
 WKBackForwardList类中存储了网页跳转中的各个网页节点，其中属性列举如下：
 
 //当前的网页节点
 public var currentItem: WKBackForwardListItem? ( get }
 
 //前进一个网页节点
 public var backItem: WKBackForwardListItem? ( get }
 
 //后退一个网页节点
 public var forwardItem: WKBackForwardListItem? ( get }
 
 //某个索引对应的网页节点
 public func item(at index: Int) -> WKBackForwardListItem ?
 
 //所有后退的网页节点组成的数组
 public var backList : [WKBackForwardlistItem] { get }
 
 //所有前进的网页节点组成的数组
 public var forwardList: [WKBackForwardListItem] { get }
 
 通过WKBackForwardList类，开发者可以方便获取在整个网页跳转过程中缓存的任意一个网页节点。WKWebView类实例调用如下方法可以跳转到任意一个网页节点：
 
 public func go (to item: WKBackForwardListItem) -> WKNavigation?
 
WKWebKit类中还有一个十分重要的属性estimatedProgress，这个属性是一个Double类型的值，代表了网页加载的进度。
在许多浏览器中都会有一个网页加载进度条，用户可以通过进度条得知当前网页的加载状态。在实际开发中，配合UIProgressView进度条控件与KVO技术就可以实现网页加载进度条功能。在ViewController类中添加UIProgressView属性如下：
 
 var progressView:UIProgressView?
 
 //-----------------------关于 WKUIDelegate 协议------------------------------------//
 
 WKUIDelegate协议是处理Javascript与 原生代码交互的一个重要协议，其中主要定义了一些与网页警告框有关的回调方法。重要方法列举如下：
 
 //当网页视图被创建时会调用
 func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
     <#code#>
 }
 
 //当网页视图被关闭时会调用
 func webViewDidClose(_ webView: WKWebView) {
     <#code#>
 }
 
 //JavaScript代码弹出alert（）警告框时会调用的原生方法，开发者处理完交互逻辑后，需要调用completionHandler()闭包进行返回
 func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler:() -> Void) {
     <#code#>
 }
 
 //Javascript代码弹出confirm(）确认框的时候会调用的原生方法，开发者处理完交互逻辑后，需要调用completionHandler()闭包，这个闭包中需要传入一个Bool类型的参数将用户选择的结果返回
 func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler:  (Bool) -> Void) {
     <#code#>
 }
 
 //JavaScript的prompt事件回调的原生方法，prompt会在网页中弹出输入框，开发者处理完交互逻辑后，需要调用completiontHandler()闭包将用户输入的信意回传
 func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler:  (String?) -> Void) {
     <#code#>
 }
 */

