//
//  ViewController.swift
//  17_UIViewControllerTest2
//

//

import UIKit

class ViewController: UIViewController,ViewControllerTwoProtocol {

    var label:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        self.view.addSubview(label!)
    }

    @IBAction func touch(_ sender: Any) {
        //跳转到第2个ViewController界面
        let viewController = ViewControllerTwo(data: "这是从第一个界面传递进来的数据")
        viewController.delegate=self
        //对闭包进行赋值
        viewController.closure = {(data:String) in
            self.label?.text = data
        }
        //跳转到第2个ViewController界面.第3个参数为一个闭包，其内容会在视图控制器切换完成后被执行。
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sentData(data: String) {
        //进行label的赋值
        self.label?.text = data
    }
    
}

/*
 UIViewController界面的切换
 
 界面间的传值可分为两种情况，例如由新闻列表跳转至新闻详情页这类情况就属于正向传值,其特点是之后的页面内容由前一个页面中的数据决定;
 另一种情况则是反向传值，例如在新闻列表页点击分类按钮，在弹出的新页面中选择一个分类，再回到新闻列表页时，页面将根据选择的分类重新为用户加载与其分类相关的新闻,这类传值的特点是前一个页面的内容由后一个页面的数据决定.
 
 UIViewController类实例的dismiss（）方法 present（）方法相对应，其作用是使当前视图控制器的界面消失。
 
 在使用present（）方法和dismiss（）方法进行视图控制器的切换时，很多时候并不是进行单纯的界面切换，大多都需要进行数据传递。正向传值较为容易，开发者可以对之后视图控制器的属性进行赋值，或者设计新的构造方法，在构造时对其属性进行初始化。
 
 //--------------------------正向传值--------------------------------------//
 
 //-------------------第1种方式--------------------------//
 视图控制器间正向传值的第1种方式为:
 通过属性传值。
 
 修改ViewController类中视图控制器的跳转代码如下：
 @IBAction func touch(_ sender: Any){
            let viewController = ViewControllerTwo()
            viewController.data = "这是从第一个界面传送进来的数据"
            self.present(viewController, animated: true, completion: nil)
 }
 
 在ViewControllerTwo类中声明一个Optional类型的属性，并在viewDidLoad（）方法中创建一个文本标签来展示传递进来的值
 声明一个属性来接收传递的数据
 var data:String?
 override func viewDidLoad(){
        super.viewDidLoad()
 
        //添加一个文本标签
        let label = UILabel(frame:CGRect(x: 20,y: 200,width: 280,height: 30))
        label.text = data
        self.view.addSubview(label)
        
 }
 

 
 
 
 //-----------------------第2种方式-------------------------------//
 视图控制器问正向传值的第2种方式为
 使用构造方法传值
 对于非Optional类型的属性，开发者需要在类的构造方法中完成该属性的初始化工作，在ViewControllerTwo类中定义一个新的构造方法，并实现init？（coder：NSCoder）方法
 
 init（data：String）{
    self.data = data
    super.init(nibName: nil, budle: nil)
 }
 
 required init?(coder:NSCoder) {
    super.init(coder:coder)
 }
 
 使用新的构造方法对ViewControllerTwo类进行实例化:
 @IBAction func touch(_ sender: Any) {
        let viewController = ViewControllerTwo(data:"这是从第一个界面传送进来的数据")
        self.present(viewController, animated: true, completion: nil)
 }
 
 */
