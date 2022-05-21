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
    
    
    //实现对数据的排序操作
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //修改数据源
        let tmp = dataArray![sourceIndexPath.row]
        let tmp2 = dataArray![destinationIndexPath.row]
        dataArray![sourceIndexPath.row] = tmp2
        dataArray![destinationIndexPath.row] = tmp
     /*
      实现了上面的协议方法后运行工程，可以看到当UITableView处于编辑模式时，每个cell的右边都会出现一个拖曳按钮.
      当拖曳结束后，会执行上面的协议方法。
      在这个方法中会将两个要交换位置的Cell的IndexPath传入，分别为sourceIndexPath与destinationindexPath。
      需要注意，界面上的交换操作只是Cell的交换，其数据源的顺序并没有产生任何变化，故开发者需要手动对数据源中的这两个元素交换位置。
      
      
      
        */
        
        
        
        
        
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
 
 系统的UITableView还有一个十分强大的编辑功能——改
 实现对数据的排序操作。协议方法实现如下：
 */


