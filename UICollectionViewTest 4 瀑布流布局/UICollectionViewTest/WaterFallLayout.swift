//
//  WaterFallLayout.swift
//  UICollectionViewTest
//
//  Created by Huang Lei on 2022/3/22.
//

import UIKit

class WaterFallLayout: UICollectionViewFlowLayout {
    
    //封装一个属性，用于设置Iten的个数
    let itemCount:Int
    
    //添加一个数组属性，存放每个Iten的布局信息
    var attributeArray:Array<UICollectionViewLayoutAttributes>?
    
    //为 WaterFallLayout类添加一个自定义的构造方法如下//
    
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
    
    //这个方法用来准备布局 开发者在其中进行自定义布局设置
    override func prepare() {
        //调用父类的准备方法
        super.prepare()
        //设置为竖直布局
        self.scrollDirection = .vertical
        //初始化数组
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        //先计算每个Item的宽度 默认2列布局
        let WIDTH = (UIScreen.main.bounds.size.width-self.minimumInteritemSpacing)/2
        //定义一个元组表示每一列的动态高度
        var queueHeight:(one:Int,two:Int) = (0,0)
        //进行循环设置
        for index in 0..<self.itemCount {
            //设置IndexPath，默认设置1个分区
            let indexPath = IndexPath(item: index, section: 0)
            //创建布局属性类
            let attris = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            //随机一个高度 40～190之间
            let height:Int = Int(arc4random()%150+40)
            //哪一列高度小 则把它放在哪一列下面
            //标记放在哪一列
            var queue = 0
            if queueHeight.one <= queueHeight.two {
                queueHeight.one += (height+Int(self.minimumInteritemSpacing))
                queue=0
            }else{
                queueHeight.two += (height+Int(self.minimumInteritemSpacing))
                queue=1
            }
            //设置Item位置
            let tmpH = queue == 0 ? queueHeight.one-height : queueHeight.two-height
            attris.frame = CGRect(x: (self.minimumInteritemSpacing+WIDTH)*CGFloat(queue), y: CGFloat(tmpH), width: WIDTH, height: CGFloat(height))
            //添加到数组中
            attributeArray?.append(attris)
        }
        //以最大一列的高度 作为计算每个Item平均高度的中间值 这样可以保证滑动范围的正确
        if queueHeight.one<=queueHeight.two {
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.two*2/self.itemCount)-self.minimumLineSpacing)
        }else{
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.one*2/self.itemCount)-self.minimumLineSpacing)
        }
    }
    
    /*
     如以上代码所示，prepare（）方法中对每个数据载体Item的位置都进行了重新配置，除了上面的方法外，还需要覆写如下方法，即 UICollectionViewFlowLayout开始布局时拿到的Item的布局信息数组：
     */
    
    //实现这个方法 将设置好的存放每个Item布局信息的数组返回
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
    
}

//完成了这些，瀑布流布局类就已经设计完成了。修改ViewController类的viewDidLoad（）方法如
