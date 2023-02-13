//
//  HSButton.swift
//  HeyShareMacRoom
//
//  Created by shgbit_macdev1 on 2021/6/7.
//


@objc protocol HSButtonHoverProtocol: NSObjectProtocol {
    func btn_showHover()
    func btn_hideHover()
}

import Cocoa

class HSButton: NSButton {
    // 按钮文字
    var btnTitle: String?
    // 按钮高亮文字
    var btnAlternateTitle: String?
    // 文字颜色, 高亮文字颜色
    var titleColor: NSColor = NSColor.labelColor
    var hovTitleColor: NSColor?
    var alternateTitleColor: NSColor = NSColor.labelColor
    // 选中文字颜色
    var selTitleColor: NSColor = NSColor.labelColor
    var selAlternateTitleColor: NSColor = NSColor.labelColor
    // 按钮图片
    var norImage: NSImage?
    var hovImage: NSImage?
    var selImage: NSImage?
    
    var titleAlignment: NSTextAlignment = .center
    weak var hoverDelegate: HSButtonHoverProtocol?
    // 状态
    var selected: Bool = false {
        didSet {
            if selected == true {
                // 设置选中文字颜色和图片
               configSelectedTitleColor()
                self.image = selImage
            } else {
                // 设置未选中文字颜色和图片
                configTitleColor()
                self.image = norImage
            }
        }
    }
    
    // 圆角,背景颜色,边框颜色
    var cornerRadius: CGFloat?
    var backgroundColor: NSColor?
    var hovBackgroundColor: NSColor?

    var borderColor: NSColor?
    
    var trackingArea: NSTrackingArea!
    
    var mouseInside = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        trackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeInActiveApp], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
    }
    
    func configTrackingArea() {
        trackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeInActiveApp], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
    }
    
    override func mouseEntered(with event: NSEvent) {
        
        if isEnabled == false {
            return
        }
        mouseInside = true
        hoverDelegate?.btn_showHover()
        
        if hovImage != nil {
            self.image = hovImage
        }
        
        if let hovBackgroundColor = hovBackgroundColor {
            self.layer?.backgroundColor = hovBackgroundColor.cgColor
        }
        
        configHovTitleColor()
        
    }
    
    override func mouseExited(with event: NSEvent) {
        if isEnabled == false {
            return
        }
        mouseInside = false
        hoverDelegate?.btn_hideHover()
        
        if selected && selImage != nil {
            self.image = selImage
        } else if selected == false && norImage != nil {
            self.image = norImage
        }
        
        if selected == false && backgroundColor != nil {
            self.layer?.backgroundColor = backgroundColor?.cgColor
        }
        
        if let _ = hovTitleColor, selected == false {
            configTitleColor()
        }
    }
    
    /// 更新UI
    func updateUI() {
        // 设置文字颜色
        if let title = btnTitle {
            self.title = title
            if mouseInside {
                configHovTitleColor()
            } else {
                configTitleColor()
            }
        }
        
        // 设置高亮文字颜色
        if let alternateTitle = btnAlternateTitle {
            self.alternateTitle = alternateTitle;
            configAlternateTitleColor()
        }
        
        // 设置圆角
        if let radius = cornerRadius, radius > 0 {
            self.wantsLayer = true
            self.layer?.cornerRadius = radius
            self.layer?.masksToBounds = true
        }
        // 设置背景颜色
        if let bgColor = backgroundColor {
            self.wantsLayer = true
            self.layer?.backgroundColor = bgColor.cgColor
        }
        
        // 设置边框颜色
        if let bColor = borderColor {
            self.wantsLayer = true
            self.layer?.borderColor = bColor.cgColor;
            self.layer?.borderWidth = 1.0
        } else {
            self.layer?.borderWidth = 0
        }
        
        if selected == false && norImage != nil {
            self.image = norImage
            layoutSubtreeIfNeeded()
            
            if let _ = trackingArea {
                removeTrackingArea(trackingArea)
                trackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeInActiveApp], owner: self, userInfo: nil)
                addTrackingArea(trackingArea)
            }
        }
    }
    
    private func configTitleColor() {
        let pghStyle = NSMutableParagraphStyle()
        pghStyle.alignment = titleAlignment
        
        let dict = [NSAttributedString.Key.font : (self.font ?? [NSFont .systemFont(ofSize: 14)]), NSAttributedString.Key.foregroundColor : titleColor, NSAttributedString.Key.paragraphStyle : pghStyle] as [NSAttributedString.Key : Any]
        self.attributedTitle = NSAttributedString(string: title, attributes: dict)
        
        if let backgroundColor = backgroundColor {
            self.layer?.backgroundColor = backgroundColor.cgColor
        }
        
        if let borderColor = borderColor {
            self.layer?.borderColor = borderColor.cgColor
        }
    }
    
    private func configHovTitleColor() {
        if let color = hovTitleColor {
            let pghStyle = NSMutableParagraphStyle()
            pghStyle.alignment = titleAlignment
            
            let dict = [NSAttributedString.Key.font : (self.font ?? [NSFont .systemFont(ofSize: 14)]), NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.paragraphStyle : pghStyle] as [NSAttributedString.Key : Any]
            self.attributedTitle = NSAttributedString(string: title, attributes: dict)
        }
        
        if let backgroundColor = hovBackgroundColor {
            self.layer?.backgroundColor = backgroundColor.cgColor
        }
        
        if let _ = borderColor {
            self.layer?.borderColor = NSColor.clear.cgColor
        }
    }
    
    private func configAlternateTitleColor() {
        let pghStyle = NSMutableParagraphStyle()
        pghStyle.alignment = titleAlignment
        
        let dict = [NSAttributedString.Key.font : (self.font ?? [NSFont .systemFont(ofSize: 14)]), NSAttributedString.Key.foregroundColor : alternateTitleColor, NSAttributedString.Key.paragraphStyle : pghStyle] as [NSAttributedString.Key : Any]
        self.attributedAlternateTitle = NSAttributedString(string: title, attributes: dict)
    }
    
    private func configSelectedTitleColor() {
        let pghStyle = NSMutableParagraphStyle()
        pghStyle.alignment = titleAlignment
        
        let dict = [NSAttributedString.Key.font : (self.font ?? [NSFont .systemFont(ofSize: 14)]), NSAttributedString.Key.foregroundColor : selTitleColor, NSAttributedString.Key.paragraphStyle : pghStyle] as [NSAttributedString.Key : Any]
        self.attributedTitle = NSAttributedString(string: title, attributes: dict)
    }
}
