//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Huang Lei on 2022/3/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建集合视图布局类
        let layout = UICollectionViewFlowLayout()
        //设置布局方向为竖直方向
        layout.scrollDirection = .horizontal
        //设置每个数据载体的尺寸
        layout.itemSize = CGSize(width: 100, height: 100)
        
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)

        //设罝代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)
    }
    
    //返回分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //返回每个分区的Item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //返回每个分区具体的数据载体Item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
    //UICollectionView中的每个数据载体都需要进行用户交互，UICollectionView的用户交互在如下协议方法中处理：
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("第\(indexPath.row)个Item被电击")
    }
    


}

/*
 
 UICollectionView是比UITableView更加强大的列表视图，其也被称为集合视图.
 UICollectionView与UITableView相比灵活性更高，但在使用的时候也更复杂一些。
 UICollectionView的优势列举如下：
 
 UICollectionView支持水平和垂直两种方向的布局。
 UICollectionView通过layout层相关类来进行界面的布局配置
 相比于UITableView中的数据载体Cell，UICollectionView中的数据载体Item的尺寸位罝设置更加灵活。
 通过相关布局协议方法可以动态设置每个数据载体的尺寸
 
 九宫格布局是应用程序界面布局中常用的一种布局模型，某些并列关系的功能组成的功能列表采用九宫格这种平铺式布局方式十分适宜。
 
 
 UIColletionViewFlowLayout是系统封裝好的一个UICollectionView布局类，专门用来进行流式布局，其中scrollDirection属性用来设置集合视图的滚动方向，枚举如下：
 
 public enum ScrollDirection : Int {
 //竖直方向布局
 case vertical
 //水平方向布局
 case horizontal
 }
 
 水平方向是指 UICollectionView在进行数据载体的排布时，按坚直方向排布,排满后折回第2列继续排布，数据载体如果超出UICollectionView尺寸，则可以进行水平滚动。
 竖直方向是指 UICollectionView 在进行数据载体的排布时，按水平方向排布，排满后折回第2行继续排布，数据载体如果超出 UICollectionView 尺寸，则可以进行竖直方向滚动。
 
 
 正常情况下，UICollectionView中的每个数据载体都需要进行用户交互，UICollectionView的用户交互在如下协议方法中处理


 
 */
