//
//  ViewController.swift
//  UITableViewTest
//
//  Created by Huang Lei on 2022/3/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //设置列表有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    
    var dataArray:Array<Product>?
    
    //设置每一行的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
    
    //设置每行数据的数据载体Cell视图.每一行的具体UI展现。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取载体cell
        let cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewCell
        
        let model = dataArray![indexPath.row]
        
        //使用数据模型中的信息对cell进行设置
        cell.iconView.image = UIImage(named: model.imageName!)
        cell.proTitle.text = model.name
        cell.proDetail.text = model.subTitle
        cell.price.text = model.price
        return cell
    
    }
    

   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let prol = Product()
        prol.imageName = "productImage"
        prol.name = "杜康酒1500ml罐装"
        prol.subTitle = "何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
        prol.price = "59元"
        
        let pro2 = Product()
        pro2.imageName = "productImage"
        pro2.name = "杜康酒1500ml罐装"
        pro2.subTitle = "何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
        pro2.price = "59元"
        
        //对数据源进行初始化
        dataArray = [prol,pro2]
        
        //创建UITableview实例
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        
        //注册cell
        tableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    

}


/*
 创建一个新的类，使其继承自UITableViewCell，并命名为ProductTableViewCell。勾选 XIB
 
 XIB文件中会自动创建一个Cell视图并且 与ProductTableViewCell类进行关联，开发者可以在其中拖入其他控件进行Cell的布局开发。
 
 将XIB文件Cell上添加的子视图与ProductTableViewCell类进行关联,选择要关联的视图按住键盘control键不放，将其拖入对应的类中
 
 完成了数据模型和数据载体Cell的开发，在ViewController中直接使用即可.
 首先将数据源数类型修改如下：
 var dataArray:Array<Product>?
 
 因为自定义的Cell是通过XIB文件创建的，因此在注册Cell时不再是注册一个类，而是注册一个UINib类的对象。UINib对象用来描述XIB的某个文件。同样，在XIB文件中也需要对Cell视图的Identifier进行设置，需要和此方法注册的Identifier一致。打开XIB文件，选中Cell视图，在右侧的工具栏中找到Identitier选项，将其设置为TableViewCellId
 
 
 在实际开发中，列表视图单元格 Cell 的自定义。数据模型一>数据载体一列表的设计思路
 
 
 */


