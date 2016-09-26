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
    
}

