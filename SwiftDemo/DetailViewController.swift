//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by Amale on 16/8/24.
//  Copyright © 2016年 Wind. All rights reserved.
//

import UIKit
//import Cocoa

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "闭包"
        //闭包
        //           闭包(Closures)是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
        //        Swift中的闭包有很多优化的地方:
        //        根据上下文推断参数和返回值类型
        //        从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
        //        可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
        //        提供了尾随闭包语法(Trailing closure syntax)
        //            {(parameters) -> return type in
        //                statements
        //        }
        
        //实例
        let studentName = {print("闭包实例")}
        
        studentName()
        
//        以下闭包形式接收两个参数并返回布尔值：

        let divide = {(val1:Int,val2:Int)->Int in
        
            return val1 / val2
        }
        
        let result = divide(100,10)
        
        print("闭包实例 ：\(result)")
        
//        sort 函数
//        下面的闭包表达式示例使用 sort 函数对一个 String 类型的数组进行字母逆序排序，以下是初始数组值
//        本篇以数组的sortInPlace方法为切入点，一步一步地介绍闭包是如何简化代码（并装逼）的。
//        注：数组的sort方法返回一个排序好的新数组，原来的数组不发生变化，而sortInPlace方法是直接修改原来的数组。
       
        var names = ["1Chris", "aAlex", "2Ewa", "4Barry", "0Daniella","98"]
    
         print("不使用普通函数为\(names.sort())") //从小到大
    
        //使用普通函数
        func backwards(s1:String,s2:String) ->Bool {
        
            return s1 > s2
        }
        
        var reversed = names.sort(backwards)
        
        print("使用普通函数 \(reversed)")
        
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
        
        print("尾随闭包之前 \(names)")
//        尾随闭包
//        尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
        var newNames = names.sort(){$0<$1}
        
        print("尾随闭包之后 newname  = \(newNames)")

        //捕获值
//        闭包可以在其定义的上下文中捕获常量或变量。
//        即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
//        Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
//        嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
        
        func makeIncrementor(forIncrement amount:Int) ->Void ->Int {
        
            var runningTotal = 0
            
            func incrementor() ->Int{
            
                runningTotal += amount
                
                return runningTotal
            }
            
            return incrementor
        }
        
//        一个函数makeIncrementor ，它有一个Int型的参数amout, 并且它有一个外部参数名字forIncremet，意味着你调用的时候，必须使用这个外部名字。返回值是一个()-> Int的函数。
//        函数题内，声明了变量runningTotal 和一个函数incrementor。
//        incrementor函数并没有获取任何参数，但是在函数体内访问了runningTotal和amount变量。这是因为其通过捕获在包含它的函数体内已经存在的runningTotal和amount变量而实现。
//        由于没有修改amount变量，incrementor实际上捕获并存储了该变量的一个副本，而该副本随着incrementor一同被存储。
        var incrementByTen = makeIncrementor(forIncrement: 10)
        
        print("捕获值  \(incrementByTen())")
        
        print("捕获值  \(incrementByTen())")
        
        print("捕获值  \(incrementByTen())")
        
        incrementByTen = makeIncrementor(forIncrement: 0)
        
        print("捕获值  \(incrementByTen())")
        
//        闭包是引用类型
//        上面的例子中，incrementByTen是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量值。
//        这是因为函数和闭包都是引用类型。
//        无论您将函数/闭包赋值给一个常量还是变量，您实际上都是将常量/变量的值设置为对应函数/闭包的引用。 上面的例子中，incrementByTen指向闭包的引用是一个常量，而并非闭包内容本身。
//        这也意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包：
        
        
        
        //枚举
//        枚举简单的说也是一种数据类型，只不过是这种数据类型只包含自定义的特定数据，它是一组有共同特性的数据的集合。
//        Swift 的枚举类似于 Objective C 和 C 的结构，枚举的功能为:
//        它声明在类中，可以通过实例化类来访问它的值。
//        枚举也可以定义构造函数（initializers）来提供一个初始成员值；可以在原始的实现基础上扩展它们的功能。
//        可以遵守协议（protocols）来提供标准的功能。
        // 定义枚举
        enum DaysofaWeek {
          
            case Sunday
            
            case Monday
            
            case TUESDAY
            
            case WEDNESDAY
            
            case THURSDAY
            
            case FRIDAY
            
            case Saturday
        }
        
       var weekDay = DaysofaWeek.THURSDAY
        
       weekDay = .THURSDAY
       
        
        
        
//        let digitNames = [
//            0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
//            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//        ]
//      
//        let numbers = [16, 58, 510]
//        
//        let strings = numbers.map {
//            
//            (var number) -> String in
//            
//            var output = ""
//            
//            while number > 0 {
//                
//                output = digitNames[number % 10]! + output
//              
//                number /= 10
//            }
//            return output
//        }
//
//        print("strings \(strings)")
        
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
