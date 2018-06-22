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
        
        
        
        let cache = TSDataPersistenceCache.shareInstance
        
        if let huancunStr =  cache.object(forKey: "缓存key"){
            print(huancunStr as! String)
        }
        if let neicunhuancunStr =  cache.object(forKey: "内存缓存key"){
            print(neicunhuancunStr as! String)
        }
        
//        print(cache.object(forKey: "内存缓存key") as! String)
        
        cache.memoryCache.set(object: "缓存数据" as AnyObject, forKey: "缓存key")
//        cache.memoryCache.set(object: "我是内存缓存数据", forKey: "内存缓存key")
        cache.set("内存缓存数据", forKey: "内存缓存key")
        
        if let huancunStr =  cache.object(forKey: "缓存key"){
            print(huancunStr as! String)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

