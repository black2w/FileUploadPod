//
//  ViewController.swift
//  HeyLogKit
//
//  Created by wangwei on 02/07/2023.
//  Copyright (c) 2023 wangwei. All rights reserved.
//

import UIKit
import HeyLogKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cls: HeyKitClassTest = HeyKitClassTest()
        cls.test()
        
        self.testUploadLog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.        

        
    }
    
    
    func testUploadLog() -> Void {
//        let filePath = Bundle.main.path(forResource: "2023", ofType: "zip")!
//        self.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "zip")

        let filePath = self.copyFileToDoucment()
        let setting = HeyUPloadSetting(fileName: "test", filePath: filePath ,usingDefaultUI: true, uploadUrl: "http://dev-tb.heyshare.cn/app/v2/log")
        let uploader = HeyUploadManager(setting: setting, delegate: self)
        uploader.execute(onView: self.view)
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
        let filePath = Bundle.main.path(forResource: "2023", ofType: "zip")!
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        if let documentsURL = documentsURL {
            let destURL = documentsURL.appendingPathComponent("2023.zip")
            do { try FileManager.default.copyItem(at: URL(string: filePath)!, to: destURL) } catch { error
                
            }
            return destURL.absoluteString
        } else {
            return ""
        }
    }
}

extension ViewController: HeyUploadManagerDelegate {
    func uploadProgress(progress: Float) {
        
    }
    
    func uploadResult(result: UPloadResult) {
        
    }
    
    func uploadUISelect(select: UPloadUISelectResult) {
        
    }
}

