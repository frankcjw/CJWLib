//
//  YGBaseTableViewCell.swift
//  YuanGuangProject
//
//  Created by Frank on 6/26/15.
//  Copyright (c) 2015 YG. All rights reserved.
//

import UIKit

public class CJWBaseTableViewCell: UITableViewCell {
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    public func setInfo(info:NSDictionary){
    }
    
    /**
    是否应该重绘cell里面的内容,如果View的subview<2的时候,对于空view来说可以新绘制内容
    
    - returns: true,可以新绘制内容,否则可能会出现重影
    */
    public func shouldDrawItems() -> Bool{
        let count = self.subviews.count
        if count <= 2{
            return true
        }else{
            return false
        }
    }
}

extension UITableViewCell {
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
}

public class YGTableViewMarginFixedCell : UITableViewCell {
    override public func layoutSubviews() {
        super.layoutSubviews()
        fixMargins()
    }
    
    private func fixMargins(){
        separatorInset = UIEdgeInsetsZero
        layoutMargins = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false;
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        fixMargins()
    }
}