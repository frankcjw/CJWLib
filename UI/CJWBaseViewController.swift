//
//  YGBaseViewController.swift
//  YuanGuangProject
//
//  Created by Frank on 6/26/15.
//  Copyright (c) 2015 YG. All rights reserved.
//

import UIKit

class CJWBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackTitle("")
    }
    
}



extension UIViewController {
    
    func pushViewController(viewController: UIViewController){
        if self.navigationController != nil {
            viewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func popViewController(){
        if self.navigationController != nil {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func setBackTitle(title:String){
        let back = UIBarButtonItem()
        back.title = title
        self.navigationItem.backBarButtonItem = back
    }
    
    func setBackAction(action:Selector){
        let back = UIBarButtonItem()
//        back.title = title
        back.action = action
        self.navigationItem.backBarButtonItem = back
    }
    
}
