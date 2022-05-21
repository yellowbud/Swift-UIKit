//
//  ViewController.swift
//  UITableViewTest
//
//  Created by Huang Lei on 2022/3/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray:Array<Product>?
    
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
        
        //
        tableView.isEditing = true
        
    }
    
    //返回每行Cell的编辑模式
public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0 {
            return .insert
        }else{
            return .delete
        }
    }
    
    //设置显示的交互按钮的文宇
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if indexPath.row == 0 {
            return "插入"
        }else{
            return "删除"
        }
    }
    
    //点击交互按钮后回调的方法
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //根据编辑模式进行不同的逻辑处理
        if editingStyle == UITableViewCell.EditingStyle.delete {
                print("点击了删除按钮")
            //先删除数据源中的此条数据
            dataArray?.remove(at: indexPath.row)
            //再从界面上删除此条Cell
            tableView.deleteRows(at: [indexPath], with:UITableView.RowAnimation.left )
            
            
        }else{
            //先向数据源中插入一条数据
            let pro1 = Product()
            pro1.imageName = "productImage"
            pro1.name = "杜康酒1500ml 罐装"
            pro1.subTitle = "何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
            pro1.price = "60元"
            dataArray?.insert(pro1, at: indexPath.row)
            
            //再向界面中插入一条Cell
            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            
            print("点击了插入按钮")
        }
        
    }
    
    
    //设置列表有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
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
    

    
    

}


/*
 
 UITableView 的编辑模式
 
 对于列表，其除了用于展示信息外，常常还伴随着增、删、改的功能。例如一个用户的收藏列表，用户可能经常会增加新的数据，或者进行移动和删除操作等。UITableView类为开发者封装了一系列增、删、改的接口，可以方便地进行调用以达到所需的效果。
 
 首先，UITableView实例的编辑状态由isEditing属性决定，将前面所编写的工程中的tableView编辑模式打开，代码如下：
 tableView.isEditing = true
 
 此时运行工程，可以看到如果开发者不进行任何设置，则UITableview默认的编辑模式是删除模式。在每个数据载体Cell的右侧会出现一个删除按钮，当用户点击这个删除按钮后，Cell会向左滑动
 
 如果此时读者点击这个Delete按钮，并不会产生效果，点击按钮的触发方法需要开发者通过协议方法来实现。除了删除模式外，UITableView还可以支持插入模式，实现协议方法如下：
 
 //返回每行Cell的编辑模式
 public func tableView()
 
 
 要实现插入、删除操作，分成两步：首先对数据源进行修改，前面分析过，UITableView的行数设置，每行具体的数据载体Cell都是通过数据源中的数据来设置的，因此如果要修改列表，首先应该修改数据源；修改了数据源后，界面并不会立刻发生变化，只有在UITableView进行刷新操作时，才会根据数据源更新界面。所以，开发者还需要插入/删除一个数据载体Cell
 
 
 UITableView类实例的删除Cell方法deleteRows(at：,with：）和插入Cell方法insertRows(at:，with：）都需要传入两个参数
 第1个参数是元素类型为IndexPath的数组，其代表要刪除或者插入的分区行，支持多行同时操作；
 第2个参数为动画效果参数，设置这个参数可以在删除或者插入时附带动画效果。动画参数枚举意义如下：
 */
public enum RowAnimation : Int {
    
    //渐隐渐现
    case fade
    
    //右侧进入或移出
    case right
    
    //左侧进入或移出
    case left
    
    //上侧进入或移出
    case top
    
    //下侧进入或移出
    case bottom
    
    //无动画
    case none
    
    //从中间开始动画
    case middle
    
    //自动选择动画
    case automatic
}

