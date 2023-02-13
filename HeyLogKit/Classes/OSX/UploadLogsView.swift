//
//  UploadLogsView.swift
//  HeyShareMacRoom
//
//  Created by shgbit_macdev1 on 2021/7/21.
//
import Cocoa
import AppKit

class UploadLogsView: NSView {

    typealias dismissBlock = ()->Void
    typealias completeBlock = (Bool)->Void

    @IBOutlet weak var titleLbl: NSTextField!
    @IBOutlet weak var cancelButton: HSButton!
    @IBOutlet weak var loadingView: HUDGifView!
    @IBOutlet weak var progressLbl: NSTextField!
    @IBOutlet weak var textLbl: NSTextField!
    var block: dismissBlock?
    var comBlock: completeBlock?
    
    // 生命周期
    override func awakeFromNib() {
        configSubviewsUI()
    }
    
    @IBAction func onClickCancelAction(_ sender: HSButton) {
        // 停止上传

    }
}

private extension UploadLogsView {
    func configSubviewsUI() {
        
        titleLbl.stringValue = "日志上传"
        
        cancelButton.btnTitle = "取消"
        cancelButton.titleColor = NSColor.white
        cancelButton.norImage = NSImage(named: "button_bg_nor")
//        cancelButton.hovImage = NSImage(named: "button_bg_hov")
//        cancelButton.updateUI()
//
//        loadingView.configGifImage(img: NSImage.init(named: "loading")!)
    }
    
}

// 初始化
extension UploadLogsView {
    class func loadNibView() -> UploadLogsView? {
        var topLevelObjects : NSArray?
//        if Bundle.main.loadNibNamed("UploadLogsView", owner: self, topLevelObjects: &topLevelObjects) {
//            return topLevelObjects!.first(where: { $0 is UploadLogsView }) as? UploadLogsView ?? UploadLogsView()
//        } else {
//            return UploadLogsView()
//        }
        
        return nil
    }
    
    func dismissUploadView(cancelBlock: @escaping dismissBlock) {
        block = cancelBlock
    }
    
    func startUpload(resultBlock: @escaping completeBlock) {
        comBlock = resultBlock
        textLbl.stringValue = "日志上传中"
//        HeyControl.sharedInstance.uploadLogs { respObj in
//            if let block = self.comBlock {
//                block(respObj.success)
//            }
//            if respObj.success == false {
//                self.textLbl.stringValue = "上传失败"
//            }
//        } percent: { [self] progress in
//            DispatchQueue.main.async {
//                progressLbl.stringValue = "\(progress)%"
//            }
//        }
    }
}
