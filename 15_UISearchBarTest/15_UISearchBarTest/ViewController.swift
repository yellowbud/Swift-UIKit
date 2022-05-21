//
//  ViewController.swift
//  15_UISearchBarTest
//
//  
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //进行UISearchBar控件的实例化
        let searchBar = UISearchBar(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        //设置控件风格
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        //将控件添加到当前视图上
        self.view.addSubview(searchBar)
        
        //显示控件的附件视图
        searchBar.showsScopeBar = true
        //设置附件视图按钮个数和标题
        searchBar.scopeButtonTitles = ["女鞋","男装","男鞋","女装","童装"]
        //设置默认选中的附件视图按钮
        searchBar.selectedScopeButtonIndex = 0
        //由于附件视图会修改搜索栏控件的frame 所以需要重新设置
        searchBar.frame = CGRect(x: 20, y: 100, width: 280, height: 150)
        searchBar.delegate = self
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
            return true
        }
    //搜索栏已经进入编辑状态时调用的方法
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    //搜索栏将要结束编辑状态时调用的方法 返回false则不允许结束编辑状态 返回true则允许结束编辑状态
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    //搜索框已经结束编辑状态调用的方法
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    //搜索框中文本发生变化时调用的方法
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
    }
    //搜索框中文本将要发生变化时调用的方法 返回false则此次修改无效
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
        return true
    }
    //用户点击键盘Search按钮（搜索按钮）后触发的方法
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
    }
    //用户点击书库按钮后触发的方法
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar){
        
    }
    //用户点击取消按钮后触发的方法
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        
    }
    //用户点击搜索结果按钮后触发的方法
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar){
        
    }
    //用户点击搜索栏附件视图上的按钮后触发的方法
    func searchBar(_searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
    }


}

