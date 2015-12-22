//
//  RequestUtils.swift
//  PMSIpadUI
//
//  Created by 赵鑫 on 15/12/22.
//  Copyright © 2015年 赵鑫. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class RequestUtils {
    
    
    static let FAILURE_MESSAGE = "请求失败"
    
    static func requestJson(url: String, parameter:String, requestDelegate: RequestDelegate) {
    
        let params = ["data":parameter]
        
        Alamofire.request(.POST, url, parameters: params).responseJSON { (response) -> Void in
            //
            PrintUntils.printLog("url", message: url)
            PrintUntils.printLog("paramters", message: params)
            PrintUntils.printLog("response", message: response)
            
            if response.result.error != nil {
            
                PrintUntils.printLog("responserror", message: response.result.error)
                PrintUntils.printLog("FAILURE_MESSAGE", message: FAILURE_MESSAGE)
                
            }
            
            else {
            
                PrintUntils.printLog("response", message: response)
                
                
                let jsonString = JSON(response.result.value!)
                
                let code = jsonString["code"].string!
                
                let message = jsonString["message"].string!
                
                switch code {
                
                case Constant.REQUEST_FAILURE_CODE:
                    
                    requestDelegate.requestFailure!(message)
                    
                case Constant.REQUEST_TIMEOUT_CODE:
                    requestDelegate.requestTimeOut!(message)
                    
                case Constant.REQUEST_SUCCESS_CODE:
                    
                    let arrayJson = jsonString["contents"]
                    
                    if arrayJson.count != 0 {
                    
                        requestDelegate.requestSuccess!(arrayJson.object, message: message)
                    }
                    
                    else {
                    
                        requestDelegate.requestDataNull!(message)
                    }
                    
                    
                default:
                    break
                }
            }
            
        }
    }
}