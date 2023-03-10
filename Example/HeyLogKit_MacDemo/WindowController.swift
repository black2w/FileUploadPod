//
//  WindowController.swift
//  HeyLogKit_MacDemo
//
//  Created by shgbit_macdev1 on 2023/2/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Cocoa
import HeyLogKit

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.testUploadLog()
        }
    }
    
    func testUploadLog() -> Void {
        let filePath = self.copyFileToDoucment()
        let setting = HeyUPloadSetting(fileName: "test", filePath: filePath ,usingDefaultUI: true, uploadUrl: "http://dev-tb.heyshare.cn/app/v2/log")
        let uploader = HeyUploadManager(setting: setting, delegate: self)
        uploader.execute(onView: (window?.contentView)!)
    }
    
    func copyFileToDoucment() -> String {
        let filePath = "file://" + Bundle.main.path(forResource: "2023", ofType: "zip")!
        let sourceUrl = URL(string: filePath)!

        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            if let documentsURL = documentsURL {
                let destURL = documentsURL.appendingPathComponent("2023.zip")
                do { try FileManager.default.copyItem(at: sourceUrl, to: destURL) } catch { error
                    print("copy error")
                }
                return destURL.absoluteString
            } else {
                return ""
            }
    }
}

extension WindowController: HeyUploadManagerDelegate {
    func uploadProgress(progress: Float) {
        
    }
    
    func uploadResult(result: UPloadResult) {
        
    }
    
    func uploadUISelect(select: UPloadUISelectResult) {
        
    }
}
