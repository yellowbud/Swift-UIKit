//
//  ViewController.swift
//  UISearchBar
//
//  Created by Huang Lei on 2022/3/16.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //进行 UISearchBar 控件的实例化
        let searchBar = UISearchBar(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        //设置控件风格
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        self.view.addSubview(searchBar)
        
        //显示控件的附件视图
        searchBar.showsScopeBar = true
        
        //设置附件视图按钮的个数和标题
        searchBar.scopeButtonTitles = ["女鞋","男装","男鞋","女装","童装"]
        
        //设置默认选中的附件视图按钮
        searchBar.selectedScopeButtonIndex = 0
        
        //由于附件视图会修改搜索栏控件的frame，因此需要重新设置
        searchBar.frame = CGRect(x: 20, y: 100, width: 280, height: 150)
        
    }


}



/*
 
 UISearchBarStyle类型的枚举值
public enum UISearchBarStyle: UInt {
    
    case 'default' //默认风格，与prominent 相同
   
    case prominent //用于系统邮件、信息和联系人等应用中的搜索栏风格
    
    case minimal //迷你风格，用于日历、音乐等应用中
}
 
 
 显示控件的取消按钮
 searchBar.showsCancelButton = true
 
 显示控件的书库按钮
 searchBar.showsBookmarkButton = true
 
 显示控件的搜素结果按钮
 searchBar.showsSearchResultsButton = true
 
 开发者通过如下方法可以实现对功能按钮图标的自定义：
*/

func setImage(_ iconImage: UIImage?,for icon: UISearchBar.Icon, state:UIControl.State){
    
}
/*
 第1个参数为设置的UIImage图片实例
 第2个参数为设置图标的功能按钮
 第3个参数为设置UISearchBar在显示该按钮时的状杰
 
 UISearchBar控件更像是UITextField控件与UISegmentedControl控件的结合体。复杂的控件往往是由简单的控件组合与扩展而来的
 
 使用下面的方法可以对UISearchBar控件的附件视图UI进行自定义：


//设置附件视图按钮的背景图片
public func setScopeBarButtonBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State){
    
}

//设置附件视图按钮间分隔线的图片
public func setScopeBarButtonDividerImage(_ dividerImage: UIImage?,forLeftSegmentState leftState: UIControl.State, rightSegmentState rightState:UIControl.State){
    
}

//设置附件视图按钮的标题文字属性
public func scopeBarButtonTitleTextAttributes(for state: UIControl.State) -> [NSAttributedString.Key : Any]?
 
 
 */


/*
 
 UISearchBar与用户的交互比较复杂，包括用户点击键盘搜索按钮时触发的方法、用户点击UISearchBar控件上的功能按钮时触发的方法、用户点击UISearchBar附件视图上的按钮时触发的方法以及对用户输入搜索内容和搜索框状态的监听。这些交互操作需要通过UISearchBarDelegate协议中约定的方法来完成，首先需要使 ViewController类遵守这个协议，代码如下：
class ViewController: UIViewController,UISearchBarDelegate
 
 
 
 将UISearchBar实例的代理设置为当前的ViewController实例，添加代码如下：
 searchBar.delegate = self
 
 UISearchBarDelegate中约定的方法及意义列举如下：
 
 //搜索栏将要开始编辑时调用的方法，返回 false 则不允许进入编辑状态，返回true则允许进入编辑状态
 
 
 */
func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    return true
}

//搜索栏已经进入编辑状态时调用的方法
func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    
}

//搜索栏将要结束编辑状态时调用的方法，返回 false 则不允许结束编辑状态，返回true 则允许结束编辑状态
func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
    return true
}

//搜索框已经结束编辑状态调用的方法
func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    
}

//搜索框中的文本发生变化时调用的方法
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
    
}

//搜索框中的文本将要发生交化时调用的方法，返回 false 则此次修改无效
func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange,replacementText text: String) -> Bool {
    return true
}

//用户点击键盘上的 Search 按钮（搜索按钮〉后触发的方法
func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
    
}

//用户点击书库按钮后触发的方法
func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar){
    
}

//用户点击取消按钮后触发的方法
func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
    
}

//用户点击搜素结果按钮后触发的方法
func searchBarResultsListButtonClicked(_ searchBar: UISearchBar){
    
}

//用户点击搜索栏附件视图上的按钮后触发的方法
func searchBar(_searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    
}

/*
 
 明确上述代理方法调用的时机和意义，可以灵活实现搜索栏控件与用户复杂交互的交互逻辑。
 
 UISearchBarDelegate 协议中的 searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)方法十分重要
 在实际应用中，当用户向搜索框中输入某个关键字后，应用可以智能地将此关键字相关的搜索条件提示给用户，也可以根据输入的关键字快速分析并给出预期
 的搜索结果。这些功能就是通过 UISearchBarDelegate 协议方法实现的。
 
 
 */


/*
 
 在开发过程中，遇到复杂的 UI 界面需要怎样的开发思路？
 
 1.界面开发中，独立组件的使用是基础，复杂的界面由各种复杂的组件组成，复杂的组件又是由基础组件组成的。因此，在开发复杂组件时，先进行界面组成的拆分，将复杂界面拆分成独立的组件，再对组件进行拆分，将复杂组件拆分成简单组件的组合，之后分别进行开发。
 
 2.界面有两种布局方式，一种是使用严格的坐标尺寸进行绝对布局，这种布局方式非常精准，却不太灵活，适配性也差；另一种是使用 Autolayout 技术进行相对布局，这是一种非常灵活的
 
 
 
 
 
 */
