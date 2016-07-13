//
//  YGUtils.swift
//  YuanGuangProject
//
//  Created by Frank on 6/26/15.
//  Copyright (c) 2015 YG. All rights reserved.
//

import UIKit

let UIControlEventsTouchUpInside = UIControlEvents.TouchUpInside
let UIControlStateNormal = UIControlState.Normal
let UIControlStateSelected = UIControlState.Selected
let UIControlStateHighlighted = UIControlState.Highlighted

let IS_SIMULATOR = CJWUtils.isSimnulator() ? true : false


// MARK: - KEY
let KEY_CourseCategorySelection = "CourseCategorySelection"
let KEY_CourseCategory = "CourseCategory"
let KEY_CourseCategorySelectionId = "CourseCategorySelectionId"
let KEY_QuestionInfo = "QuestionInfo"
let KEY_Questions = "Questions"
let KEY_BeginId = "BeginId"

class CJWUtils: NSObject {
    
    var cacheObject : AnyObject?
    
    class var sharedInstance : CJWUtils {
    struct Static {
    static var onceToken : dispatch_once_t = 0
    static var instance : CJWUtils? = nil
    }
    dispatch_once(&Static.onceToken) {
    Static.instance = CJWUtils()
    }
    return Static.instance!
    }
}

extension CJWUtils {
//    class func getSystemCacheSize() -> String {
//        let units = ["B","K","M","G"]
//        var size = SDImageCache.sharedImageCache().getSize()
//        var calc = NSNumber(unsignedLong: size).integerValue
//        var value = ""
//        var unitIndex = 0
//        for index in 0...units.count - 1 {
//            if calc > 1024 * 2 {
//                calc = calc / 1024
//                unitIndex++
//            }else{
//                break
//            }
//        }
//        value = "\(calc)\(units[unitIndex])"
//        println("缓存大小:\(value) \(size)")
//        return value
//    }
//    
//    class func clearSystemCache(block:()->()){
//        let tmpView = UIApplication.sharedApplication().keyWindow?.rootViewController?.view
//        tmpView?.showHUDwith("正在清理缓存")
//        YGExcuteDelay.excute(2, block: { () -> () in
//            SDImageCache.sharedImageCache().clearDiskOnCompletion { () -> Void in
//                tmpView!.showTemporary("清除成功")
//                block()
//            }
//        })
//    }
}

let DATE_FORMAT = "HH:mm"

/// Array<NSDictionary>
typealias NSInfoArray = Array<NSDictionary>

extension String {
    
    private var MAX_HEIGHT:CGFloat {
        return 9999
    }
    
    private var MAX_WIDTH : CGFloat {
        return SCREEN_WIDTH
    }
    
    func calculateSizeHeight(font:UIFont,width:CGFloat) -> CGFloat{
        return calculateSize(font, width: width).height
    }
    
    func calculateWidth(font:UIFont,height:CGFloat) -> CGFloat{
        var size = CGSizeMake(MAX_WIDTH, height)
        let dict = [NSFontAttributeName:font]
        size = self.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: dict, context: nil).size
        return size.width
    }
    
    func calculateSize(font:UIFont,width:CGFloat) -> CGSize{
        var size = CGSizeMake(width, MAX_HEIGHT)
        let dict = [NSFontAttributeName:font]
        size = self.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: dict, context: nil).size
        return size
    }
    
    func length()->Int{
        return self.characters.count
    }
}

extension Double {
    func convertToDateString() -> NSString{
        let time = self / 1000 - NSTimeIntervalSince1970
        let date = NSDate(timeIntervalSinceReferenceDate: time)
        let fmt = NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let realDate = fmt.stringFromDate(date)
        return realDate
    }
    
    func convertToDateString(formatt:String) -> String{
        let time = self / 1000 - NSTimeIntervalSince1970
        let date = NSDate(timeIntervalSinceReferenceDate: time)
        let fmt = NSDateFormatter()
        fmt.dateFormat = formatt as String
        let realDate = fmt.stringFromDate(date)
        return realDate
    }
}

extension NSDate {
    func convertToDateString() -> NSString{
        let date = self
        let fmt = NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let realDate = fmt.stringFromDate(date)
        return realDate
    }
}

class YGExcuteDelay : NSObject {
    typealias DelayBlock = () -> ()
    
    class func excute(timeDelay:NSTimeInterval,block:DelayBlock){
        let ttt:Int64 = Int64(timeDelay)
        let time = dispatch_time(DISPATCH_TIME_NOW, ttt * (Int64)(1 * NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            block()
        }
    }
}

extension Int {
    func character() -> String{
        let character = Character(UnicodeScalar(65 + self))
        return "\(character)"
    }
}

extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(abs(self))))
    }
    func indexRandom() -> [Int] {
        var newIndex = 0
        var shuffledIndex:[Int] = []
        while shuffledIndex.count < self {
            newIndex = Int(arc4random_uniform(UInt32(self)))
            if !(shuffledIndex.indexOf(newIndex) > -1 ) {
                shuffledIndex.append(newIndex)
            }
        }
        return  shuffledIndex
    }
}

extension Array {
    func shuffle() -> [Element] {
        var shuffledContent:[Element] = []
        let shuffledIndex:[Int] = self.count.indexRandom()
        for i in 0...shuffledIndex.count-1 {
            shuffledContent.append(self[shuffledIndex[i]])
        }
        return shuffledContent
    }
    mutating func shuffled() {
        var shuffledContent:[Element] = []
        let shuffledIndex:[Int] = self.count.indexRandom()
        for i in 0...shuffledIndex.count-1 {
            shuffledContent.append(self[shuffledIndex[i]])
        }
        self = shuffledContent
    }
    func chooseOne() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
    func choose(x:Int) -> [Element] {
        var shuffledContent:[Element] = []
        let shuffledIndex:[Int] = x.indexRandom()
        for i in 0...shuffledIndex.count-1 {
            shuffledContent.append(self[shuffledIndex[i]])
        }
        return shuffledContent
    }
}

extension CJWUtils{
    class func passwordValidator(password:String) -> Bool{
        var letterCounter = 0
        var digitCount = 0
        let phrase = password
        for scalar in phrase.unicodeScalars {
            let value = scalar.value
            if (value >= 65 && value <= 90) || (value >= 97 && value <= 122) {
                letterCounter++
            }
            if (value >= 48 && value <= 57) {
                digitCount++
            }
        }
        if digitCount > 0 && letterCounter > 0 && password.length() > 7 {
            return true
        }else{
            return false
        }
    }
}


extension CJWUtils {
    class func isSimnulator() -> Bool {
        let model = UIDevice.currentDevice().model
        if model == "iPhone Simulator" {
            return true
        }else{
            return false
        }
    }
}

