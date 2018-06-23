#TSDataPersistence

###数据持久化解决方案
>1、支持本地缓存、内存缓存
>
>2、支持异步线程安全式存储
>
>3、支持数据淘汰策略
>



###文件构成
![alt](https://ohduoklem.qnssl.com/WechatIMG33.jpeg)

>1、TSDataPersistenceMemoryCache.swift
>>用于操作内存缓存的类
>
>2、TSDataPersistenceDiskCache.swift
>>用于操作本地缓存的类
>
>3、TSDataPersistenceLinkedList.swift
>>管理缓存的类，主要用于路径处理、数据淘汰
>
>4、TSDataPersistenceCache.swift
>>数据本地化直接操作对象，通过该类的对象发起数据本地化操作


##使用
    //实例化对象
	let cache = TSDataPersistenceCache.shareInstance
###字符串等轻量级数据
	//写入
	//向内存缓存中存入数据
	cache.memoryCache.set(object: "内存缓存数据" as AnyObject, forKey: "内存缓存key")
	
	//向本地存入数据
	cache.set("本地缓存数据", forKey: "本地缓存key")
	
	//读取
	if let huancunStr =  cache.object(forKey: "内存缓存key"){
            print(huancunStr as! String)
        }
        
    if let neicunhuancunStr =  cache.object(forKey: "本地缓存key"){
            print(neicunhuancunStr as! String)
        }


###模型、JSON数据等


    //JSON Data
	let jsonStr = "{\"name\": \"BeJson\",\"url\": \"http://www.bejson.com\",\"page\": 88,\"isNonProfit\": true,\"address\": {\"street\": \"科技园路.\",\"city\": \"江苏苏州\",\"country\": \"中国\"},\"links\": [{\"name\": \"Google\",\"url\": \"http://www.google.com\"},{\"name\": \"Baidu\",\"url\": \"http://www.baidu.com\"},{\"name\": \"SoSo\",\"url\": \"http://www.SoSo.com\"}]}"
        
    cache.set(jsonStr, forKey: "JSONDATA")
    if let jsondata =  cache.object(forKey: "JSONDATA"){
            print(jsondata as! String)
        }

    //模型
    let model = AModel()
        model.name = "sdfsdf"
        model.age = "7"
        do {
            let encoder = JSONEncoder()
            let aData = try encoder.encode(model)
            cache.set(aData, forKey: "Model")
        } catch {
            print(error.localizedDescription)
        }
       
        
        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(AModel.self, from: cache.object(forKey: "Model") as! Data)
            print(model as! AModel)
        } catch {
            print(error.localizedDescription)
        }



