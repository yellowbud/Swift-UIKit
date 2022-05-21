//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Huang Lei on 2022/3/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    //返回每个分区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    //返回每个分区具体的数据载体item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        
        //设置一个随机的颜色
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        return cell
    }
    


    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // 创建瀑布流视图布局类
        let layout = WaterFallLayout(itemCount: 30)
                
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)

        //设罝代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)
    }
    
    

    

}

/*
 以九宫格的方式排列，局部和宏观上对布局进行自定义使用时，UICollectionViewFlowLayout布局十分方便。
 但是如果要实现瀑布流布局，即列表中排列紧凑，每个数据载体ltem宽度相同而高度随机，系统的UICollectionViewFlowLayout类就有些力不从心了。
 通常情况下，开发者会通过继承UICollectionViewFlowLayout类实现自定义的布局类来完成瀑布流布局的需求。
 
 
 在工程中创建一个新的类，使其继承UICollectionViewFlowLayout类，命名为WaterFallLayout。把它作为瀑布流布局类.
 首先，UICollectionViewFlowLayout在进行界面布局时，会根据开发者的相关配置计算出每个数据载体Item的布局信息，这个布局信息实际上是UICollectionViewLayoutAttributes类来进行描述的。因此，开发者要实现自定义的布局模型，实际上需要自定义每个数据载体Item对应的UICollectionViewLayoutAttributes。 在WaterFallLayout类中定义如下属性：
 //封装一个属性，用于设置Iten的个数
 let itemCount:Int
 
 //添加一个数组属性，存放每个Iten的布局信息
 var attributeArray:Array<UICollectionViewLayoutAttributes>?
 
 //为 WaterFallLayout类添加一个自定义的构造方法如下：
 
 //实现必要的构造方法
 required init?(coder aDecoder: NSCoder) {
     itemCount=0
     super.init(coder:aDecoder)
 }
 //自定义一个构造方法
 init(itemCount:Int){
     self.itemCount = itemCount
     super.init()

}
 
 在UICollectionViewFlowLayout类进行布局配置前，会结调用prepare()方法进行布局准备工作，开发者可以在这个方法中进行自定义布局的配置。在WaterFallLayout类中覆写此方法，代码
 //这个方法用来准备布局 开发者在其中进行自定义布局设置
 override func prepare() {
     //调用父类的准备方法
 
 
 自定义UICollectionViewLayout还可以实现更多炫酷的布局效果，例如3D球形布局、圆环布局
 其思路都是对UICollectionViewLayoutAttributes类中的相关数据进行运算与配置
 
 */
