//
//  ViewControllerTwo.swift
//  UITabBarController
//
//  Created by Huang Lei on 2022/3/18.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "推荐"
        self.view.backgroundColor = UIColor.green
        
        //使用系统风格的标签
        let item = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
        self.tabBarItem = item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

/*
 
UITabBarItem 的构造方法UITabBarItem（tabBarSystemItem: ,tag:）的第一个参数需要传入一个UITabBarItem类型的枚举值，其中列举了许多常用的标签风格：
 
 
 
 
 
 
 */
public enum SystemItem : Int {
    
    case more
    case favorites
    //特色风格
    case featured
    
    //排行风格
    case topRated
    
    //最近风格
    case recents
    
    //联系人风格
    case contacts
    
    //历史风格
    case history
    
    //书库风格
    case bookmarks
    
    //搜索风格
    case search
    
    //下载风格
    case downloads
    
    //最近风格
    case mostRecent
    
    //浏览风格
    case mostViewed
}
