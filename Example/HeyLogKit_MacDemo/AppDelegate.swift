//
//  AppDelegate.swift
//  HeyLogKit_MacDemo
//
//  Created by black2w on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Cocoa
import HeyLogKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.testUploadLog()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    func testUploadLog() -> Void {
//        let filePath = Bundle.main.path(forResource: "2023", ofType: "zip")!
//        self.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "zip")

        let filePath = self.copyFileToDoucment()
        let setting = HeyUPloadSetting(fileName: "test", filePath: filePath ,usingDefaultUI: true, uploadUrl: "http://dev-tb.heyshare.cn/app/v2/log")
        let uploader = HeyUploadManager(setting: setting, delegate: self)
        uploader.execute(onView: self.window.contentView!)
    }

    func copyFilesFromBundleToDocumentsFolderWith(fileExtension: String) {
        if let resPath = Bundle.main.resourcePath {
            do {
                let dirContents = try FileManager.default.contentsOfDirectory(atPath: resPath)
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let filteredFiles = dirContents.filter{ $0.contains(fileExtension)}
                for fileName in filteredFiles {
                    if let documentsURL = documentsURL {
                        let sourceURL = Bundle.main.bundleURL.appendingPathComponent(fileName)
                        let destURL = documentsURL.appendingPathComponent(fileName)
                        do { try FileManager.default.copyItem(at: sourceURL, to: destURL) } catch { }
                    }
                }
            } catch { }
        }
    }
    
    func copyFileToDoucment() -> String {
//        let filePath = Bundle.main.path(forResource: "2023", ofType: "zip")!
        let sourceUrl = URL(filePath: Bundle.main.path(forResource: "2023", ofType: "zip")!)

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


extension AppDelegate: HeyUploadManagerDelegate {
    func uploadProgress(progress: Float) {
        
    }
    
    func uploadResult(result: UPloadResult) {
        
    }
    
    func uploadUISelect(select: UPloadUISelectResult) {
        
    }
}

