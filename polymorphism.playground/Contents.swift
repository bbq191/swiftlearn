//继承，多态及类型转换
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name:String, director:String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name:String, artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}
//范型的自动类型推断
let array1 = [Movie(name: "1", director: "a"),Song(name: "2", artist: "b"),Movie(name: "3", director: "c")]
print(type(of: array1))//mediaitem
let array2 = [Movie(name: "1", director: "a"),Movie(name: "3", director: "c")]
print(type(of: array2))//movie
for item in array1 {
    //类型转换
    //as? 返回一个类型转换的可选项
    //as! 将类型转换和强制展开结合为一个步骤
    if let realItem = item as? Movie {
        print(realItem.director)
    }
}
