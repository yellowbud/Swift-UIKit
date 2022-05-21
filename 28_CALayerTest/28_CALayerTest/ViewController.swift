//
//  ViewController.swift
//  28_CALayerTest


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建图层对象
        let gradientLayer = CAGradientLayer()
        //设置图层尺寸与位置
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        gradientLayer.position = CGPoint(x: 100, y: 100)
        //设置要进行色彩渐变的颜色
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor, UIColor.blue.cgColor]
        //设置要进行渐变的临界位置
        gradientLayer.locations = [NSNumber(value: 0.2),NSNumber(value: 0.5), NSNumber(value: 0.7)]
        //设置渐变的起始点与结束点
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        //添加到当前视图上
//        self.view.layer.addSublayer(gradientLayer)
        
        //创建拷贝图层
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.position = CGPoint.zero
        //创建内容图层
        let subLayer = CALayer()
        subLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        subLayer.position = CGPoint(x: 30, y: 100)
        subLayer.backgroundColor = UIColor.red.cgColor
        replicatorLayer.addSublayer(subLayer)
        //设置每次拷贝将副本沿x轴平移30个单位
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(30, 0, 0)
        //设置拷贝副本的个数
        replicatorLayer.instanceCount = 10
//        self.view.layer.addSublayer(replicatorLayer)
        
        //创建图层
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint.zero
        //创建图形路径
        let path = CGMutablePath()
        //设置路径起点
        path.move(to: CGPoint(x: 100, y: 100))
        //进行画线
        path.addLine(to: CGPoint(x: 300, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 100, y: 100))
        //设置图层路径
        shapeLayer.path = path
        //设置图形边缘线条起点
        shapeLayer.strokeStart = 0
        //设置图形边缘线条终点
        shapeLayer.strokeEnd = 1
        //设置填充规则
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        //设置填充颜色
        shapeLayer.fillColor = UIColor.red.cgColor
        //设置边缘线条颜色
        shapeLayer.strokeColor = UIColor.blue.cgColor
        //设置边缘线条宽度
        shapeLayer.lineWidth = 1
        self.view.layer.addSublayer(shapeLayer)
        
        //创建动画实例  keyPath为要进行属性动画的属性路径
        let basicAni = CABasicAnimation(keyPath: "transform.rotation.z")
        //从0度开始旋转
        basicAni.fromValue = NSNumber(value: 0)
        //旋转到180度
        basicAni.toValue = NSNumber(value: Double.pi)
        //设置动画播放的时长
        basicAni.duration = 2
        //将动画作用于当前界面的视图Layer层上
        self.view.layer.add(basicAni, forKey: nil)
        
        let keyframeAni = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        keyframeAni.values = [NSNumber(value: 0),NSNumber(value: Double.pi / 4), NSNumber(value: 0),NSNumber(value: Double.pi)]
        keyframeAni.duration = 3
        self.view.layer.add(keyframeAni, forKey: "")
        
        let springAni = CASpringAnimation(keyPath: "position.y")
        //模拟重物质量 必须大于0 默认为1 会影响惯性
        springAni.mass = 2
        //模拟弹簧劲度系数 必须大于0 这个值越大则回弹越快
        springAni.stiffness = 5
        //设置阻尼系数 必须大于0 这个值越大 回弹的幅度越小
        springAni.damping = 2
        springAni.toValue = 300
        springAni.duration = 3
        //创建演示动画的Layer
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer)
        layer.add(springAni, forKey: "")
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //创建转场动画实例
//        let transAni = CATransition()
//        //设置转场动画类型
//        transAni.type = CATransitionType.push
//        //设置转场动画方向
//        transAni.subtype = CATransitionSubtype.fromTop
//        let layer = CALayer()
//        layer.position = CGPoint(x: 100, y: 100)
//        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = UIColor.red.cgColor
//        layer.add(transAni, forKey: "")
//        self.view.layer.addSublayer(layer)
        
        //创建背景色过渡动画
        let basicAni = CABasicAnimation(keyPath: "backgroundColor")
        basicAni.toValue = UIColor.green.cgColor
        //创建形变动画
        let basicAni2 = CABasicAnimation(keyPath: "transform.scale.x")
        basicAni2.toValue = NSNumber(value: 2)
        //进行动画组合
        let groupAni = CAAnimationGroup()
        groupAni.animations = [basicAni,basicAni2]
        groupAni.duration = 3
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(groupAni, forKey: "")
        self.view.layer.addSublayer(layer)
    }
}

