//
//  HeyDownloadView.swift
//  newHeyShare
//
//  Created by black2w on 2021/7/20.
//

import UIKit

class HeyUploadWaitingView: HeyUploadBaseView {
    
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var perLab: UILabel!
    @IBOutlet weak var horSepView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var percent: Float! {
        didSet {
            DispatchQueue.main.async {
                self.perLab.text = "\(String(format: "%.2f", self.percent))"
            }
        }
    }
    
    var finished: Bool! {
        didSet {
            
        }
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configView()
    }

    
    func configView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 12.0
        self.backgroundColor = UIColor.white
        self.perLab.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
        self.perLab.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        self.horSepView.backgroundColor = UIColor(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1.0)
        self.cancelBtn.setTitleColor(UIColor(red: 47/255.0, green: 84/255.0, blue: 235/255.0, alpha: 1.0), for: UIControl.State.normal)
        self.cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        self.startAnimation()
        
        self.cancelBtn.setTitle("取消", for: .normal)
    }
    
    func startAnimation() -> Void {
        self.animationImageView.ht_startGifWithImageName(name: "downloading_cirle")
        return
    }
    
    @IBAction func onBtnClicked(btn: UIButton) -> Void {
        if (self.custormEvent != nil) {
            if btn == self.cancelBtn {
                self.custormEvent(UPloadUISelectResult.UPloadUISelectResult_Abort)
            }
        }
    }

}
