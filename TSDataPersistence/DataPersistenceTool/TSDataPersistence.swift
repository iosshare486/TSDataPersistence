//
//  TSDataPersistence.swift
//  TSDataPersistence
//
//  Created by huangyuchen on 2018/9/20.
//  Copyright © 2018年 洪利. All rights reserved.
//

import UIKit

//用户名相关
private let keychainService = "com.keyChain.service"

public enum TSDataPersistenceBufferCache {
    
    case disk //本地磁盘
    case userDefaults //UserDefaults
    case keyChain //钥匙串
}

open class TSDataPersistence {

    /// 本地存储
    ///
    /// - Parameters:
    ///   - value: value
    ///   - key: key
    ///   - bufferCache: 存储方式
    public static func set<T: Codable>(value: T, forKey key: String, bufferCache: TSDataPersistenceBufferCache) {
        
        switch bufferCache {
        case .disk:
            ts_cache.ts_set(value, forKey: key)
        case .keyChain:
            if value is String {
                let keychain = Keychain(service: keychainService)
                keychain[key] = (value as! String)
            }else {
                debugPrint("TSDataPersistence：钥匙串只能存储字符串")
            }
        case .userDefaults:
            if  value is Int ||
                value is String ||
                value is Float ||
                value is NSNumber ||
                value is CGFloat ||
                value is NSString ||
                value is NSDate ||
                value is Bool ||
                value is Double {
                UserDefaults.standard.setValue(value, forKey: key)
                UserDefaults.standard.synchronize()
            }else {
                
                debugPrint("TSDataPersistence：userDefault存储类型只支持Int String Float NSNumber CGFloat NSString NSDate Bool Double")
            }
        }
            
    }

    /// 获取本地存储
    ///
    /// - Parameters:
    ///   - key: key
    ///   - bufferCache: 存储方式
    /// - Returns: value
    public static func get<T: Codable>(forKey key: String, bufferCache: TSDataPersistenceBufferCache) -> T? {
        
        switch bufferCache {
        case .disk:
            return ts_cache.ts_object(forKey: key)
        case .keyChain:
            let keychain = Keychain(service: keychainService)
            return keychain[key] as? T
        case .userDefaults:
            return UserDefaults.standard.value(forKey: key) as? T
        }
        
    }
    
    /// 删除某个Key
    ///
    /// - Parameters:
    ///   - key: key
    ///   - bufferCache: 存储方式
    /// - Returns: 是否删除成功
    public static func remove(forKey key: String, bufferCache: TSDataPersistenceBufferCache) -> Bool {
        
        switch bufferCache {
        case .disk:
            ts_cache.removeObject(forKey: key)
        case .keyChain:
            let keychain = Keychain(service: keychainService)
            if keychain[key] != nil {
                do {
                    try? keychain.remove(key)
                }
                return true
            }else {
                debugPrint("TSDataPersistence：删除失败，没有此字段")
                return false
            }
        case .userDefaults:
            if UserDefaults.standard.object(forKey: key) != nil {
                UserDefaults.standard.removeObject(forKey: key)
                return true
            }else {
                debugPrint("TSDataPersistence：删除失败，没有此字段")
                return false
            }
        }
        return true
    }
    
    /// 清除所有本地存储 (为防止清除了重要信息，所以这里不清楚keyChain和Userdefault)
    ///
    /// - Returns: 是否成功
    public static func clear() -> Bool {
        // 清空磁盘
        ts_cache.removeAllObjects()
        return true
    }
    
}
