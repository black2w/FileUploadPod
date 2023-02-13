import HandyJSON

public class HeyUploadRequestModel: HandyJSON {
    var filePath: String?
    var name: String?

    required public init() {
        
    }
}

public class HeyUploadResonseModel: HandyJSON {
    var code: Int?
    var reason: String?
    var comment: String?
    
    public func isSucessFull() -> Bool {
        if self.code == 0 {
            return true
        } else {
            return false
        }
    }
    
    required public init() {
        
    }
}
