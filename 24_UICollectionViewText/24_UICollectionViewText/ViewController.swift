//
//  ViewController.swift
//  24_UICollectionViewText
//
//  
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建瀑布流视图布局类
        let layout = WaterFallLayout(itemCount: 30)
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        //设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)
    }

//    //返回分区个数
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    //返回每个分区的item个数
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    //返回每个分区具体的数据载体item
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
//        cell.backgroundColor = UIColor.red
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("第\(indexPath.row)个Item被点击")
//    }
//
//    //动态设置每个Item的尺寸
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row%2 == 0 {
//            return CGSize(width: 50, height: 50)
//        }else{
//            return CGSize(width: 100, height: 100)
//        }
//    }
    
    //返回每个分区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    //返回每个分区具体的数据载体item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        //设置一个随机的颜色
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        return cell
    }
}

