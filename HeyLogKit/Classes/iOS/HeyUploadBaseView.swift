

import UIKit
import SnapKit


//事件闭包
typealias HeyUPloadEventClosure = (Any?) -> Void

class HeyUploadBaseView: UIView {
    public var custormEvent: HeyUPloadEventClosure!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
}
