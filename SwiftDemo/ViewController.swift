//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Amale on 16/8/18.
//  Copyright © 2016年 Wind. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}




class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fbArr = [Int]()
        
        fbArr.append(0)
        
        fbArr.append(1)
        
<<<<<<< Updated upstream
        UIView.animate(withDuration: 2, animations: { () -> Void in
            
            
=======
        for i  in 0..<10 {//斐波那契数列前100位，也可以写成一个方法，前多少位根据传入参数决定
            
            let count = fbArr.count
            
            print("before \(fbArr)")
            
            let last1 = fbArr.index(before: count-1)
            
            let last2 = fbArr.index(before: count)
            
            print("last1 = \(last1) + last2 = \(last2)")
            //    
            //    var last = last1 + last2
            //    
            fbArr.append(last1+last2)
            
            
        }
        
        print(fbArr)
        
        
        backView.backgroundColor = UIColor.init(red: 10/255.0, green: 20/255.0, blue: 30/255.0, alpha: 1)
        
        
        UIView.animate(withDuration: 2, animations: { () -> Void in
            
            
>>>>>>> Stashed changes
        }) 
    
        
        self.blockDemoClcick { () -> (String) in
            
            
            
            let str = " dsasad"
            return str;
        }
        
        
        //你可以在一行中声明多个常量或者多个变量，用逗号隔开：
        var _a  = 10, _b=1, _c=0
        
        _a += 1
        
        _c += 1
        
        _b += 1
        
        //注意：如果你的代码中有不需要改变的值，请使用let关键字将它声明为常量。只将需要改变的值声明为变量。
        
        print("a的值\(_a)) b的值\(_b) c的值 \(_c)")
        

        
        //类型标注
        
        //元组（tuples）把多个值组合成一个复合值。元组内的值可以使任意类型，并不要求是相同类型。
        //元组把一个Int值和一个String值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为(Int, String)的元组”。
        
        let http404Err = (404,"not found")
        //你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为(Int, Int, Int)或者(String, Bool)或者其他任何你想要的组合的元组。
        let refundType = ("上拉","header")
        
        //分解
        let (statecode,stateErr)  = http404Err
        //如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
        
        let (httpcode,_) = http404Err
        
        //还有下标
        print("元祖数据404\(http404Err.0)")
        
        //给每一个元祖元素命名
      //  let http200Err = (urlCode:200,urlErr:"200")
        
        
        //optionals 可选
//        可选表示：
//        
//        有值，等于 x
//        或者
//        
//        没有值
        
        //ep;
        let telnumber = "15129086145"
        
        let intTelPhone = Int(telnumber)
        
        if
            (intTelPhone != nil) {
        
                 print("装好后大叔大婶\(intTelPhone!)")

        }else{

            
           
       }
        
        //可选绑定
        
        if let intintTeolPhoneNumber = Int(telnumber){
        
            print("telnum \(intintTeolPhoneNumber)")
            
        }else {
        
            print("kong ")
        }
        
        var addressnum :String? = "test"
        
        addressnum = nil
        
        print(addressnum)
        
        
        print("addressnum \(addressnum?.characters.count)")
        
        if addressnum?.characters.count>0{
        
            print("address count >0")
            
        }
        
       //Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选都可以被设置为nil，不只是对象类型。
        
        //断言
        //assert(addressnum != nil, "电话话不能为空")
        
        
        self.SwiftLearnClass()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Swift基本运算符详解
    func SwiftLearnClass(){
    
        //对于元祖的赋值
        let (x,y) = (1,2)
        
         print("x的值 \(x),y的值\(y)")
        
        if
            x==y {
        
                print("相等呀")
                
        }else{
        
            print("不等呀")
        }
        
        //溢出运算符 &(没看粗来)
        
        let z = x&+y
        
        print("z+y = \(z)")
        
        //加法运算符也用于String的拼接
        
        let formartstr = "hahah" + "zzzz"
        
        print("拼接后的 \(formartstr)")
        
        //不同于 C 语言和 Objective-C，Swift 中是可以对浮点数进行求余的。
        
        //Swift 也提供恒等===和不恒等!==这两个比较符来判断两个对象是否引用同一个对象实例
        
        //Swift 提供了两个方便表达一个区间的值的运算符。
        
        //闭区间运算符闭区间运算符（a...b）定义一个包含从a到b(包括a和b)的所有值的区间。 ‌ 闭区间运算符在迭代一个区间的所有值时是非常有用的，
   
        for index in 1...5 {
            
            print("\(index) * 5 = \(index * 5)")
        }
        
        //半闭区间
        //半闭区间（a..b）定义一个从a到b但不包括b的区间。 之所以称为半闭区间，是因为该区间包含第一个值而不包括最后的值。
        
//        for indexCount in 1..5{
//        
//            print("半闭区间")
//            
//        }
        self.learnStringDemo()
    }
    
    //Swift字符串和字符
    func learnStringDemo(){
    
        //String 是一个有序的字符集合
    
        let wiseWords = "\"我是要成为火影的男人\" - 鸣人"

        let dollarSign = "\\x24"             // $,  Unicode 标量 U+0024

        let blackHeart = "\\u2665"           // ♥,  Unicode 标量 U+2665
        
        let sparklingHeart = "\\U0001F496"   // 💖, Unicode 标量 U+1F496
        
        print("1  \(wiseWords) 2\(dollarSign) 3\(blackHeart) 4\(sparklingHeart) ")
        
        
        let emptyString :String = "test"               // 空字符串字面量
        
        var anotherEmptyString = String()  // 初始化 String 实例
        // 两个字符串均为空并等价。
        
        if emptyString.isEmpty
        {
        
            print("emptystr  为空")
        }
        
//        Swift 的 String 类型是值类型。
//        
//        使用字符(Characters)
    
        for charStr in "dogs!".characters{
        
        
            print("遍历字符拉 \(charStr)")
        }
        
        //计算字符数量 characters
        var unusualMenagerie  :String = "atest"
        
        
        print("unusualMenagerie de has \( unusualMenagerie.characters.count)")
        
        //比较字符串
        //Swift 提供了三种方式来比较字符串的值：字符串相等，前缀相等和后缀相等。
        //如果两个字符串以同一顺序包含完全相同的字符，则认为两者字符串相等：
        
        let unSametest = "test"
        
        if unSametest == unusualMenagerie{
        
            print("俩个字符串相等")
        }else {
        
            print("俩个字符串不相等")
        }
        
        //通过调用字符串的 hasPrefix/hasSuffix 方法来检查字符串是否拥有特定前缀/后缀。两个方法均需要以字符串作为参数传入并传出 Boolean 值。两个方法均执行基本字符串和前缀/后缀字符串之间逐个字符的比较操作。
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona,A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell" ]
        
        var act1SceneCount = 0
        
        for scene in romeoAndJuliet {
            if scene.hasSuffix("cell") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
        
        
        self.learnCollectionData()
    }
    
    
    //集合行数据
    func learnCollectionData(){
    
        var telPhoneList = [151,152,150,154,169,156]
        
        //var shoppingList: String[] = ["Eggs", "Milk"]
        
        for phoneobject in telPhoneList{
        
        print("数组初始元素 \(phoneobject)")
            
        }
        
        //末尾添加元素
        telPhoneList.append(157)
        
        telPhoneList += [158]
        
        for phoneObj in telPhoneList{
        
            print("数组添加后的元素 \(phoneObj)")
        }
        
        for phoneObj in telPhoneList[0...3]{
            
            print("数组区间内的添加后的元素 \(phoneObj)")
        }
        
        //使用insert 添加
        
        telPhoneList.insert(159, at: 0)
        
        //使用removeAtIndex
        
        print("移除 第\(telPhoneList.count-1) 元素值 \(telPhoneList.remove(at: telPhoneList.count-1))")
        
        //使用EnumerateSequence函数来遍历数租 返回值是一个元组
<<<<<<< Updated upstream
//        let hahahlist  = EnumeratedSequence.
//        
=======
//        let hahahlist  = EnumeratedSequence(telPhoneList)
        
>>>>>>> Stashed changes
//        for phoneObj in hahahlist{
//            
//            print("便利后返回元祖 \(phoneObj)")
//        }
        //声明一个空的数组
        var updateArr = [Int]()
        
        updateArr.append(1)
        
        
        //字典
        var aipDic = ["TYO":"Tokyo","DUB":"Dublin"]
        
        //var aipDicTwo:Dictionary<String,String> = ["TYO":"Tokyo","DUB":"123"]
        
        //可以使用下标语法向字典中添加新的元素。以一个合适类型的新键作为下标索引，并且赋给它一个合适类型的值：
        aipDic["LHR"] = "London"
        
        //也可以使用下标语法来改动某个键对应的值： nil updateValue
        aipDic["LHR"] = nil
        
        aipDic .updateValue("LHTON", forKey: "LHR")
        
        
        for OBJECE in aipDic{
        
         print("字典咯 \(OBJECE)")
        }
        //从字典中删除键值对也可以使用removeValueForKey函数。如果该键值对存在，该函数就返回本删掉的值，如果不存在，就返回nil：
        
        if let removeObj =  aipDic.removeValue(forKey: "1"){
        
            print("移除掉的数据是 \(removeObj)")
        }else{
        
            print("没有")
        }
        
        //生成一个空字典
        var modelDic = Dictionary<String,String>()
    
        self.LearnControlLine()
    }
    
    ///swift 控制流
    func LearnControlLine(){
    
//        Switch
//        
//        Switch语句用一个值来匹配相对应的几个匹配模式。然后执行相对应的代码块，基于一开始匹配成功的模式。switch语句提供了应对多种选择情况的处理来替代if语句。
//        
//        最简单的形式，switch比较一个值对应的一个或者多个相同形式的值：
        //相比C和objective-c中的switch语句，Swift中（如果忘了写break）的switch不会默认的掉落到每个case的下面进入另一个case。相反，switch语句当第一个遇到的
        //case完成时就完成了它整个的执行，不需要写break。因此比起C语言，swift的switch更加安全和简单，避免了执行多个case的错误。
    
        print("带有返回值的 \(learnFunction(personName: "sss"))")
        
       learnNoReturns(modelStr: "ss")
    }
    
 
    /**
     函数 外部参数名称速记
     
     - parameter personName: 输入的参数
     
     - returns: 返回一个参数
     */
    func learnFunction(personName:String)->String{

        let greeting = "返回的数据" + personName + "!"
        
        return greeting
    }
    

    /**
     <#Description#>
     
     - parameter modelStr: <#modelStr description#>
     */
    func learnNoReturns(modelStr:String)->Void{
    
        
        
    }
    
    
    func viewTapClick(_ animations: () -> Void){
    
        self.performSegue(withIdentifier: "DetailViewController", sender: nil)
        
    }
    
    func blockDemoClcick(_ successBlock:()->(String)){
    
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.viewTapClick { () -> Void in
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
