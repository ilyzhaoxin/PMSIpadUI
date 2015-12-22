//
//  PrintUitils.swift
//  PMSIpadUI
//
//  Created by 赵鑫 on 15/12/22.
//  Copyright © 2015年 赵鑫. All rights reserved.
//

import UIKit

class PrintUntils: Reflect {
    
    /**
     打印
     :param: tag     标签
     :param: message 打印
     */
    static func printLog(tag: String ,message: Any){
        
        print("********\(tag)**********************\n")
        print("\(tag)*******\(message)\n ")
        //debugPrint(message)
        print("************************************\n")
    }

}
