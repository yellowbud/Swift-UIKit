//
//  ViewController.swift
//  CAEmitterLayerTest1
//
//  Created by Huang Lei on 2022/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        
        //配置粒子发射引擎
        let fireEmitter = CAEmitterLayer()
        
        //设置发射引擎的位置和尺寸
        //将发射引擎放在屏幕底部中间
        fireEmitter.emitterPosition = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height - 20)
        fireEmitter.emitterSize = CGSize(width: self.view.bounds.size.width-100, height: 20)
        
        //粒子的渲染模式为混合渲染
        fireEmitter.renderMode = .additive
        
        
        //---------------配置粒子单元-------------------//
        //配置两个粒子单元，一个用来渲染火焰，另一个用来渲染烟雾
        
        //配置火焰单元
        let fireCell = CAEmitterCell()
        
        //设置每秒产生1500个粒子
        fireCell.birthRate = 1500
        
         //每个粒子的存活时间为3秒
        fireCell.lifetime = 3.0
        
        //设置粒子的存活时间随机范围为 1.5秒
        fireCell.lifetimeRange = 1.5
        
        //设置粒子渲染颜色
        
        fireCell.color = UIColor(red: 0.8, green: 0.4, blue: 0.2, alpha: 0.1).cgColor
        
        //设置粒子的内容
        fireCell.contents = UIImage(named: "emtter")?.cgImage
        
        //设置粒子运动速度为 120
        fireCell.velocity = 120
        
        //设置粒子运动速度随机范围为 60
        fireCell.velocityRange = 60
        
        //设置粒子在 x-y 平面的发射角度
        fireCell.emissionLongitude = CGFloat(Double.pi + Double.pi / 2)
        
        //设置粒子发射角度的随机范围
        fireCell.emissionRange = CGFloat(Double.pi)
        
        //设置粒子的缩放速率
        fireCell.scaleSpeed = 0.5
        
        //设置粒子的旋转
        fireCell.spin = 0.2
        
        //------------------配罝烟雾粒子------------------------//
        
        let smokeCell = CAEmitterCell()
        smokeCell.birthRate = 1000
        smokeCell.lifetime = 4.0
        smokeCell.lifetimeRange = 1.5
        smokeCell.color = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05).cgColor
        smokeCell.contents = UIImage(named: "emtter")?.cgImage
        smokeCell.velocity = 200
        smokeCell.velocity = 100
        smokeCell.emissionLongitude = CGFloat(Double.pi + Double.pi / 2)
        smokeCell.emissionRange = CGFloat(Double.pi)
        
       // 配置粒子发射引擎的粒子单元
        fireEmitter.emitterCells = [fireCell,smokeCell]
        self.view.layer.addSublayer(fireEmitter)
        
    }
    
    
    
    
    


}

/*
 
雨滴和雪花的运动路径都有一定随机性。要创造类似这种动画，要使用CoreAnimation框架中的粒子效果技术。
 粒子效果，顾名思义是创建以粒子为单位的动画效果。
 CoreEmitterLayer类可以十分轻松地开发出炫酷的粒子效果动面
 
 
 
 /--------------------粒子发射引擎与粒子单元---------------------------//
 
 完整的粒子效果图层由两部分组成：一部分是粒子发射引擎，另一部分是粒子单元。
 
 发射引擎负责粒子发射效果的宏观属性，例如粒子的创建速度、粒子的存活时间、粒子发射的位置等
 
 粒子单元则用来设置具体单位粒子的属性，例如粒子的运行速度、粒子的形变与颜色等
 
 在粒子效果中，CAEmitterLayer类作为粒子发射引擎，CAEmitterCell类作为粒子发射单元。
 关于粒子发射引擎CAEmitterLayer，常用属性与方法列举如下：
 //设置粒子单元组
 open var emitterCells: [CAEmitterCell]?
 
 //设置粒子的创建速率
 open var birthRate: Float
 
 //设置粒子的存活时间
 open var lifetime: Float
 
 设置粒子发射引擎在 x-y 平面的位置
 open var emitterPosition: CGPoint
 
 设置粒子发射器在z轴上的位置
 open var emitterPosition: CGFloat
 
 设置粒子发射引擎的尺寸
 open var emitterSize: CGSize
 
 设置粒子发射引擎的景深
 open var emitterDepth: CGFloat
 
 设置粒子发射器的形状
 open var emitterShape: String
 
 设置粒子发射器的发射模式
 open var emitterMode: String
 
 设置粒子发射器的渲染模式
 open var renderMode: String
 
 设置粒子发射的速度
 open var velocity: Float
 
 设置粒子的缩放比例
 open var scale: Float
 
  //设置粒子的旋转程度
  open var spin: Float
 
 //----------- emitterShape属性用于设置粒子发射引擎的形状，其可以设置的常量定义如下：--------------------------//

 // 粒子发射引擎为点状
 public static let point: CAEmitterLayerEmitterShape
 //粒子发射引擎为线状
 public static let line: CAEmitterLayerEmitterShape
 //粒子发射引擎为矩形形状
 public static let rectangle: CAEmitterLayerEmittershape
 //粒子发射引擎为立方体形状
 public static let cuboid: CAEmitterLayerEmitterShape
 //粒子发射引擎为圆形形状
 public static let circle: CAEmitterLayerEmitterShape
 //粒子发射引擎为球形形状
 public static let sphere: CAEmitterLayerEmitterShape
 
 
 //------emitterMode属性用于设置粒子发射引擎的发射模式，可以设置的常量定义如下-------------------------//
 
 //粒子从发射器中间发出
 public static let points: CAEmitterLayerEmitterMode
 //粒子从发射器边缘发出
 public static let outline: CAEmitterLayerEmitterMode
 //粒子从发射器表面发出
 public static let surface: CAEmitterLayerEmitterMode
 //粒子从发射器中心发出
 public static let volume: CAEmitterLayerEmitterMode
 
 
 //------------renderMode属性用于设置粒子的渲染模式，可以设置的常量定义如下-------------------//
 
 粒子的生命，是指粒子从创建出来展示在界面上到从界面上消失释放的整个过程。
 
 //这种模式下，粒子是无序出现的，多个粒子单元发射的粒子将混合
 public static let unordered: CAEmitterLayerRenderMode
 
 这种模式下，生命久的粒子将会被渲染在最上层
 public static let oldestFirst: CAEmitterLayerRenderMode
 
 这种模式下，生命短的粒子将会被渲染在最下层
 public static let oldestLast: CAEmitterLayerRenderMode
 
 这种模式下，粒子的渲染按照粒子在Z轴的位置进行上下排序
 public static let backToFront: CAEmitterLayerRenderMode
 
 这种模式下，粒子将被混合
 public static let additive: CAEmitterLayerRenderMode
 
 //-----------------关于CAEmitterCell粒子单元类，其中常用属性与方法列举如下：-----------------------//
 
 //设置粒子的创建速率
 open var birthRate: Float
 
 //设置粒子的存活时间
 open var Iifetime : Float
 
 //设置粒子的存活时间随机范围
 open var lifetimeRange: Float
 
 //设置粒子在Z轴方向的发射角度。
 open var emissionLatitude: CGFloat
 
 //设置粒子在×-y平面的发射角度
 open var emissionLongitude: CGFloat
 
 //设置粒子的发射角度随机范围
 open var emissionRange: CGFloat
 
 //设置粒子的运行速度
 open var velocity: CGFloat
 
 //设置粒子的运行速度随机范围
 open var velocityRange: CGFloat
 
 //设置粒子在x轴方向上的加速度
 open var xAcceleration: CGFloat
 
 //设置粒子在y轴方向上的加速度
 open var yAcceleration: CGFloat
 
 //设置粒子在z轴方向上的加速度
 open var zAcceleration: CGFloat
 
 //设置粒子的缩放比例
 open var scale: CGFloat
 
 //设置粒子的缩放比例随机范围
 open var scaleRange: CGFloat
 //设置粒子的缩放速率
 open var scaleSpeed: CGFloat
 //设置粒子的旋转
 open var spin: CGFloat
 
 //设置粒子的旋转随机范围
 open var spinRange: CGFloat
 
 //设置粒子的渲染颜色
 open var color: CGColor?
 
 //设置粒子颜色中红色的随机范围。
 open var redRange : Float
 
 //设置粒子颜色中绿色的随机范围
 open var greenRange: Float
 
 //设置粒子颜色中蓝色的随机范围
 open var blueRange: Float
 
 //设置粒子颜色中透明度的随机范围
 open var alphaRange: Float
 
 //设置粒子的内容，可以设置为图片
 open var contents: Any?
 
 
 
 */


