//
//  ViewController.swift
//  UIButtonTest
//
//  Created by Huang Lei on 2022/3/12.
//按钮控件是应用程序中基础的用户交互控件，按钮控件通常用来处理诸如界面跳转、取消、确定等逻辑操作。ios开发框架中为开发者提供了UIButton类作为基础的按钮控件。

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //创建UIButton实例
        let buttonOne = UIButton(type: UIButton.ButtonType.system)
        
        //设置按钮位置与尺寸
        buttonOne.frame = CGRect(x: 20, y: 90, width: 100, height: 30)
        
        //设置按钮背景色
        buttonOne.backgroundColor = UIColor.purple
        
        //设罝按钮标题。
        buttonOne.setTitle("标题", for: .normal)//第2个参数为显示此标题时所对应的按钮状态
    
        //设置标题文字颜色
        buttonOne.setTitleColor (UIColor.white, for: .normal)
        
        //添加到当前视图
        self.view.addSubview (buttonOne)
        
        //为按钮添加触发事件
        buttonOne.addTarget(self, action: #selector(touchBegin), for: UIControl.Event.touchUpOutside)
        
        //设置UIButton控件的内容图片
        buttonOne.setImage(UIImage(named: "image"), for: .normal) //需要传入UIImage类型的实例。使用UIImage(named:)方法可以构造出一个UIImage类的实例。传入图片名
        
        //设置 UIButton 控件的背景图片
        buttonOne.setBackgroundImage(UIImage(named: "image"), for: .normal)
        
        var filled = UIButton.Configuration.filled()
        filled.title = "Filled button"
        filled.buttonSize = .large
        filled.subtitle = "With subtitle even"
        filled.image = UIImage(systemName: "bubble.left.fill")
        filled.imagePlacement = .trailing
        filled.imagePadding = 5
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        self.view.addSubview (button)
    
        /*
         如果要自定义按钮的显示图片，需要将按钮的类型设置为 UIButton.ButtonType.custom才会有效。
         
         上面两个设置图片的方法都需要传入一个UIImage类型的实例，使用UIImage（named：）方法可以构造出一个UIImage类的实例
         
         
         .titlePadding : Padding between the title and subtitle labels.
         在标题和字幕标签之间填充。
         
         .imagePadding :  Padding between the button’s image and text.
         在按钮的图像和文本之间填充。
         
         .contentInsets : Padding from the button’s content area to its bounds.
         从按钮的内容区填充到其边界。
         
         
         var configuration = UIButton.Configuration.filled()
         configuration.title = "Title"
         configuration.image = UIImage(systemName: "swift")
         configuration.titlePadding = 10
         configuration.imagePadding = 10
         configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
         
         
         */
        
        
    }
    
    @objc func touchBegin() {
        print("用户点击了按钮")
    }
    

}

/*
 
 /*
  
  使用构造方法UIButton(type:)进行了按钮实例的创建，这个方法需要传入一个按钮类型的参数，这个参数是UIButton. ButonType枚举类型，可以使用的按钮类型枚举值如下：
  
  自定义类型
  custom
  
  系统类型
  system
  
  详情按钮类型
  detailDisclosure
  infoLight
  infoDark
  
  添加按钮类型
  contactAdd
  
  关闭按钮类型
  close
 
 */
 
 /*
  
  buttonOne.setTitle("标题", for: .normal)
  第2个参数为显示此标题时所对应的按钮状态
  
  
  多数和用户进行交互的UI控件都有状态的概念。状态描述的是 人与控件交互时控件控件所处的状态，例如控件的正常状态、控件被选中时的状态、控件被按下时的状态、控件禁用时的状态
 这些控件的状态由结构体UIControl.State来描述，若需要获取其他状态，则可以使用UIControl.State结构体定义的静态属性，代码如下:
  
  //控件正常状态
  public static var normal:UIControlState { get }
  
  //控件高亮状态 .所谓控件的高亮状态，就是控件被按下并且手指没有抬起时的状态
  public static var highlighted：UIControlState { get }
  
  //控件禁用状态
  public static var disabled: UIControlState { get }
  
  //控件被选中状态
  public static var selected: UIControlstate ( get }
  
  */
 ----------------------------为按钮添加触发事件---------------------
 
 UIButton可以进行用户逻辑交互。从代码层面来看，用户的逻辑交互就是当用户点击某个按钮后，应用程序执行开发者设计好的一段代码。
 因此，只要可以监听到用户的点击事件，然后调用设计好的函数即可，在viewDidLoad（）方法中添加
 
 buttonOne.addTarget (self, action: #selector (touchBegin),
 for:UIControl.Event.touchUpInside)
 
 addTarget(_: ,action:,for:)方法用于向UIButton控件添加一个触发事件，这个函数需要传入3个参数:
 
 第1个参数需要传入按钮触发时事件方法的执行者,这里传入self代表当前视图控制器实例本身
 
 第2个参数需要传入一个方法选择器Selector实例，这个参数决定要执行的方法,由于方法
 的执行者是当前视图控制器，因此需要在 ViewController 中实现touchBegin方法
 
 第3个参数用于设置触发事件的条件，这个参数为UIControlEvents类型的结构体，这个结构体定义了各种按钮触发情况，列举如下：
 
 public struct Event : OptionSet {
 
 //按钮被按下时触发
 public static var touchDown: UIControl.Event{ get }
 
 //按钮被重复按下时触发，点击次数大于 1
 public static var touchDownRepeat: UIControl.Event{ get )
 
 //按钮被按下并且在控件区域内拖曳
 public static var touchDragOutside: UIControl.Event{ get }
 
 //按钮被按下并且在控件区域外拖曳
 public static var touchDragInside: UIControl.Event{ get }
 }
 
 //按钮被按下并且拖曳
 public static var touchDragEnter: UIControl.Event{ get }
 
 //按钮拖拽结束
 public static var touchDragExit: UIControl.Event{ get }
 
 //按钮被按下并且在控件区域内抬起
 public static var touchUpInside: UIControl.Event{ get }
 
 //按钮被按下并且在控件区域外抬起
 public static var touchUPOutside: UIControl.Event{ get }
 
 //按钮取消点击
 public static var touchCancel: UIControl.Event{ get }
 
 
 //------------------------为 UIButton 添加自定义图片-----------------//

 UIButton控件支持设置两种类型的图片：
 
 一种是将图片作为按钮的内容图片，这时图片和文宇将并列显示
 另一种是将图片作为按钮的背景图片，此时图片将填充整个按钮控件，文字将覆盖显示在图片上面。
 
 为UIButton控件添加显示图片的代码
 buttonOne.setImage(UIImage(named:"Image"),for:.normal)
 
 */
