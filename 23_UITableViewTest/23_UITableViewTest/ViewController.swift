//
//  ViewController.swift
//  23_UITableViewTest
//
//  
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var dataArray:Array<Product>?
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建测试产品
        let pro1 = Product()
        pro1.imageName = "productImage"
        pro1.name = "杜康酒1500ml罐装"
        pro1.subTitle = "  何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
        pro1.price = "59元"
        let pro2 = Product()
        pro2.imageName = "productImage"
        pro2.name = "杜康酒1500ml罐装"
        pro2.subTitle = "  何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
        pro2.price = "59元"
        //对数据源进行初始化
        dataArray = [pro1,pro2]
        //创建UITableView实例
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        //注册cell
        tableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isEditing = true
    }

    //设置列表有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
//    //设置每行数据的数据载体Cell视图
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //根据注册的Cell类Id值获取到载体Cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
//        //进行标题的设置
//        cell.textLabel?.text = dataArray?[indexPath.row]
//        return cell
//    }
    //设置每行数据的数据载体Cell视图
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //获取到载体Cell
       let cell:ProductTableViewCell = tableView.dequeueReusableCell (withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewCell
       let model = dataArray![indexPath.row]
       //使用数据模型中的信息对cell进行设置
       cell.iconView.image = UIImage(named: model.imageName!)
       cell.proTitle.text = model.name
       cell.proDetail.text = model.subTitle
       cell.price.text = model.price
       return cell
   }
   //设置每一行的高度
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 153
   }
    
//    //设置列表的分区数
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    //设置分区头部标题
//   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//       return "我是分区头部"
//   }
//   //设置分区尾部标题
//   func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//       return "我是分区尾部"
//   }
//
//    //设置分区的头部视图
//   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//       let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
//       view.backgroundColor = UIColor.red
//       return view
//   }
//   //设置分区的尾部视图
//   func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//       let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
//       view.backgroundColor = UIColor.green
//       return view
//   }
//   //设置分区头部视图高度
//   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//       return 120
//   }
//   //设置分区的尾部视图高度
//   func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//       return 50
//   }
    //返回每行Cell的编辑模式
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
           if indexPath.row==0 {
               return .insert
           }else{
               return .delete
           }
           
       }
       //设置显示的交互按钮的文字
       func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
           if indexPath.row==0 {
               return "插入"
           }else{
               return "删除"
           }
       }
       //点击交互按钮后回调的方法
//    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
//           //根据编辑模式做不同的逻辑处理
//        if editingStyle==UITableViewCell.EditingStyle.delete {
//               print("点击了删除按钮")
//           }else{
//               print("点击了插入按钮")
//           }
//       }
    
    //点击交互按钮后回调的方法
   public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
       //根据编辑模式做不同的逻辑处理
       if editingStyle==UITableViewCell.EditingStyle.delete {
           print("点击了删除按钮")
           //先删除数据源中此条数据
           dataArray?.remove(at: indexPath.row)
           //再从界面上删除此条Cell
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
       }else{
           //先向数据源中插入一条数据
           let pro1 = Product()
           pro1.imageName = "productImage"
           pro1.name = "杜康酒1500ml罐装"
           pro1.subTitle = "  何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
           pro1.price = "60元"
           dataArray?.insert(pro1, at: indexPath.row)
           //再向界面中插入一条Cell
        tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
           print("点击了插入按钮")
       }
   }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
            //修改数据源
            let tmp = dataArray![sourceIndexPath.row]
            let tmp2 = dataArray![destinationIndexPath.row]
            dataArray![sourceIndexPath.row] = tmp2
            dataArray![destinationIndexPath.row] = tmp
        }
}

