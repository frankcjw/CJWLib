//
//  YGAppearance.swift
//  YuanGuangProject
//
//  Created by Frank on 6/26/15.
//  Copyright (c) 2015 YG. All rights reserved.
//

import UIKit

public class CJWAppearance: NSObject {
	public class func setup() {

//        var mainColor = MAIN_COLOR

//        var navi = UINavigationBar.appearance()
//        navi.barTintColor = mainColor
//        navi.tintColor = UIColor.whiteColor()
//
//
//        var att = NSDictionary(objectsAndKeys: UIColor.whiteColor(),NSForegroundColorAttributeName)
//        navi.titleTextAttributes = att as [NSObject : AnyObject]
//
//
//        var tab = UITabBar.appearance()
//        tab.tintColor = UIColor.whiteColor()
//        tab.barTintColor = mainColor
//
//        UINavigationBar.appearance().barStyle = UIBarStyle.Black

		/*
		 [[UIBarButtonItem appearance]
		 setBackButtonBackgroundImage:[UIImage imageNamed:@"back_button.png"]
		 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
		 */
		UIBarButtonItem.appearance().setBackButtonBackgroundImage(UIImage(named: "Practicetopic_icon_back"), forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
	}
}
