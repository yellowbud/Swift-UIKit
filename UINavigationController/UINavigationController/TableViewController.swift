//
//  TableViewController.swift
//  UINavigationController
//
//  Created by Huang Lei on 2022/3/17.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏颜色
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        //创建导航按钮实例,在导航栏左侧可以看到添加了一个功能按钮done
        let barItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(click))
        
        self.navigationItem.leftBarButtonItem = barItem
    
        
    }
    
    //实现导航功能按钮用户交互的触发方法click()，在其中演示导航中的视图控制器间的切换操作
    
    @objc func click() {
        let viewController = ViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    //使用导航控制器跳转的视图控制器会默认带一个返回按钮，点击返回按钮会返回上一级界面

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



/*
 
 导航控制器并非视图控制器，视图控制器用来综合管理当前界面中的视图，导航控制器则是一种框架结构，其内部管理的不是视图，而是视图控制器，可以将导航控制器理解为视图控制器的管理者。
 
iOS应用开发中的导航采用的是栈结构的设计模式。
 在学习栈结构时，需要记住一向话：先进后出，后进先出。可以将栈理解为只有一个开口的长盒子。
 
 当一个视图控制器被push进导航栈中时，其会出现在栈顶，同时显示在界面上，并将管理权交由导航控制器，当导航控制器执行pop操作时，会将栈顶的视图控制器弹出释放，这时位于栈顶的视图控制器将展现在界面上

 
 把元素压入栈结构的操作也被称为push操作，将元素从栈中弹出的操作也被称为pop操作。
 
 //-----------------------------------//
 xcode模板默认创建出的工程并不是导航结构的，需要对其做一些修改。首先打开Main.storyboard文件，将其中的View
 Controller除，选中界面中的View Controller后，单击键盘上的Delete键就可以完成删除。之后从
 xcode右下方的控件模板中找到Navigation Controller，将其拖入故事板中
 
 此时在Main.storyboard中可以看到一个Navigation Controller和一个Root View Controller， 导航控制器模版自动帮助开发者创建了一个视图控制器来作为导航控制器的根视图控制器。根据导航结构的原理可以知道，单独的导航控制器并没有任何意义，其必须对具体的视图控制器进行管理，创建了导航控制器后，需要将其设置为应用项目程序的入口。勾选Is Initial View Controller
 
此时，以此Navigation Controller的根视图控制器作为起始界面。
 
 由于Navigation Controller中的Root View Controller 是UITableVicwController， 需要将其与一个类进行关联，将ViewController.swift文件删除，新建一个继承自UITable ViewController的类，并命名为TableViewController
 
 UITableViewController 是表视图控制器
 
 创建完 TableViewController后，将其与Main.storyboard中的Root View Controller进行关联，选中Main.storyboard中的Root View Controller， 将其Class类设置为Table ViewController
 
 导航控制器会为其中每个视图控制器添加一个导航栏，导航栏上可以显示标题，也可以根据需求自定义一些功能按钮
 
 //--------对导航栏进行自定义设置----------//
 
 UINavigationController中内嵌着一个导航栏UINavigationBar,开发者可以根据需求对其UI和功
 能进行自定义，例如修改导航栏的颜色、 向导航栏上添加功能按钮等
 
 
  
  在结构上，导航栏上的功能按钮实际上属于当前对应的视图控制器，如果在导航中进行视图控制器的切换，则导航栏上的功能按钮也会进行相应的切换。
  
 使用lefBarButtonltem属性来设置导航栏的左侧按钮，rightBarButtonltem属性：导航栏上的右侧按钮。开发者也可以使用
  lefBarButtonltems 和 rightBarButtonltems 属性设置一组左侧或者右侧功能按钮，传入UIBarButtonltem的数组即可。
  
  UIBarButtonItem类专门用来创建导航功能按钮，开发者可以自由选择该类中提供的5种构造方法之一来进行UIBarButtonltem的实例化。构造方法代码如下：
  
  通过自定义的图片创建功能按钮
  public convenience init(image: <#T##UIImage?#>, style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>)
  
  通过自定义的图片创建功能按钮，支持设置横竖屏状态下的不同图片
  public convenience init(image: <#T##UIImage?#>, landscapeImagePhone: <#T##UIImage?#>, style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>)
  
  通过文字标题创建功能按钮
  public convenience init(title: <#T##String?#>, style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>)
  
  创建系统风格UIBarButtonItem实例
  public convenience init(barButtonSystemItem: <#T##UIBarButtonItem.SystemItem#>, target: <#T##Any?#>, action: <#T##Selector?#>)
  
  通过自定义的视图创建功能按钮
  public convenience init(customView: <#T##UIView#>)
  
  上面列举的构造方法中，需要在创建系统风格的UIBarButonltem实例的构造方法中传入一个UIBarButtonltem.SystemItem枚举类型的风格参数,系统定义了一系列的按钮风格，枚举值列举如下：
  
  public enum SystemItem : Int {
      case done
      case cancel
      case edit
      case save
      case add
      case flexibleSpace //无UI展现，布局占位
      case fixedSpace
      case compose
      case reply
      case action
      case organize
      case bookmarks
      case search
      case refresh
      case stop
      case camera
      case trash
      case play
      case pause
      //退后图标风格
      case rewind
      //前进图标风格
      case fastForward
      //undo文字风格
      case undo
      //redo文字风格
      case redo
  }
 
 //--------------------使用导航进行视图控制器的切换管理---------------------------------//
 
 在前面学习UIViewControllor类的相关知识时，我们可以(使用present()与dismiss（）方法进行视图控制器的跳转与返回。
 如果项目采用了导航的框架结构，则视图控制器的跳转操作也将交由导航控制器来处理
 首先在项目中新建一个类文件，使其继承自 UIViewController，并命名为ViewController
  
 UINavigationController类实例的pushViewController（）方法用于将一个新的视图控制器压入导航栈的栈顶。
 对于返回操作，开发者也可以使用代码来实现，其原理是将导航栈中栈顶的视图控制器弹出。
 
 
  
  */
