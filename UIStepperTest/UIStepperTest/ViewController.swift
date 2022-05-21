//
//  ViewController.swift
//  UIStepperTest
//
//  Created by Huang Lei on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let stepper = UIStepper(frame: CGRect(x: 100, y: 100, width: 0, height: 0))
        
        
        stepper.minimumValue = 0 //设置控件的最小值
        
        stepper.maximumValue = 10 //设置控件的最大值
        
        stepper.stepValue = 1 //设置控件的步长
         
        self.view.addSubview(stepper)
        
        //UIStepper控件添加用户交互方法的示例如下：
        stepper.addTarget(self, action: #selector(click), for: UIControl.Event.valueChanged)
    }
    
    //在触发方法click()时，可以获取到UIStepper实例的value属性用于逻辑操作
    @objc func click(stepper:UIStepper) {
        print("步进控制器的值\(stepper.value)")
    }

}

/*
 UISlider控件对属性值进行连续调节
 
 调节属性值的控件 UIStepper。 UIStepper控件也叫步进器，和UISider不同的是，UIStepper的取值是离散性的，其用于调节非连续性量值。
 
 
 UIStepper控件有其自己的UI尺寸，只需设置位置
 
 UIStepper控件的isContinuous属性
 用于设置当UIStepper控件的值改变时，是否触发用户交互的事件方法。举一个例子，当用户按住 UIStepper 控件上的某个按钮不放时，UIStepper控件的值会不断发生改变。这时，如果isContinuous属性为true，则用户交互触发的事件方法会不断重复执行；如果isContinuous属性为false，则只有用户抬起手指时，触发的事件方法才会执行一次。isContinous属性的默认值为true
 
 autorepeat属性
 用于设置UISlepper控件的值是否自动叠加，即当用户按住 UIStepper 控件上的按钮不放时，如果autorepeat属性为true，则UIStepper控件的值会不断发生改变；如果autorepeat属性为false，则只有当用户抬起手指时，UIStepper控件的值才会改变一次。
 
 wraps属性用于设置UIStepper的值是否循环，即wraps属性为true时，UISteeper控件的值达到极限后会自动进行首尾循环。
 
 
 
 
 
 
 在ios系统中,很多可以进行UI交互的控件都是通过 addTarget() 方法来添加交互事件的。
 这些控件都是继承自UIControl的子类，UIControl又是UTView的一个子类，专门用于有交互功能的视图控件。
 
 
 */


/*
 UIStepper控件也支持进行自定义图片的操作，所需要使用的方法如下：
 
 设置控件背景图片
 public func setBackgroundImage(_ image: UIImage?,for state: UIControl.State)

 设置控件分隔线图片
 public func setDividerImage(_ image: UIImage?,forLeftSegmentState leftState:UIControlState, rightSegmentState rightState: UIControl.State)

 设置增加按钮图片
 public func setIncrementImage(_ image: UIImage?,for state: UIControl.State)

 设置减少按钮图片
 public func setDecrementImage(_ image: UIImage?,for state: UIControl.State)
 
 
 
 
 */


