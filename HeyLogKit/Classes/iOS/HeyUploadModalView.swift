

import UIKit
import SnapKit

class HeyUploadModalView: UIView {
    private lazy var bgView: UIView = {
        let view :UIView = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    public var outShowView: HeyUploadBaseView!
    public var outBelowView: UIView!
    public var outShowViewSize: CGSize!  //展示页面大小

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.makeLayout()
    }
    
    
    public func showModalView(belowView: UIView, showView: HeyUploadBaseView, showSize: CGSize, event: @escaping HeyUPloadEventClosure) -> Void {
        self.isUserInteractionEnabled = true
        self.outBelowView = belowView
        self.outShowView = showView
        self.outShowViewSize = showSize        
        self.outShowView.alpha = 1.0
        self.outShowView.custormEvent = event


        for (_, view) in self.outBelowView.subviews.enumerated() {
            let subView = view
            if subView is HeyUploadModalView {
                subView.removeFromSuperview()
            }
        }
    
        self.makeUi()
        self.makeLayout()
        
        self.outBelowView.addSubview(self)
        self.show(animation:true)
    }
    
    
    private func makeUi() -> Void {
        self.outBelowView.addSubview(self)
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.contentView)
        self.contentView.addSubview(self.outShowView)
    }
    
    
    private func makeLayout() -> Void {
        self.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.outShowView.snp.makeConstraints { (make) in
            
            make.center.equalTo(contentView)
            make.width.equalTo(self.outShowViewSize.width)
            make.height.equalTo(self.outShowViewSize.height)
        }
    }
    
    private func show(animation: Bool) -> Void {
        if false {
            UIView.animate(withDuration: 3.0) {
                self.alpha = 1.0
            } completion: { finished in
                
            }
        } else{
            self.alpha = 1.0
        }
    }
    
    
    func hide(animation: Bool) -> Void {
        guard self.outShowView != nil else {
            return
        }
        
        guard self.outShowView != nil else {
            return
        }
        
        if false {
            UIView.animate(withDuration: 0.2) {
                self.outShowView.alpha = 0.0
            } completion: { finshed in
                self.removeFromSuperview()
            }
        }else{
            self.outShowView.alpha = 0.0
            self.removeFromSuperview()
        }
    }
    
}
