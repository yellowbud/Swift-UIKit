//
//  TableViewController.swift
//  UITableViewTest
//
//  Created by Huang Lei on 2022/3/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var carsDictionary = [String:[String]]()
    var carSectionTitles = [String]()
    var cars = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen"]
        
        //1
        for car in cars {
              let carKey = String(car.prefix(1))
                  if var carValues = carsDictionary[carKey] {
                      carValues.append(car)
                      carsDictionary[carKey] = carValues
                  } else {
                      carsDictionary[carKey] = [car]
                  }
          }
        
        //2
        carSectionTitles = [String](carsDictionary.keys)
        carSectionTitles = carSectionTitles.sorted(by: { $0 < $1 })
    }
    
    /*
     1.The first letter is extracted from each car and is used as a key of the carsDictionary. With this key a new array of cars is created, or when the key exists the car item is appended to the array.
     第一个字母是从每辆车中提取出来的，用作 carsDictionary 的键。使用这个键创建一个新的汽车数组，或者当该键存在时，汽车项被添加到数组中。
     
     2.The keys of the carsDictionary are sorted by alphabetical order.
     字典的按键是按字母顺序排序的。
     
     */
    
    
    

    // MARK: - Table view data source
    
    //change the delegate methods of the TableViewController 更改TableViewController 的委托方法
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        return carSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        let carKey = carSectionTitles[section]
        if let carValues = carsDictionary[carKey] {
            return carValues.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //3
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let carKey = carSectionTitles[indexPath.section]
           if let carValues = carsDictionary[carKey] {
               cell.textLabel?.text = carValues[indexPath.row]
           }
        return cell
    }
    
    /*
     
    1 The number of items in the carSectionTitles array will be returned in the numberOfSections(in:) method.
     Carsectiontitle 数组中的项数将在 numberOfSections (in:)方法中返回。
     
    2 The number of rows based on the number of cars in each section index is returned.
     返回基于每个区段索引中的汽车数量的行数。
     
    3 For each section index the car name is assigned to the text property of the textLabel property of the current cell.
     对于每个部分索引，汽车名称分配给当前单元格的 textLabel 属性的文本属性。
     
     
     
     
     
     */
    
    
    
    
    //-----------------------------------------------------------------------------------------------//
    //要在每个部分中显示标题
    //To display a header title in each section, implement the tableview(_:titleForHeaderInSection:) method.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return carSectionTitles[section]
    }

    
    //To add an indexed table view, implement the sectionIndexTitles(for:) method.
    //若要添加索引表视图
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return carSectionTitles
    }


}
