//
//  RequestDelegate.swift
//  PMSIpadUI
//
//  Created by 赵鑫 on 15/12/22.
//  Copyright © 2015年 赵鑫. All rights reserved.
//

import Foundation

@objc protocol RequestDelegate: NSObjectProtocol {
    
    
    /**
     请求数据成功
     
     :param: json    json格式的字符串
     :param: message 返回信息描述
     */
    optional  func requestSuccess(json:AnyObject?,message:String)
    /**
     请求数据失败
     
     :param: message  返回信息描述
     */
    optional func requestFailure(message:String)
    /**
     请求数据成功，但是数据为空
     
     :param: message 返回信息描述
     */
    optional func requestDataNull(message:String)
    
    /**
     请求超时，重新登录
     
     :param: message 返回信息描述
     */
    optional func requestTimeOut(message:String)
    
    /**
     服务器连接异常，即断网了。
     
     - parameter message: 返回信息描述
     */
    optional func requestConnectionError(message:String)
    
    /**
     下载音乐数据成功
     
     :param: data  回调传递data 数据
     */
    optional func requestMusicSuccess(data:NSData);
    /**
     获取音乐失败
     
     :param: message 回调返回信息
     */
    optional func requestMusicFailure(message:String);
    
    /**
     下载视频数据成功
     
     :param: data  回调返回data 数据
     */
    optional func requestVideoSuccess(data:NSData);
    /**
     获取视频失败
     
     :param: message 回调返回信息
     */
    optional func requestVideoFailure(message:String);
    
    /**
     上传图片成功
     
     :param: message 回调返回信息
     */
    optional func uploadImageSuccess(message:String);
    /**
     上传图片失败
     
     :param: message 回调返回信息
     */
    optional func uploadImageFailure(message:String);
    
}