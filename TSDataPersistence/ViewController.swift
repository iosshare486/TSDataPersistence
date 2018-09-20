//
//  ViewController.swift
//  TSDataPersistence
//
//  Created by 洪利 on 2018/6/22.
//  Copyright © 2018年 洪利. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let cache = TSDataPersistenceCache.shareInstance
        
//        if let huancunStr =  cache.object(forKey: "缓存key"){
//            print(huancunStr as! String)
//        }
//        if let neicunhuancunStr =  cache.object(forKey: "内存缓存key"){
//            print(neicunhuancunStr as! String)
//        }
//
////        print(cache.object(forKey: "内存缓存key") as! String)
//
//        cache.memoryCache.set(object: "缓存数据" as AnyObject, forKey: "缓存key")
////        cache.memoryCache.set(object: "我是内存缓存数据", forKey: "内存缓存key")
//        cache.set("内存缓存数据", forKey: "内存缓存key")
//
//        if let huancunStr =  cache.object(forKey: "缓存key"){
//            print(huancunStr as! String)
//        }
        
//        let jsonStr = "{\"name\": \"BeJson\",\"url\": \"http://www.bejson.com\",\"page\": 88,\"isNonProfit\": true,\"address\": {\"street\": \"科技园路.\",\"city\": \"江苏苏州\",\"country\": \"中国\"},\"links\": [{\"name\": \"Google\",\"url\": \"http://www.google.com\"},{\"name\": \"Baidu\",\"url\": \"http://www.baidu.com\"},{\"name\": \"SoSo\",\"url\": \"http://www.SoSo.com\"}]}"
//
//        cache.set(jsonStr, forKey: "JSONDATA")
//        if let jsondata =  cache.object(forKey: "JSONDATA"){
//            print(jsondata as! String)
//        }
        
        
//        let model = try JSONDecoder().decode(AModel.self, from: ("{\"name\": \"洪利\",\"age\": \"18").data(using: .utf8)!)
//        var model = try JSONDecoder().decode(AModel.self, from: Data.in)
//        model.name = "洪利"
//        model.age = "8"
        
        let model = AModel()
        model.name = "sdfsdf"
        model.age = "7"
        
        
//        let bModel = Bmodel()
//        ts_cache.set(bModel, forKey: "hahah")
        
        
//        ts_cache.ts_set(model, forKey: "Model")
        

        
        TSDataPersistence.set(value: model, forKey: "model", bufferCache: TSDataPersistenceBufferCache.disk)
        
        if let md: AModel = TSDataPersistence.get(forKey: "model", bufferCache: TSDataPersistenceBufferCache.disk) {
            print(md)
        }

        
        TSDataPersistence.set(value: "model", forKey: "model", bufferCache: TSDataPersistenceBufferCache.keyChain)
        
        if let md: String = TSDataPersistence.get(forKey: "model", bufferCache: TSDataPersistenceBufferCache.keyChain) {
            print(md)
        }
        
        TSDataPersistence.set(value: 11111, forKey: "model", bufferCache: TSDataPersistenceBufferCache.userDefaults)
        
        if let md: Int = TSDataPersistence.get(forKey: "model", bufferCache: TSDataPersistenceBufferCache.userDefaults) {
            print(md)
        }
        
        TSDataPersistence.clear()
        
        if let md: AModel = TSDataPersistence.get(forKey: "model", bufferCache: TSDataPersistenceBufferCache.disk) {
            print(md)
        }
        
        if let md: String = TSDataPersistence.get(forKey: "model", bufferCache: TSDataPersistenceBufferCache.keyChain) {
            print(md)
        }
        
        if let md: Int = TSDataPersistence.get(forKey: "model", bufferCache: TSDataPersistenceBufferCache.userDefaults) {
            print(md)
        }
        
        
        //        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class AModel:Codable {
    var name = "洪利"
    var age = "8"
//    var hah : Array<String>?
    var hah : Array<SubUIImage>?
    
    
    
//    private enum CodingKeys: CodingKey {
//        case name
//        case age
//    }
//    func encode(to encoder:Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(age, forKey: .age)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        name = try container.decode(String.self, forKey: .name)
//        age = try container.decode(String.self, forKey: .age)
//    }
    
  
    
}

class SubUIImage: UIImage, Codable {
    
}



