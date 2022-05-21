//
//  ViewController.swift
//  UIViewController
//
//  Created by Huang Lei on 2022/3/16.
//

import UIKit

class ViewController: UIViewController {
    
    //加载视图时调用的方法
    override func loadView() {
        super.loadView()
    }
    
    //视图加载完成时调用的方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //将要布局子视图时调用的方法
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    //已经布局子视图时调用的方法
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //界面将要展现时调用的方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //界面已经展现时调用的方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //界面将要消失时调用的方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //界面已经消失时调用的方法
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //析构方法
    deinit {
        print("deinit")
    }
    
    //收到内存警告时调用的方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


/*
 以上方法全都是覆写父类的方法。在实现时，首先要调用父类的方法，即用super调用。
 以上示例代码基本完整列举了一个UIViewController实例的全部生命周期方法。
 
 其中loadView（）方法会在UIViewController实例被创建时调用，用于其中视图的构造加载。
 
 当调用viewDidLoad（）方法时，表明视图控制器中的视图已经加载完成，因此开发者通常会在这个方法中进行自定义视图的加載。
 
 viewWilLayoutSubviews（）方法 和 viewDidLayoutSubviews()方法 会在视图控制器对其内部的子视图进行布局时调用。
 
 viewWillAppear（）与viewDidAppear()两个方法则是当视图控制器上的视图展示在屏幕上才会被调用。
 在视图控制器实例被创建后，当调用了相应的视图控制器切换方法后，控制器上的视图才会展现在屏幕上。
 
 viewWillDisappear（）方法和viewDidDisappear（）方法会在视图控制器上的视图从屏幕上消失时调用，这两个方法的调用并不一定代表视图控制器实例将会被释放。
 
 在ios系统中进行视图控制器的切换时，系统会保留基层的视图控制器不被释放，只有当deinit析构方法被调用时，才表明视图控制器实例完全被释放了。
 
 UIViewController的生命周期还有一个函数didReceiveMemoryWarning（），一般情况下，开发者不需要对这个函数进行特殊处理，其只有在收到系统的内存警告时才会被调用。
 随着iOS设备内存性能逐渐强大，这个函数的应用不多，如果要适配低性能的IOS设备，可以在这个函数中对无用数据进行销毁及释放操作。
 
 
 */

/*
 
 UIViewController类是UIKit开发框架中最基础的一个视图控制器类，许多复杂的视图控制器都继承自UIViewController。
 ViewController是视图与数据的管理者，一般情况下，开发者会将应用中每一个界面都用一个 ViewController的实例来管理，切换不同的界面只是切换了不同的ViewController实例。
 因此可以理解为大多数应用程序都是由很多Viewconroller实例组成的，如果ViewController实例被创建出来后没有对其生命周期进行管理，所占用的内存不能及时释放，随着应用程序运行时间的增长，程序将会出现严重的后果。
 
 实际上，系统对UIViewController有着完整的生命周期管理体系，这体现在代码上可看到在UIViewControler实例从创建到销毀的整个过程中，
 系统都会回调一系列的生命周期函数。
 */


