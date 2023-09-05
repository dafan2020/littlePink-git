import UIKit

//ARC automatic reference counting  自动引用计数
//指针(pointer)=内存地址

class Author{
    var name: String;
    unowned var video: Video?
    init(name: String) {
        self.name = name;
    }
    deinit {
        print("author对象被销毁了")
    }
}

class Video{
    unowned var author: Author
    init(author: Author){
        self.author = author;
    }
    deinit {
        print("Video对象被销毁了")
    }
}

var author:Author? = Author(name: "lebus");
var video:Video? = Video(author: author!);

author?.video = video; //左边可选性 右边正常  底层优化  尝试转换

author = nil;
video = nil;


class HTMLElement{
    let name: String
    let text: String?
    
    lazy var asHTMl: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
            }
            else{
                return "<\(self.name)/>"
            }
        }
    

    init(name: String, text: String? = nil){
        self.name = name;
        self.text = text;
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTMl())
paragraph = nil;




















