//
//  ViewController.swift
//  UIScrollViewTest
//
//  Created by Huang Lei on 2022/3/21.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var imageView:UIImageView?
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //进行UIScrollView的实例化
        let scrollView = UIScrollView(frame: self.view.frame)
        
        //将滚动视图添加到当前界面
        self.view.addSubview(scrollView)
        
        //设置代理
        scrollView.delegate = self
        
        imageView = UIImageView(image: UIImage(named: "image"))
        imageView?.frame = self.view.frame
        scrollView.addSubview(imageView!)
        
        scrollView.contentSize = self.view.frame.size
        
        //设罝缩放限度
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        
        
//        //创建两个内容视图
//        let subView1 = UIView(frame: self.view.frame)
//        subView1.backgroundColor = UIColor.red
//        let subView2 = UIView(frame: CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
//        subView2.backgroundColor = UIColor.blue
//
//        //将内容视图添加进UIScrollView视图中
//        scrollView.addSubview(subView1)
//        scrollView.addSubview(subView2)
//
//        //设置UIScrollView实例的位置与尺寸。控制滚动视图的可滚动视图范围
//        scrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
//
//        //设置始终开启竖直方向的回弹效果
//        scrollView.alwaysBounceVertical = true
//
//        //设置始终开启水平方向的回弹效果
//        scrollView.alwaysBounceHorizontal = true
//
//        //当用户对滚动视图进行滑动时，可以看到在右侧或者下侧会出现一个滚动条，开发者可以通过如下属性来设置此滚动条是否显示：
//
//        //显示竖直方向的滚动条
//        scrollView.showsVerticalScrollIndicator = true
//
//        //不水平方向的滚动条
//        scrollView.showsHorizontalScrollIndicator = false
//
//        //开启自动定位分页效果
//        scrollView.isPagingEnabled = true
    }
    
    
}


 /*
 可以将UIScrollView理解为一块大的画布，我们可以向其中放入任意尺寸的一组视图
  创建了一个尺寸和当前视图控制器界面尺寸相同的UIScrollView视图。
 
  向UIScroIIView示例中添加的子视图的尺寸已经超出了当前界面的边界，所以需要设置UIScrollView的contentSize属性来控制滚动视图的可滚动范围，从属性名（内容尺寸）就可以理解，其用来设置UIScrollView滚动视图的内容区域尺寸，如果内容区域的尺寸超出了UISCroIIView实例本身的尺寸大小，则当前UISCro1View实例就可以进行滑动来适应其内容区域的尺寸。
 
 如果将UIScrollView 实例的contentsize属性高度设置为大于UIScrollView本身的高度，滚动视图则会支持纵向的滚动。
 
  当用户将滚动视图滑动到边缘时，其实还可以继续拖曳一段距离，而当用户手指离开屏幕后，滚动视图会产生回弹效果。这种阻尼回弹效果是由
 UIScrollView类的bounces属性决定的，其需要设置为一个Bool值，默认为true，即支持回弹效果，如果设置为false则不支持。还有一个细
 节，当滚动视图的contentsize比其本身的尺寸小时，则默认不产生阻尼回弹效果。
  
 许多常见的应用程序都有图片轮播视图控件，可以作为图片查看器或者轮播广告位，其一般是通过UIScrollView来实现的，除了可以滚动查看外，这种轮播器还有一个功能，即自动定位分页。
 所谓自动定位分页，是指当用户图片滑动轮播器在两个图片之间停下时，如果用户抬起手指，轮播器会自动根据图片显示出的部分尺寸大小进行定位，使轮播器完整显示某一张图片。UIScrollView类中提供了isPagingEnabled属性用来设置是否开启这种定位分页效果：
 
 //-------------------UIScrollViewDelegate 协议介绍------------------------//
  开发者需要对UIScrolIView滑动过程中的状态进行监听。
 UISorollViewDelegate协议中约定的许多方法会在UISerollView整个活动中有序被调用.
 首先，在ViewController类中添加遵守UIScrolViewDelegate协议：
 
  class ViewController:UIViewController,UIScrollViewDelegate
 设置UIScrollView实例的代理为当前视图控制器本身，如下：
 //设置代理
 scrollView.delegate = self
 
  UIScrollViewDelegate协议中的重要方法及意义列举如下：

 //当滚动视图滚动时被系统自动调用
 func scrollViewDidScroll(_ scrollView: UIScrollView) {
 }
  
 //当滚动视图缩放时被系统自动调用
 func scrollViewDidZoom(_ scrollView: UIScrollView) {
 }
 //当滚动视图将要开始拖曳时被系统自动调用
 func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {}
 
 //当滚动视图将要结束拖曳时被系统自动调用
 func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) { }
 //当滚动视图己经结束拖曳时被系统自动调用
 func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
 }
  //当滚动视图将要开始减速时被系统自动调用
  func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
 }
 
 //当滚动视图己经结朿减速时被系统自动调用
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {}
 
 //当滚动视图将要结束滚动动画时被系统自动调用
 func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
 }
 //通过返回值配置滚动视图中进行缩放操作的子视图
 func viewForZooming(in scrollView: UIScrollView) -> UIView? {
 }
 
 //当滚动视图将要开始缩放操作时被系统自动调用
 func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
 }
 
 //当滚动视图己经结束缩放时被系统自动调用
 func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
 }
 
 //通过返回值设置是否允许点击状态栏直接返回顶部
 func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
 }
 
 //当滚动视图通过用户点击状态栏滚动到顶部后会被调用
 func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
 }
 
 //------------UIScrollView 的缩放操作----------------//
 
 UIScroIIView十分强大，其支持用户对其内部的子视图进行缩放操作，这种场景在相册和许多游戏中十分常见，用户可以通过双指的捏合与扩张手势来对滚动视图中的内容进行缩小或放大。
 UIScrollViewDelegate中有协议方法来设置进行缩放的视图
 
  在模拟器上也可以模拟双指的捏合与扩张手势，按住键盘上的option 键不放，便会在屏幕上出现两个手指点，然后按住鼠标左键进行捏合与扩张手势的模拟
  
  
 
*/
