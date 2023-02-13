//
//  HUDGifView.swift
//  HeyShareMacRoom
//
//  Created by shgbit_macdev1 on 2021/4/13.
//

import Cocoa

class HUDGifView: NSView {
    
    // MARK: 私有属性
    private var image:NSImage?
    private var gifbitmapRep:NSBitmapImageRep?
    private var currentFrameIdx:NSInteger?
    private var gifTimer:Timer?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        drawGif()
    }
    
    // 销毁定时器
    func invalidateTimer() {
        if (gifTimer != nil) {
            gifTimer?.invalidate()
            gifTimer = nil
        }
    }
    
    /// 设置gif动图
    /// - Parameter image: 图片资源
    func configGifImage(img:NSImage) {
        image = img;
        self.gifbitmapRep = nil
        if (gifTimer != nil) {
            gifTimer?.invalidate()
            gifTimer = nil
        }
        
        let reps = image!.representations
        for rep:NSImageRep in reps {
            if (rep.isKind(of: NSBitmapImageRep.self)) {
                let bitmapRep = rep as! NSBitmapImageRep
                let numFrame:Int = bitmapRep.value(forProperty: .frameCount) as! Int
                if numFrame == 0 {
                    break
                }
                let delayTime:Float = bitmapRep.value(forProperty: .currentFrameDuration) as! Float
                currentFrameIdx = 0
                gifbitmapRep = bitmapRep

                gifTimer = Timer.scheduledTimer(timeInterval: TimeInterval(delayTime), target: self, selector: #selector(animateGif), userInfo: nil, repeats: true)

                RunLoop.main.add(gifTimer!, forMode: RunLoop.Mode.common)
            }
        }
    }
    
    @objc func animateGif() {
        self.setNeedsDisplay(self.bounds)
    }
    
    private func drawGif() {
        guard self.gifbitmapRep != nil else { return }
        
        let numFrame:Int = gifbitmapRep?.value(forProperty: .frameCount) as! Int
        if self.currentFrameIdx ?? 0 >= numFrame {
            self.currentFrameIdx = 0
        }
        
        gifbitmapRep?.setProperty(.currentFrame, withValue: self.currentFrameIdx)
        
        var drawGifRect = NSRect.zero
        if (image!.size.width > self.frame.size.width || image!.size.height > self.frame.size.height) {
            let hfactor = image!.size.width / self.frame.size.width;
            let vfactor = image!.size.height / self.frame.size.height;
            let factor = fmax(hfactor, vfactor);
            let newWidth =  image!.size.width / factor;
            let newHeight =  image!.size.height / factor;
            drawGifRect = NSRect.init(x: (self.frame.size.width - newWidth) / 2.0, y: (self.frame.size.height - newHeight) / 2.0, width: newWidth, height: newHeight)
        } else {
            drawGifRect = NSRect.init(x: (self.frame.size.width - image!.size.width) / 2.0, y: (self.frame.size.height - image!.size.height) / 2.0, width: image!.size.width, height: image!.size.height)
        }
        gifbitmapRep?.draw(in: drawGifRect, from: NSRect.zero, operation: .sourceOver, fraction: 1.0, respectFlipped: false, hints: nil)
        self.currentFrameIdx! += 1
    }
}
