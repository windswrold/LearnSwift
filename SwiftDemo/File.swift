//
//  File.swift
//  SwiftDemo
//
//  Created by Amale on 16/9/26.
//  Copyright © 2016年 Wind. All rights reserved.
//

import Foundation

extension Int{

    var add: Int {return self + 100 }
  
    var sub: Int { return self - 10 }
    
    var mul: Int { return self * 10 }
    
    var div: Int { return self / 5 }
    
    struct sum {
        
        var num1 = 100,num2 = 200
        
    }
    
    struct diff {
        
        var no1 = 200,no2=300
        
    }
    
    struct mult {
        
        var a = sum()
        
        var b = diff()
        
    }
   
    func popName() -> Int {
       
        
        return 20
    }
    
    
}

struct TOS<T>{
    
    var items = [T]()
    
    //            使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，在设计接口的时候，也要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法。
    mutating func pushItem(item:T) -> Void {
        
        items.append(item)
    }
    
    mutating func popItem() -> Void {
        
        items.removeLast()
        
    }
    
}
//当你扩展一个泛型类型的时候（使用 extension 关键字），你并不需要在扩展的定义中提供类型参数列表。更加方便的是，原始类型定义中声明的类型参数列表在扩展里是可以使用的，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
extension TOS{

    var first : T?{
    
        return items.isEmpty ? nil : items[items.count]
    }
    
    

}


