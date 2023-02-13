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
        cancelButton.backgroundColor = NSColor(calibratedRed: (47.0/255.0), green: (84.0/255.0), blue: (235.0/255.0), alpha: 1.0)
        cancelButton.hovBackgroundColor = NSColor(calibratedRed: (71.0/255.0), green: (103.0/255.0), blue: (235.0/255.0), alpha: 1.0)
        cancelButton.cornerRadius = 2.0
        cancelButton.updateUI()
    }
    
}

// 初始化
extension UploadLogsView {
    class func loadNibView() -> UploadLogsView? {
        var topLevelObjects : NSArray?
        
        let bundle = Bundle(for: UploadLogsView.self)
        if bundle.loadNibNamed("UploadLogsView", owner: self, topLevelObjects: &topLevelObjects) {
            return topLevelObjects!.first(where: { $0 is UploadLogsView }) as? UploadLogsView ?? UploadLogsView()
        } else {
            return UploadLogsView()
        }        
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
