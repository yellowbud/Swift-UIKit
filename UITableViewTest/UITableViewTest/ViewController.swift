//
//  ViewController.swift
//  UITableViewTest
//
//  Created by Huang Lei on 2022/3/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray:Array<String>?
    
    //设置列表有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    //设置每行数据的数据载体Cell视图.每一行的具体UI展现。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //根据注册的cell类Id值获取载体cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        
        //进行标题的设置
        cell.textLabel?.text = dataArray?[indexPath.row]
        return cell
    }
    

   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //对数据源进行初始化
        dataArray = ["第一行","第二行","第三行","第四行","第五行"]
        
        //创建UITableview实例。控件的位置和尺寸，控件的风格
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        
        //注册cell。UITableView类中的register(_:，forCellReuseldentifier:)用于进行数据载体Cell的注册，其进行注册的Cell类需要在对应协议方法中返回。
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        //第一个参数需传入Class类型的数据；第二个参数为一个字符串类型的ID值，通过ID值可以获取注册的Cell类对应的实例。
        
        self.view.addSubview(tableView)
        
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //设置分区的头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120))
        view.backgroundColor = UIColor.red
        return view
    }
    
    //设置分区的尾部视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        view.backgroundColor = UIColor.green
        return view
    }
    
    //设置分区头部视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    //设置分区的尾部视图高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    

}

/*
 
 列表视图 UITableView 的应用
 
 列表视图在ios应用程序中十分常见，例如电商类应用中的商品列表、资讯类应用中的新闻列表、阅读类应用中的文章列表等。
 UITableView视图控件用来进行有关列表视图的相关功能开发。
 UITableView是一个较为复杂的视图控件，其主要以列表的方式展示一组或多组数据，其数据的填充和界面的渲染都是通过相关的协议方法来实现的。
 
 //------------------创建 UITableView 列表----------------------//
 
 UITableView 类继承自UIScrollView 类。因此，UITableView其实也是滚动视图，不过UITableView只支持竖直方向的滚动，并且其内部的子视图是多条数据载体 UITableViewcell。UITableViewCell类用于创建UITableView中每条数据具体对应的视图。
 
 首先，在ViewController类中添加一个数组属性，作为列表中填充数据的数据源
 var dataArray:Array<String>?
 
 为ViewController类添加遵守的相关协议，代码如下：
 class ViewController:UIViewController,UITableViewDelegate,UITableViewDataSource
 
 
 UITableView支持列表的分区，当UITableView的风格为grouped时，每个分区会出现一定间距.
 
实现如下的协议方法可以设置UITableView的分区数，如果将UITableView的风格设置为grouped，则可以明显看出列表数据被分为两组
 
 //设置列表的分区数
 func numberOfSections(in tableView: UITableView) -> Int {
     return 2
 }
 
 
 
 //UTableview也支持对每个分区的头部和尾部设置一个标题，协议方法实现如下：
 
 //设置分区头部标题
 func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return "我是分区头部"
 }
 
 //设置分区尾部标题
 func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
     return "我是分区尾部"
 }
 
 同样，开发者也可以将UITableView的分区头部或者尾部设置为一个自定义的视图，需要通过如下协议方法来实现：
 
 
 UITable ViewDelegate协议与UITableViewDataSource协议中其他重要方法及意义列举如下:
 
 
 
 //当cell将要展示出来时被调用
 func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     <#code#>
 }
 
 //当头视图将要展示出来时被调用
 func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
     <#code#>
 }
 
 //当尾视图将要展示出来时被调用
 func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
     <#code#>
 }
 
 //当cell己经被展示出来时被调用
 func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     <#code#>
 }
 
 //当头视图己经被展示出来时被调用
 func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
     <#code#>
 }
 
 //当尾视图己经被展示出来时被调用
 func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
     <#code#>
 }
 
 //设置cell高度
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     <#code#>
 }
 
 //用户将要选中某一行时被调用
 func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
     <#code#>
 }
 
 //用户将要取消选中某一行时被调用
 func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
     <#code#>
 }
 
// 用户已经选中某一行时被调用
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     <#code#>
 }
 
 //用户已经取消选中某一行时被调用
 func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
     <#code#>
 }
 
 
 
 
 
 //----------------进行数据载体 UITableViewCell 的自定义-----------------------//
 
 系统提供的数据载体类UITableViewCell十分简单，使用它处理一些简单的数据展示十分方便。
 而更多情况下，开发者需要自定义一个数据載体来进行复杂界面的开发，UITableViowcell类结合XIB文件可以方便快捷开发出自定义数据载体UITableViewCell。
 
 模拟开发购物类应用的商品列表页，先来分析商品列表的每条数据载体，一般由商品缩咯图、商品名称、商品简介和价格组成。
 
 首先在工程中创建一个类作为数据模型类，使其继承自NsObject类，并命名为Product。中定义如下属性：
 
 class Product: NSObject {
 //表示商品名称
 var name: String?
 //表示商品价格
 var price: string?
 //表示商品缩略囹
 var imageName: String?
 //表示商品简介
 var subTitle:string?
 }
 
 创建一个新的类，使其继承自UITableViewCell，并命名为ProductTableViewCell。勾选 XIB
 
 XIB文件中会自动创建一个Cell视图并且 与ProductTableViewCell类进行关联，开发者可以在其中拖入其他控件进行Cell的布局开发。
 
 将XIB文件Cell上添加的子视图与ProductTableViewCell类进行关联,选择要关联的视图按住键盘control键不放，将其拖入对应的类中
 
 完成了数据模型和数据载体Cell的开发，在ViewController中直接使用即可.
 首先将数据源数
 
 */


