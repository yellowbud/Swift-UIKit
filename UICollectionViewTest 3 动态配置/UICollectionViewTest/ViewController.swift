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
        10
    }
    
    //返回每个分区具体的数据载体item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    


    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建集合视图布局类
        let layout = UICollectionViewFlowLayout()
        //设置布局方向为竖直方向
        layout.scrollDirection = .vertical
        //设置每个数据载体的尺寸
        layout.itemSize = CGSize(width: 100, height: 100)
        
        
        
        
        /*
        //设置最小行间距
        layout.minimumLineSpacing = 30
        
        //设置最小列间距
        layout.minimumInteritemSpacing = 100
        
        //设置头视图尺寸
        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 100)
        
        //设置尾视图尺寸
        layout.footerReferenceSize = CGSize(width: self.view.frame.width, height: 100)
        
        //设置分区边距
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
       
         minimumLineSpacing属性和minimumInteritemSpacing属性分别用来设置布局中最小的行间距与列间距，
         UICollectionView在进行布局时，会优先满足设置的最小间距。
         sectionInset属性可以简单理解为布局区域与四周的边距，例如，默认情况下是从UICollectionView视图的左上角开始布局的，如果设置了边距，就会从边距处开始布局。
         
         开发者同样可以通过 UICollection ViewDelegateFlowLayout协议来对上面提到的属性进行动态配置。所谓动态配置，是指不同分区配置为不同的值，协议方法列举如下：
         
         
         
         */
        
        
        
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)

        //设罝代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)
    }
    
        //动态设置每个Item的尺寸。协议方法定义在UICollectionViewDelegateFlowLayout协议中
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if indexPath.row%2 == 0 {
                return CGSize(width: 50, height: 50)
            }else{
                return CGSize(width: 100, height: 100)
            }
        }
    

    

}

/*
 
 如果需要进行排版的九宫格中每个数据载体Item的尺寸不完全相同，这时就需要开发者通过实现如下协议方法来动态设置每个数据载体Item的尺寸
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     if indexPath.row%2 == 0 {
         return CGSize(width: 50, height: 50)
     }else{
         return CGSize(width: 100, height: 100)
     }
 }
 
 collection View(_:  ,layout:  ,sizeForItemAt: )协议方法定义在UICollectionViewDelegateFlowLayout协议中,这个协议是UICollectionViewDelegate的子协议，因

 
 UICollectionViewFlowLayout类，其是官方已经封装好的专门用来进行流式布局的布局配置类，开发者常用的配置属性如下：
 
 //动态配置每个数据载体Item的尺寸大小
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
 
 //动态配置每个分区的边距
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     <#code#>
 }
 
 //动态配置每个分区的最小行间距
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
     <#code#>
 }
 
 //动态配置每个分区的最小列间距
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     <#code#>
 }
 
 
 //动态配置每个分区的头视图尺寸
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
     <#code#>
 }
 
 //动态配置每个分区的尾视图尺寸
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
     <#code#>
 }
 
 
 */
