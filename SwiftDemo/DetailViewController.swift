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

        
//        LearnClosuresData()
//        
//        LearnEnumData()
        
//        LearnStructData()

//        LearnPropertyData()
        
//        LearnFunctionData()
        
//        LearnSubscriptData()
        
//        LearnBaseClassData()
        
//        LearnDeinitializerData()
        
//        LearnDeinitData()
        
//        LearnOptionalChainingData()
        
//        LearnMeromryData()
        
//        learnParmaDataType()
        
//        learnExtensionType()
        
        learnExangeData()
        
    }
    
    /**
     学习闭包
     */
    func LearnClosuresData() -> Void {
        
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
        
        print("不使用普通函数为\(names.sorted())") //从小到大
        
        //使用普通函数
        func backwards(_ s1:String,s2:String) ->Bool {
            
            return s1 > s2
        }
        
        var reversed = names.sorted(by: backwards)
        
        print("使用普通函数 \(reversed)")
        
        //        不使用闭包
        names.sort() //  从小到大
        
        for var stringObj in names{
            
            print("stringobj1 \(stringObj)");
            
        }
        //        使用闭包表达式
        names.sort { (num1:String, num2:String) -> Bool in return num1 > num2  }//从大到小
        
        print("stringObje2 + \(names)")
        
        //        简化参数类型和返回值类型
        //        由于swift的类型推断机制，闭包可以省去参数的类型和返回值的类型，简化之后，代码如下：
        //
        //        names.sortInPlace({(num1,num2) in num1>num2})
        names.sort(by: {(num1,num2) in num1>num2})
        
        print("stringObje3 + \(names)")
        
        //        参数名简写
        //        Swift自动为内联函数提供了参数名称简写功能，我们可以直接通过 $0,$1,$2 等名字来引用闭包中的参数。简化之后，
        names.sort(by: {$0>$1})
        
        //        运算符函数
        names.sort(by: >)
        
        print("尾随闭包之前 \(names)")
        //        尾随闭包
        //        尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
        var newNames = names.sorted(){$0<$1}
        
        print("尾随闭包之后 newname  = \(newNames)")
        
        //捕获值
        //        闭包可以在其定义的上下文中捕获常量或变量。
        //        即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
        //        Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
        //        嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
        
        func makeIncrementor(forIncrement amount:Int) ->(Void) ->Int {
            
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
    }
    
    /**
     学习枚举
     */
    func LearnEnumData() -> Void {
        
        //枚举
        //        枚举简单的说也是一种数据类型，只不过是这种数据类型只包含自定义的特定数据，它是一组有共同特性的数据的集合。
        //        Swift 的枚举类似于 Objective C 和 C 的结构，枚举的功能为:
        //        它声明在类中，可以通过实例化类来访问它的值。
        //        枚举也可以定义构造函数（initializers）来提供一个初始成员值；可以在原始的实现基础上扩展它们的功能。
        //        可以遵守协议（protocols）来提供标准的功能。
        // 定义枚举
        enum DaysofaWeek :Int{
            
            case sunday = 1, monday,wednesday ,thursday,friday ,saturday
            
            //            case Monday
            //
            //            case Monday
            //
            //            case WEDNESDAY
            //
            //            case THURSDAY
            //
            //            case FRIDAY
            //
            //            case Saturday
        }
        
        var weekDay = DaysofaWeek.thursday
        
        weekDay = .thursday
        
        //原始值
        //原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。
        //        在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。
        //        例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0。
        
        print("weekdayweekday \(weekDay.rawValue)  value \(weekDay) ")
        
        print(weekDay, separator: "haha", terminator: "test")
        
        
        
        //        枚举中定义的值（如 Sunday，Monday，……和Saturday）是这个枚举的成员值（或成员）。case关键词表示一行新的成员值将被定义。
        //        注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
        
        //        相关值
        //        下实例中我们定义一个名为 Student 的枚举类型，它可以是 Name 的一个相关值（Int，Int，Int，Int），或者是 Mark 的一个字符串类型（String）相关值。
        
        enum Student{
            
            case name(String)
            
            case mark(Int,Int,Int)
        }
        var studDetails = Student.name("Runoob")
        
        studDetails = Student.name("ss")
        
        var studMarks = Student.mark(98,97,95)
        
        studMarks = Student.mark(98,97,95)
        
        switch studDetails {
            
        case .name(let studName):
            
            print("学生的名字是: \(studName)。")
            
        case .mark(let Mark1, let Mark2, let Mark3):
            
            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
        }
        
        //关联值
        enum BarCode{
            
            case upca (Int,Int,Int)
            
            case qrcode (String)
        }
        
        var productBarcode = BarCode.upca(10, 20_10, 30)
        
        print("关联值  = \(productBarcode)")
        
        productBarcode = .qrcode("haha")
        
        print("关联值2 = \(productBarcode)")
        
        switch productBarcode {
            
        case  .upca(let num1,let num2,let num3):
            
            print("num1 \(num1) num2 \(num2) num3 \(num3)")
            
        case  .qrcode(let string):
            
            print("string \(string) )")
        default:
            
            print("default \(productBarcode)")
        }
        
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
        
    }
    
    /**
     学习结构体
     */
    func LearnStructData() -> Void {
        
//        Swift 结构体是构建代码所用的一种通用且灵活的构造体。
//        我们可以为结构体定义属性（常量、变量）和添加方法，从而扩展结构体的功能。
//        与 C 和 Objective C 不同的是：
//        结构体不需要包含实现文件和接口。
//        结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。
//        结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。
        
//        语法
//        我们通过关键字 struct 来定义结构体：
//        struct nameStruct {
//            Definition 1
//            Definition 2
//            ……
//            Definition N
//        }
        
//        实例
//        我们定义一个名为 MarkStruct 的结构体 ，结构体的属性为学生三个科目的分数，数据类型为 Int：

        struct studentMarks{
        
            var Mark1 = 100
            
            var Mark2 = 79
            
            var Mark3 = 60

        }
        
        let marks = studentMarks()
        
        print("mark \(marks)")
        
//        以下实例化通过结构体实例化时传值并克隆一个结构体：
        
        struct MarkStruct{
        
            var mark : Int
            
            
//            init(mark:Int){
//            
//                self.mark = mark
//                
//            }
        
        }
        
        
//        var Astruct =  MarkStruct(mark:10)

        let Astruct =  MarkStruct.init(mark: 10)
        
        var Bstruct = Astruct // aStruct 和 bStruct 是使用相同值的结构体！
        
        Bstruct.mark = 97
        
        print("Asurt \(Astruct)")
        
        print("Bsurt \(Bstruct)")
        
        //        结构体应用
//        在你的代码中，你可以使用结构体来定义你的自定义数据类型。
//        结构体实例总是通过值传递来定义你的自定义数据类型。
//        按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
//        结构体的主要目的是用来封装少量相关简单数据值。
//        有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
//        任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
//        结构体不需要去继承另一个已存在类型的属性或者行为。
//        举例来说，以下情境中适合使用结构体：
//        几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
//        一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
//        三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
        
//        类和结构体
//        Swift 中类和结构体有很多共同点。共同处在于：
//        定义属性用于储存值
//        定义方法用于提供功能
//        定义下标用于通过下标语法访问值
//        定义初始化器用于生成初始化值
//        通过扩展以增加默认实现的功能
//        符合协议以对某类提供标准功能
//        
//        与结构体相比，类还有如下的附加功能：
//        继承允许一个类继承另一个类的特征
//        类型转换允许在运行时检查和解释一个类实例的类型
//        取消初始化器允许一个类实例释放任何其所被分配的资源
//        引用计数允许对一个类的多次引用

        struct Resolution {
        
            var width = 0
            
            var height = 0
            
        }
        
        class VideoMode{
        
            var resolution = Resolution()
            
            var interlaced = false
            
            var frameRate = 0
            
//            var name = ""
            
            var name :String? //name属性会被自动赋予一个默认值nil，意为“没有name值”，因它是一个可选类型。
            
        }
        
//        生成对应的实例
        let someResolution = Resolution()
        
        let someVideoMode = VideoMode()
        
        
        
//        结构体和类都使用初始化器语法来生成新的实例。初始化器语法的最简单形式是在结构体或者类的类型名称后跟随一个空括弧，如Resolution()或VideoMode()。通过这种方式所创建的类或者结构体实例，其属均会被初始化为默认值。构造过程章节会对类和结构体的初始化进行更详细的讨论。
        
        //Swift 中数组(Array)和字典(Dictionary)类型均以结构体的形式实现。然而当数组被赋予一个常量或变量，或被传递给一个函数或方法时，其拷贝行为与字典和其它结构体有些许不同。
        //以下对数组和结构体的行为描述与对NSArray和NSDictionary的行为描述在本质上不同，后者是以类的形式实现，前者是以结构体的形式实现。NSArray和NSDictionary实例总是以对已有实例引用,而不是拷贝的方式被赋值和传递。
//        注意：以下是对于数组，字典，字符串和其它值的拷贝的描述。 在你的代码中，拷贝好像是确实是在有拷贝行为的地方产生过。然而，在Swift 的后台中，只有确有必要，实际(actual)拷贝才会被执行。Swift 管理所有的值拷贝以确保性能最优化的性能，所以你也没有必要去避免赋值以保证最优性能。(实际赋值由系统管理优化)
        //如果字典实例中所储存的键(keys)和/或值(values)是值类型(结构体或枚举)，当赋值或调用发生时，它们都会被拷贝。相反，如果键(keys)和/或值(values)是引用类型，被拷贝的将会是引用，而不是被它们引用的类实例或函数。字典的键和值的拷贝行为与结构体所储存的属性的拷贝行为相同。
        
//        下面的示例定义了一个名为ages的字典，其中储存了四个人的名字和年龄。ages字典被赋予了一个名为copiedAges的新变量，同时ages在赋值的过程中被拷贝。赋值结束后，ages和copiedAges成为两个相互独立的字典。
        
        let ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
        
        var copiedAges = ages
        
        //ages 与 copiedAges 已经成为了俩个独立的字典
        
//        数组的赋值和拷贝行为
//        在Swift 中，数组(Arrays)类型的赋值和拷贝行为要比字典(Dictionary)类型的复杂的多。当操作数组内容时，数组(Array)能提供接近C语言的的性能，并且拷贝行为只有在必要时才会发生。
//        
//        如果你将一个数组(Array)实例赋给一个变量或常量，或者将其作为参数传递给函数或方法调用，在事件发生时数组的内容不会被拷贝。相反，数组公用相同的元素序列。当你在一个数组内修改某一元素，修改结果也会在另一数组显示。
//        
//        对数组来说，拷贝行为仅仅当操作有可能修改数组长度时才会发生。这种行为包括了附加(appending),插入(inserting),删除(removing)或者使用范围下标(ranged subscript)去替换这一范围内的元素。只有当数组拷贝确要发生时，数组内容的行为规则与字典中键值的相同
        
        var myNamesA = [1,2,3,4]
        
        var myNamesB = myNamesA
        
        var myNamesC = myNamesA
        
        myNamesA[0] = 5
        
        print("A \(myNamesA[0]) B \(myNamesB[0]) C \(myNamesC[0])")
        
        myNamesA .append(6)
        
        print("A \(myNamesA) B \(myNamesB) C \(myNamesC)")
        
//        们通过使用恒等运算符(identity operators)( === and !==)来判定两个数组或子数组共用相同的储存空间或元素。
//        我们还可以使用恒等运算符来判定两个子数组是否共用相同的元素。
        
        myNamesB = [1,2,3,4]
        
        myNamesC = [1]
        
        if myNamesB.contains(myNamesB[0]) {
            
            print("包含1")
            
        }
    
    
        
    }
    
    /**
     学习属性
     */
    func LearnPropertyData() -> Void {
        //        延迟存储属性
//        延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
//        在属性声明前使用 lazy 来标示一个延迟存储属性。
//        注意：
//        必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
//        延迟存储属性一般用于：
//        延迟对象的创建。
//        当属性的值依赖于其他未知类

        class number{
        
            var name = "swift 属性"
            
           
            
        }
        
        
        class myStudent{
        
          lazy  var newNumber = number() // `var` 关键字是必须的
        
            
        }
        
        let newMyStudent = myStudent()
        
        print(newMyStudent.newNumber.name)
        
//        计算属性
        
//        除存储属性外，类、结构体和枚举可以定义计算属性，计算属性不直接存储值，而是提供一个 getter 来获取值，一个可选的 setter 来间接设置其他属性或变量的值。

        class sample {
            var no1 = 0.0, no2 = 0.0
            var length = 300.0, breadth = 150.0
            
            var middle: (Double, Double) {

//                return (length / 2 ,breadth/2)
                
                get {
                
                    return (length / 2 ,breadth/2)
                }
                
                //一个num 的元祖
//                set(num){
//                
//                    no1 = num.0
//                    
//                    no2 = num.1
//                }
            }
        }
        
        let Newsample = sample()
        
       // Newsample.middle = (20.0,30.0)
        
        print(Newsample.middle);
        
        //        只读计算属性
//        只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点(.)运算符访问，但不能设置新的值。如上
        
//        属性观察器
//        属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
//        可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
//        注意：
//        不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。
//        可以为属性添加如下的一个或全部观察器：
//        willSet在设置新的值之前调用
//        didSet在新的值被设置之后立即调用
//        willSet和didSet观察器在属性初始化过程中不会被调用
 
        class Samplepgm{
            
            var counter :Int = 0 {
            
                //willSet监视器会将新的属性值作为固定参数传入，在willSet的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称newValue表示。
                willSet(newtol){
                
                    print("设置的新值 \(newtol)")
                }
                
                //didSet监视器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名oldValue。
                didSet{
                    
                    print("新值 \(counter) 就只 \(oldValue)")
                }
                
                
            }
            
            
            
        }
        
        let aaanewSample = Samplepgm()
        
        aaanewSample.counter = 10
        
        aaanewSample.counter = 20
        
        
        
    }
    
    /**
     学习方法
     */
    func LearnFunctionData() -> Void {
        
//        实例方法
//        在 Swift 语言中，实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
//        实例方法提供以下方法：
//        可以访问和修改实例属性
//        提供与实例目的相关的功能
//        实例方法要写在它所属的类型的前后大括号({})之间。
//        实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
//        实例方法只能被它所属的类的某个特定实例调用。
//        实例方法不能脱离于现存的实例而被调用。
        
        
//        ************************************************
//        类型方法
//        实例方法是被类型的某个实例调用的方法，你也可以定义类型本身调用的方法，这种方法就叫做类型方法。
//        声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的实现方法。
//        类型方法和实例方法一样用点号(.)语法调用。

        class Math{
        
            class func abs(_ number:Int) ->Int{
            
                if number<0 {
                    
                    return (-number)
                }
                
                return number
            }
            
        
        }
        
        struct absno{
        
            //声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的实现方法
            static func abs(_ number:Int) ->Int{
            
                if number < 0 {
                    
                    return (-number)
                }
                
                return number
            }
        
            
        }
        
        let no = Math.abs(-35)
        
        let num = absno.abs(-5)
        
        print(no)
        
        print(num)
        
        
        

    }
    
    /**
     学习下标脚本
     */
    func LearnSubscriptData() -> Void {
        
//        下标脚本 可以定义在类（Class）、结构体（structure）和枚举（enumeration）这些目标中，可以认为是访问对象、集合或序列的快捷方式，不需要再调用实例的特定的赋值和访问方法。
//        举例来说，用下标脚本访问一个数组(Array)实例中的元素可以这样写 someArray[index] ，访问字典(Dictionary)实例中的元素可以这样写 someDictionary[key]。
//        对于同一个目标可以定义多个下标脚本，通过索引值类型的不同来进行重载，而且索引值的个数可以是多个。
//        下标脚本语法及应用
//        语法
//        下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。
//        语法类似于实例方法和计算型属性的混合。
//        与定义实例方法类似，定义下标脚本使用subscript关键字，显式声明入参（一个或多个）和返回类型。
//        与实例方法不同的是下标脚本可以设定为读写或只读。这种方式又有点像计算型属性的getter和setter：
        
//        ep1
        struct subexample{
        
            let decrmmenter : Int
            
            //下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。
            subscript (index : Int) -> Int {
            
                
                return decrmmenter / index
            }
            
        }
        
        let divvision = subexample.init(decrmmenter: 100)
        
        print("100 / 10 等于 \(divvision[10])")
        
//        ep2
        
        class daysofaweek{
        
          fileprivate   var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                                "Thursday", "Friday", "saturday"]
        
            
            subscript (index:Int) ->String{
            
                set {
                
                    var chooseIndex = index
                    
                    if chooseIndex>days.count {
                    
                        chooseIndex = days.count-1
                    }
                    
                    self.days[chooseIndex] = newValue
                    
                }
                
                get {
                    
                    var chooseIndex = index
                    
                    if chooseIndex>days.count {
                        
                        chooseIndex = days.count-1
                    }
                    
                
                     return ( days[chooseIndex] )
                }
                
            }
            
        }
        
        let  p = daysofaweek()
        
        print(p[100]) //也会越界
        
//        用法
//        根据使用场景不同下标脚本也具有不同的含义。
//        通常下标脚本是用来访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。
//        你可以在你自己特定的类或结构体中自由的实现下标脚本来提供合适的功能。
//        例如，Swift 的字典（Dictionary）实现了通过下标脚本对其实例中存放的值进行存取操作。在下标脚本中使用和字典索引相同类型的值，并且把一个字典值类型的值赋值给这个下标脚来为字典设值：
        
        var animans = ["spider": 8, "ant": 6, "cat": 4]
        
        animans["bird"] = 2
        
        print(animans)
        
        
//        附属脚本选项
//        
//        附属脚本允许任意数量的入参索引，并且每个入参类型也没有限制。附属脚本的返回值也可以是任何类型。附属脚本可以使用变量参数和可变参数，但使用写入读出（in-out）参数或给参数设置默认值都是不允许的。
//        
//        一个类或结构体可以根据自身需要提供多个附属脚本实现，在定义附属脚本时通过入参个类型进行区分，使用附属脚本时会自动匹配合适的附属脚本实现运行，这就是附属脚本的重载。
//        
//        一个附属脚本入参是最常见的情况，但只要有合适的场景也可以定义多个附属脚本入参。如下例定义了一个Matrix结构体，将呈现一个Double类型的二维矩阵。Matrix结构体的附属脚本需要两个整型参数：
        
    }
    
    /**
     学习继承
     */
    func LearnBaseClassData() -> Void {
        
        //基类
//        没有继承其它类的类，称之为基类（Base Class）。
//        以下实例中我们定义了基类 StudDetails ，描述了学生（stname）及其各科成绩的分数(mark1、mark2、mark3)：
        
        class BaseStudentDetails{
        
             //String!
            var stname :String?{
            
//                return self.stname
                
                get{
                
                     return self.stname
                }
                
                set{
                
                    self.stname = newValue
                }
                
            }
            
            var mark1  = 0
            
            var mark2  = 0
            
            var mark3  = 0
            
            init(stnamr:String,mark1:Int ,mark2:Int,mark3:Int){
                
                self.stname = stnamr
                
                self.mark1 = mark1
                
                self.mark2 = mark2
                
                self.mark3 = mark3
            
            }
           
            //final
//            防止重写
//            我们可以使用 final 关键字防止它们被重写。
//            如果你重写了final方法，属性或下标脚本，在编译时会报错。
//            你可以通过在关键字class前添加final特性（final class）来将整个类标记为 final 的，这样的类是不可被继承的，否则会报编译错误。
          final  func show() -> Void {
                
                print("猜猜猜 \(self.stname),mark \(self.mark1) mark \(self.mark2) mark \(self.mark3)")
            }
            
        }
        
        //子类
//        子类指的是在一个已有类的基础上创建一个新的类。
//        为了指明某个类的超类，将超类名写在子类名的后面，用冒号(:)分隔,语法格式如下
        class someClaa:BaseStudentDetails {
        
            //重载（override）子类可以通过继承来的实例方法，类方法，实例属性，或下标脚本来实现自己的定制功能，我们把这种行为叫重写（overriding）。
//            我们可以使用 override 关键字来实现重写。
//            访问超类的方法、属性及下标脚本
//            你可以通过使用super前缀来访问超类的方法，属性或下标脚本。

            fileprivate override var stname: String?{
            
                get{
                
                    return "重写了get"
                }
            
                set{
                
                    print("设置的新增 \(newValue)")
                    
                }
                
            }
            
            
            init() {
            
                super.init(stnamr: "10", mark1: 10, mark2: 10, mark3: 10)
           
            }
        
            //不能重写show 因为使用了final
//            private override func show() {
//                
//                super.show()
//                
//                print("子类的show方法")
//                
//            }
            
            
        }
        
        let some = someClaa()
        
        some.show()

        //重写属性
//        你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性。
//        子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。所以你在重写一个属性时，必需将它的名字和类型都写出来。
//        注意点：
//        如果你在重写属性中提供了 setter，那么你也一定要提供 getter。
//        如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。

        
        
        
    }
    
    /**
      学习构造过程
     */
    func LearnDeinitializerData() -> Void {
        
//        构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。
//        Swift 构造函数使用 init() 方法。
//        与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
//        类实例也可以通过定义析构器（deinitializer）在类实例释放之前执行清理内存的工作。
        
        
        
        
    }
    
    /**
     学习析构过程
     */
    func LearnDeinitData() -> Void {
        
//        在一个类的实例被释放之前，析构函数被立即调用。用关键字deinit来标示析构函数，类似于初始化函数用init来标示。析构函数只适用于类类型。
//        反初始化函数是在实例释放发生前一步被自动调用。不允许主动调用自己的反初始化函数。子类继承了父类的反初始化函数，并且在子类反初始化函数实现的最后，父类的反初始化函数被自动调用。即使子类没有提供自己的反初始化函数，父类的反初始化函数也总是被调用。
//        
//        因为直到实例的反初始化函数被调用时，实例才会被释放，所以反初始化函数可以访问所有请求实例的属性，并且根据那些属性可以修改它的行为(比如查找一个需要被关闭的文件的名称)。
        
        //Bank结构体管理一个虚拟货币的流通，在这个流通中Bank永远不可能拥有超过10,000的硬币。在这个游戏中有且只能有一个Bank存在，因此Bank由带有静态属性和静态方法的结构体实现，从而存储和管理其当前的状态。
//        Bank根据它的coinsInBank属性来跟踪当前它拥有的硬币数量。银行还提供两个方法—vendCoins和receiveCoins，用来处理硬币的分发和收集。
        struct Bank{
        
            static var coninsInBank = 10_000
            
            static func vendConins(_ numberOfConinsToVend : Int) ->Int {
                var numberOfConinsToVend = numberOfConinsToVend
            
                numberOfConinsToVend = min(coninsInBank, numberOfConinsToVend)
                
                coninsInBank -= numberOfConinsToVend
            
                return numberOfConinsToVend
            }
        
            static func receiveCoins(_ coins :Int){
            
                coninsInBank += coins
            }
        
        }
    
        //Player类描述了游戏中的一个玩家。每一个player在任何时刻都有一定数量的硬币存储在他们的钱包中。这通过player的coinsInPurse属性来体现:
//        Player类定义了一个winCoins方法，该方法从bank获取一定数量的硬币，并把它们添加到player的钱包。Player类还实现了一个反初始化函数，这个反初始化函数在Player实例释放前一步被调用。这里反初始化函数只是将player的所有硬币都返回给bank:
        class Player{
        
            var coinsInGame  = 0
            
            init(conins : Int){
            
                self.coinsInGame = Bank.vendConins(conins)
                
            }
            
            func winCoins(_ coins : Int) -> Void {
               
                self.coinsInGame += Bank.vendConins(coins)
                
            }
            
            deinit{
            
                Bank.receiveCoins(self.coinsInGame)
            }
            
        
        }


        
    }
    
    /**
     可选连
     */
    func LearnOptionalChainingData() -> Void {
        
//        可选链（Optional Chaining）是一种是一种可以请求和调用属性、方法和子脚本的过程，用于请求或调用的目标可能为nil。
//        可选链返回两个值：
//        如果目标有值，调用就会成功，返回该值
//        如果目标为nil，调用将返回nil
//        多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效。
//        ep1
    
        
//                可选链 '?'	感叹号（!）强制展开方法，属性，下标脚本可选链
//        ? 放置于可选值后来调用方法，属性，下标脚本	! 放置于可选值后来调用方法，属性，下标脚本来强制展开值
//        当可选为 nil 输出比较友好的错误信息	当可选为 nil 时强制展开执行错误
        
        class Room{
        
            let name : String
            
            init(name:String){
            
                self.name = name
            }
            
        }
        
        class Residence{
            
            var numberOfRooms = 0
            
//             定义了一个变量 rooms，它被初始化为一个Room[]类型的空数组
            var rooms = [Room]()
            
            var numberofRooms : Int{
            
                return self.rooms.count
            }
            
            subscript (i :Int) ->Room{
            
                var count = i
                
                if
                    count>self.rooms.count{
                
                    count = self.rooms.count
                }
                
                return self.rooms[count]
                
            }
           
            func showLog() -> Void {
                
                print("haha ")
                
            }
            
            
        }
        
        class Person{
        
            var residence : Residence?
            
        }
    
        let jack = Person()
        
//        let numer =  jack.residence!.numberOfRooms //想使用感叹号（!）强制解析获得这个人residence属性numberOfRooms属性值，将会引发运行时错误，因为这时没有可以供解析的residence值。
//        let numer =  jack.residence?.numberOfRooms
        
        if  let numer =  jack.residence?.numberOfRooms {
            
            print("房间号是 \(numer)")
            
        }else{
        
            print("不能查看房间号")
        }
    
    }
    
    /**
     内存管理
     */
    func LearnMeromryData() -> Void {
        
        //定义一个类为人
        class Person{
        
            let name :String
            
            init(name : String){
            
                self.name = name
                
                print("开始初始化")
            }
            
            deinit{
            
                print("被析构")
            }
            
        }
        
        //值会自动初始化为nil,目前还不会引用到person实例
        var reference1 :Person?
        
        var reference2 :Person?
        
        var reference3 :Person?
        
        //创建新实例
        reference1 = Person.init(name: "reference")
        
        //赋值给其他俩个变量又会多出俩个新的强引用
        reference2 = reference1 //俩个单独的
        
        reference3 = reference1 //单独的
        
        //断开第一个引用
        reference1 = nil
        
        print("per 1 \(reference2?.name),per3 \(reference3?.name)")
        
        reference2 = nil
        
        print("per 1 \(reference2?.name),per3 \(reference3?.name)")
    
        //无主引用是正确的解决循环强引用的方法。这样编写HTMLElement类来避免循环强引用：
//        解决实例之间的循环强引用
//        Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：
//        弱引用
//        无主引用
//        弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。
//        对于生命周期中会变为nil的实例使用弱引用。相反的，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。

//        *********************** 弱引用实例 ***********************
        
        class Module{
        
            let name : String
            
            init (name : String){self.name = name}
            
            var sub:SubModule?
            
            deinit{print("被析构  \(name)")}
            
            
        }
        
        class SubModule{
        
            let number : Int
            
            init (num:Int){self.number = num}
            
            //弱引用
//            weak var toppic : Module?
              var toppic : Module?
            
            
            
            deinit{print("子模块呗析构")}
            
            
        }
        
        var toc : Module?
        
        var list :SubModule?
        
        toc = Module(name:"ss")
        
        list = SubModule(num : 12)
        
        toc!.sub = list
        
        list!.toppic = toc
        
//        toc = nil
//        
//        list = nil
        
        
        
    }
    
    
    /// 不支持swift 类型转换
    func learnParmaDataType() -> Void {
        
//        Swift 类型转换
//        Swift 语言类型转换可以判断实例的类型。也可以用于检测实例类型是否属于其父类或者子类的实例。
//        Swift 中类型转换使用 is 和 as 操作符实现，is 用于检测值的类型，as 用于转换类型。
//        类型转换也可以用来检查一个类是否实现了某个协议。

        class subjects{
        
            var physics : String
            
            init(physics : String) {
                
                self.physics = physics
                
            }
        }
        
        class chemistry :subjects{
        
            var equations : String
            
            init(physics:String,equations:String) {
                
                self.equations = equations
                
                super.init(physics:physics)
            }
        }
        
        class maths : subjects {
        
            var formulae : String
            
            init(physics:String,formulae:String) {
                
                self.formulae = formulae
                
                super.init(physics:physics)
                
            }
            
        }
        
        let sa = [
            chemistry(physics: "固体物理", equations: "赫兹"),
            maths(physics: "流体动力学", formulae: "千兆赫"),
            chemistry(physics: "热物理学", equations: "分贝"),
            maths(physics: "天体物理学", formulae: "兆赫"),
            maths(physics: "微分方程", formulae: "余弦级数")
        ]
        
        
        let samplechem = chemistry(physics: "固体物理", equations: "赫兹")
        print("实例物理学是: \(samplechem.physics)")
        print("实例方程式: \(samplechem.equations)")
        
        
        let samplemaths = maths(physics: "流体动力学", formulae: "千兆赫")
        print("实例物理学是: \(samplemaths.physics)")
        print("实例公式是: \(samplemaths.formulae)")
        
        
        
//        检查类型
//        类型检查使用 is 关键字。
//            操作符 is 来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true，否则返回 false。
        
        var chemcount = 0
        
        var mathscount = 0
        
        for item in sa {
            // 如果是一个 Chemistry 类型的实例，返回 true，相反返回 false。
            
            if item is chemistry {
                
                chemcount += 1
            }else if item is maths {
            
                mathscount += 1
            }
        
            //        向下转型
            //        向下转型，用类型转换操作符(as? 或 as!)
            //        当你不确定向下转型可以成功时，用类型转换的条件形式(as?)。条件形式的类型转换总是返回一个可选值（optional value），并且若下转是不可能的，可选值将是 nil。
            //        只有你可以确定向下转型一定会成功时，才使用强制形式(as!)。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。
            
            if let show = item as? chemistry {
                
                 print("化学主题是: '\(show.physics)', \(show.equations)")
            }

            
            
        }
        print("化学科目包含 \(chemcount) 个主题，数学包含 \(mathscount) 个主题")
        
//        Any和AnyObject的类型转换
//        Swift为不确定类型提供了两种特殊类型别名：
//        AnyObject可以代表任何class类型的实例。
//        Any可以表示任何类型，包括方法类型（function types）。
//        注意：
//        只有当你明确的需要它的行为和功能时才使用Any和AnyObject。在你的代码里使用你期望的明确的类型总是更好的。
        
        var exampleany = [Any]()
        
        exampleany.append(12)
        
        exampleany.append(3.14)
        
        exampleany.append("hello world")
        
        exampleany.append(chemistry.init(physics: "化学", equations: "无机化学"))
        
        for items in exampleany {
            
            switch items {
            case let someint as Int:
                
                print("someint \(someint)")
                
            case let someString as String:
                
                print("someString \(someString)")
            case let  someDocuble as Double:
                
                print("somedocuble \(someDocuble)")
                
            case let someChemisity as chemistry :
               
                print("化学的信息了 \(someChemisity)")
                
            default:
                
                print("NONE  \(items)")
            }
           
            
        }
        
    }
    
    /**
     学习extension 扩展
     */
    func learnExtensionType() -> Void {
        
//        扩展就是向一个已有的类、结构体或枚举类型添加新功能。
//        扩展可以对一个类型添加新的功能，但是不能重写已有的功能。
//        Swift 中的扩展可以：
//        添加计算型属性和计算型静态属性
//        定义实例方法和类型方法
//        提供新的构造器
//        定义下标
//        定义和使用新的嵌套类型
//        使一个已有类型符合某个协议
//        语法
//        扩展声明使用关键字 extension：
//        extension SomeType {
//            // 加到SomeType的新功能写到这里
//        }
//        一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议，语法格式如下：
//        extension SomeType: SomeProtocol, AnotherProctocol {
//            // 协议实现写到这里
//        }
        
//        eg1.计算型属性 没用倒文件
        
        let number = 10.add
        
        number.sub
        
        number.popName()
        
        //构造器

//        构造器
//        扩展可以向已有类型添加新的构造器。
//        这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提供该类型的原始实现中没有包含的额外初始化选项。
//        扩展可以向类中添加新的便利构造器 init()，但是它们不能向类中添加新的指定构造器或析构函数 deinit() 。
        
        
        
        
    }
    
    /**
     泛型
     */
    func learnExangeData() -> Void {
        
//        Swift 提供了泛型让你写出灵活且可重用的函数和类型。
//        Swift 标准库是通过泛型代码构建出来的。
//        Swift 的数组和字典类型都是泛型集。
//        你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。
        
        var numb1 = 100
        
        var numb2 = 200
        
        numb1 = 200
        
        numb2 = 300
        
        print("泛型交换 行 \(numb1) numb2 \(numb2)")
        
        exchange(a: &numb1, b: &numb2)
        
        print("泛型交换 行 \(numb1) numb2 \(numb2)")
        
////        泛型类型
////        Swift 允许你定义你自己的泛型类型。
////        自定义类、结构体和枚举作用于任何类型，如同Array和Dictionary的用法。
//        struct TOS<T> {
//            var items = [T]()
//            mutating func push(_ item: T) {
//                items.append(item)
//            }
//            
//            mutating func pop() -> T {
//                return items.removeLast()
//            }
//        }
//        var tos = TOS<String>()
//        tos.push("Swift")
//        print(tos.items)
//        
//        tos.push("泛型")
//        print(tos.items)
//        
//        tos.push("类型参数")
//        print(tos.items)
//        
//        tos.push("类型参数名")
//        print(tos.items)
//
        
//        扩展泛型类型
//        当你扩展一个泛型类型的时候（使用 extension 关键字），你并不需要在扩展的定义中提供类型参数列表。更加方便的是，原始类型定义中声明的类型参数列表在扩展里是可以使用的，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
//        struct TOS<T>{
//        
//            var items = [T]()
//            
////            使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，在设计接口的时候，也要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法。
//            mutating func pushItem(item:T) -> Void {
//                
//                items.append(item)
//            }
//            
//           mutating func popItem() -> Void {
//                
//                items.removeLast()
//                
//            }
//        
//        }
        
        var tos = TOS<String>()
        
        tos.pushItem(item: "你猜猜1")
        
        tos.pushItem(item: "你猜猜2")
        
        tos.pushItem(item: "你猜猜3")
        
        tos.pushItem(item: "你猜猜4")
        
        print("tos item \(tos.items)")
        
        tos.popItem()
        
        print("pop end item \(tos.items)")

        print("first item  \(tos.first)")
        

        
    }
    

    
    
    /// 声明一个泛型 <E>
    ///
    /// - parameter a: 类型
    /// - parameter b: 类型
    func exchange<E>( a: inout E, b: inout E) {
        
        let temp = a
        
        a = b
        
        b = temp
    }
    

    deinit{
    
        print("vc 被析构")
    
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
