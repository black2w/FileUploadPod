//
//  HeyUploadManager.swift
//  HeyLogKit
//
//  Created by black2w on 2023/2/7.
//

import Foundation
import SwiftHTTP
import HandyJSON

@objc public enum UPloadResult : Int {
    case    UPloadResult_Success = 0    //成功
    case    UPloadResult_Failure        //失败
    case    UPloadResult_Abort          //中断
}

@objc public enum UPloadUISelectResult : Int {
    case    UPloadUISelectResult_Upload = 0     //上传
    case    UPloadUISelectResult_Cancel         //取消
    case    UPloadUISelectResult_Abort          //中断上传
}

@objc public protocol HeyUploadManagerDelegate: NSObjectProtocol {
    //文件上传进度
    @objc optional func uploadProgress(progress: Float) -> Void
    
    //文件上传结果
    @objc optional func uploadResult(result: UPloadResult) -> Void
    
    //使用默认UI时的选择
    @objc optional func uploadUISelect(select: UPloadUISelectResult) -> Void
}



@objcMembers public class HeyUploadManager: NSObject {
    public var settings: HeyUPloadSetting  //设置
    public var delegate: HeyUploadManagerDelegate
    
    public init(setting: HeyUPloadSetting, delegate: HeyUploadManagerDelegate) {
        self.settings = setting
        self.delegate = delegate
    }
    
    
    public func execute(onView: NSView) -> Void {
        if self.settings.usingDefaultUI {
            self.usingIOSUI(onView: onView)
        } else {
            let _ = self.upload { isUploadSuccess in
                
            } progress: { progress, httpIntance in
                
            }


        }
    }
    
    private func upload(operaton: @escaping(_ isUploadSuccess: Bool) -> Void, progress: @escaping(_ progress: Float, _ httpIntance: HTTP?) -> Void) -> HTTP? {
        let upModel = HeyUploadRequestModel()
        upModel.filePath = self.settings.filePath
        
        let opt = HTTP.POST(self.settings.uploadUrl, parameters: ["file": Upload(fileUrl: URL(string: self.settings.filePath)!)]) { response in
            if let error = response.error {
                print("###HeyUpload### HTTP POST ERROR: \(error)")
                self.delegate.uploadResult?(result: .UPloadResult_Failure)
                return
            }

            let resModel = JSONDeserializer<HeyUploadResonseModel>.deserializeFrom(json: response.text)
            if let rp = resModel {
                if rp.isSucessFull() {
                    operaton(true)
                    self.delegate.uploadResult?(result: .UPloadResult_Success)
                } else {
                    operaton(false)
                    self.delegate.uploadResult?(result: .UPloadResult_Failure)
                }
            } else {
                operaton(false)
                self.delegate.uploadResult?(result: .UPloadResult_Failure)
            }
        }

        if let op = opt {
            op.progress = { percent in
                print("###HeyUpload### HTTP Upload Progress: \(percent)")
                progress(percent*100, op)
                self.delegate.uploadProgress?(progress: percent)
            }
        } else {
            print("###HeyUpload### unuseful HTTP Instance")
            operaton(false)
            progress(0.0, nil)
        }


        return opt
    }
}

//IOS UI
extension HeyUploadManager {
    private func usingIOSUI(onView: NSView) -> Void {
        confirmUploadFile(onView: onView)
    }
    
    private func confirmUploadFile(onView: NSView) -> Void {
        
        let uploadWc = UploadLogsWindowController.init(windowNibName: "UploadLogsWindowController")
        uploadWc.window?.setFrameOrigin(NSPoint(x: (onView.window?.frame.origin.x ?? 0) + (onView.window!.frame.size.width - 330)/2, y: (onView.window?.frame.origin.y ?? 0) + (onView.window!.frame.size.height - 230)/2))
        onView.window?.addChildWindow(uploadWc.window!, ordered: .above)
        
        let _ = upload { isUploadSuccess in
            DispatchQueue.main.async {
                if isUploadSuccess {
                    uploadWc.window?.close()
                } else {
                    uploadWc.textLbl.stringValue = "上传失败"
                }
            }
        } progress: { progress, httpIntance in
            DispatchQueue.main.async {
                uploadWc.progressLbl.stringValue = "\(progress)%"
            }
        }
    }
}


//macOS UI
extension HeyUploadManager {
    
}
