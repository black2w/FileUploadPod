//
//  HeyUPloadSetting.swift
//  HeyLogKit
//
//  Created by black2w on 2023/2/7.
//

import Foundation

@objcMembers public class HeyUPloadSetting: NSObject {
    public var fileName: String   //文件名
    public var filePath: String   //文件路径
    public var usingDefaultUI: Bool = true  //使用默认UI
    public var uploadUrl: String    //上传目标路径

    public init(fileName: String, filePath: String, usingDefaultUI: Bool = true, uploadUrl: String) {
        self.fileName = fileName
        self.filePath = filePath
        self.usingDefaultUI = usingDefaultUI
        self.uploadUrl = uploadUrl
        super.init()
    }
    
    
}
