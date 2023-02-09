//
//  UIImage+Extension.swift
//  newHeyShare
//
//  Created by black2w on 2021/9/9.
//

import Foundation

extension UIImageView {
    //MARK:工程内gif
    public func ht_startGifWithImageName(name:String){
        let myBundle = Bundle(for: HeyUploadWaitingView.self)
        let path = myBundle.path(forResource: "HeyLogKit", ofType: "bundle")!
        let assetsBundle = Bundle.init(path: path)
        guard let asBundle = assetsBundle else {
            print("HeyUploadKit: assetsBundle for the image does not exist")
            return
        }
        
        guard let imgPath = asBundle.path(forResource: name, ofType: "gif") else {
            print("HeyUploadKit: Source for the image does not exist")
            return
        }
        self.ht_startGifWithFilePath(filePath: imgPath)
    }
    //MARK:实现动图效果
    public func ht_startGifWithFilePath(filePath:String) {
        //1.加载GIF图片，并转化为data类型
        guard let data = NSData(contentsOfFile: filePath) else {return}
        //2.从data中读取数据，转换为CGImageSource
        guard let imageSource = CGImageSourceCreateWithData(data, nil) else {return}
        let imageCount = CGImageSourceGetCount(imageSource)
        //3.遍历所有图片
        var images = [UIImage]()
        var totalDuration : TimeInterval = 0
        for i in 0..<imageCount {
            //3.1取出图片
            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else {continue}
            let image = UIImage(cgImage: cgImage)
            images.append(image)
            
            //3.2取出持续时间
            guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? NSDictionary  else {continue}
            guard let gifDict = properties[kCGImagePropertyGIFDictionary]  as? NSDictionary else  {continue}
            guard let frameDuration = gifDict[kCGImagePropertyGIFDelayTime] as? NSNumber else {continue}
            totalDuration += frameDuration.doubleValue
            
        }
        
        //4.设置imageview的属性
        self.animationImages = images
        self.animationDuration = totalDuration
        self.animationRepeatCount = 0
        
        //5.开始播放
        self.startAnimating()
        
    }
    
    public func ht_imageStopAnimating() {
        self.stopAnimating()
    }
}
