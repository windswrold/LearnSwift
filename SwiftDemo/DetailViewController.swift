//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by Amale on 16/8/24.
//  Copyright © 2016年 Wind. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "闭包"
        //闭包
//        sort 函数
//        下面的闭包表达式示例使用 sort 函数对一个 String 类型的数组进行字母逆序排序，以下是初始数组值
//        本篇以数组的sortInPlace方法为切入点，一步一步地介绍闭包是如何简化代码（并装逼）的。
//        注：数组的sort方法返回一个排序好的新数组，原来的数组不发生变化，而sortInPlace方法是直接修改原来的数组。
       
        var names = ["1Chris", "3Alex", "2Ewa", "4Barry", "0Daniella","98"]
        
//        不使用闭包
        names.sortInPlace() //  从小到大
        
        for var stringObj in names{
            
            print("stringobj1 \(stringObj)");
            
        }
//        使用闭包表达式
        names.sortInPlace { (num1:String, num2:String) -> Bool in return num1 > num2  }//从大到小
        
        print("stringObje2 + \(names)")
        
//        简化参数类型和返回值类型
//        由于swift的类型推断机制，闭包可以省去参数的类型和返回值的类型，简化之后，代码如下：
//        
//        names.sortInPlace({(num1,num2) in num1>num2})
        names.sortInPlace({(num1,num2) in num1>num2})
        
        print("stringObje3 + \(names)")
        
//        参数名简写
//        Swift自动为内联函数提供了参数名称简写功能，我们可以直接通过 $0,$1,$2 等名字来引用闭包中的参数。简化之后，
        names.sortInPlace({$0>$1})
        
//        运算符函数
        names.sortInPlace(>)
        

        let digitNames = [
            0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
      
        let numbers = [16, 58, 510]
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
