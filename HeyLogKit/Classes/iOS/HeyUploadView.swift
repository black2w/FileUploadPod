//
//  HeyUploadView.swift
//  newHeyShare
//
//  Created by black2w on 2021/7/20.
//

import UIKit

class HeyUploadView: HeyUploadBaseView {
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var msgLab: UILabel!
    @IBOutlet weak var horSepView: UIView!
    @IBOutlet weak var verSepView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var uploadBtn: UIButton!
    


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
        self.titleLab.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
        self.titleLab.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.msgLab.textColor = UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        self.msgLab.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        self.horSepView.backgroundColor = UIColor(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1.0)
        self.verSepView.backgroundColor = UIColor(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1.0)

        self.cancelBtn.setTitleColor(UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0), for: UIControl.State.normal)
        self.cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.uploadBtn.setTitleColor(UIColor(red: 47/255.0, green: 84/255.0, blue: 235/255.0, alpha: 1.0), for: UIControl.State.normal)
        self.uploadBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        self.titleLab.text = "温馨提示"
        self.msgLab.text = "你当前处于非WIFI环境下，继续上传将会产生手机流量，确定继续？"
        self.cancelBtn.setTitle("取消", for: .normal)
        self.uploadBtn.setTitle("继续上传", for: .normal)
        
    }
    
    @IBAction func onBtnClicked(btn: UIButton) -> Void {
        if (self.custormEvent != nil) {
            if btn == self.cancelBtn {
                self.custormEvent(UPloadUISelectResult.UPloadUISelectResult_Cancel)
            } else if btn == self.uploadBtn {
                self.custormEvent(UPloadUISelectResult.UPloadUISelectResult_Upload)
            }
        }
    }

}
