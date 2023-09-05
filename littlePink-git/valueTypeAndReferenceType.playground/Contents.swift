import UIKit


let a = 1; //内存中  而不是硬盘中  存储读取都是最快的---内存地址


struct Person{
    var name = "小王";
    var age = 20;
}

let p1 = Person()
var p2 = p1; //因为p2的age属性被修改了 所以这里需要变成 var
p2.age = 30;
print(p1.age)


class Person2{
    var name = "小李";
    var age = 300;
}

let p3 = Person2();
let p4 = Person2(); // 这里不用var是因为class的对象是引用类型,而引用类型如果地址不改变那么就不需要用var
p3.age = 400;
print(p3.age)

20
400






















