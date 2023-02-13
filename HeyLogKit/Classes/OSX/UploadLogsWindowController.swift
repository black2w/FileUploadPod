//
//  UploadLogsWindowController.swift
//  HeyLogKit-OSX
//
//  Created by shgbit_macdev1 on 2023/2/13.
//

import Cocoa

class UploadLogsWindowController: NSWindowController {

    @IBOutlet weak var titleLbl: NSTextField!
    @IBOutlet weak var cancelButton: HSButton!
    @IBOutlet weak var loadingView: HUDGifView!
    @IBOutlet weak var progressLbl: NSTextField!
    @IBOutlet weak var textLbl: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        let closeBtn = window?.standardWindowButton(.closeButton)
        closeBtn?.isHidden = true
        let zoomBtn = window?.standardWindowButton(.zoomButton)
        zoomBtn?.isHidden = true
        let minBtn = window?.standardWindowButton(.miniaturizeButton)
        minBtn?.isHidden = true
        
        configSubviewsUI()
    }
    
    @IBAction func onClickCancelAction(_ sender: HSButton) {
        // 停止上传
    }
}

private extension UploadLogsWindowController {
    func configSubviewsUI() {
                
        cancelButton.btnTitle = "取消"
        cancelButton.titleColor = NSColor.white
        cancelButton.backgroundColor = NSColor(calibratedRed: (47.0/255.0), green: (84.0/255.0), blue: (235.0/255.0), alpha: 1.0)
        cancelButton.hovBackgroundColor = NSColor(calibratedRed: (71.0/255.0), green: (103.0/255.0), blue: (235.0/255.0), alpha: 1.0)
        cancelButton.cornerRadius = 2.0
        cancelButton.updateUI()
     
        loadingView.configGifImage(name: "loading")
    }
}
