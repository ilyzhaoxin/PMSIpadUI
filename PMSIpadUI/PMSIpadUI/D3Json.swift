//
//  D3Json.swift
//  PMSIpadUI
//
//  Created by 赵鑫 on 15/12/22.
//  Copyright © 2015年 赵鑫. All rights reserved.
//

import UIKit

class D3Json: D3Model {
    
    
    
    /// 构建json字符串
    class func objectConvertJson(object: Reflect?) -> String {
        
        var Json = String()
        
        let dic = object!.toDict() as! Dictionary<String,String>
        
        do {
            
            
            let jsonData: NSData = try NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions.PrettyPrinted)
            
            
            let json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
            
            
            Json =  json
            
        }
        catch {
            
            // print(ErrorType)
            print(error)
        }
        
       // PrintUntils.printLog("jsonString", message: Json)
        
        PrintUntils.printLog("jsonString", message: Json)
        return Json
        
    }

}
