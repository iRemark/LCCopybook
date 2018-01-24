//
//  LCCopybookControl.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/22.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit

class LCCopybookControl {
    //MARK: 单例保存的一些配置
    /**
     fontName:字体名字
     fontSize:字体大小
     
     */
    lazy var controlDict: NSMutableDictionary = {
        () -> NSMutableDictionary in
        let tempDict = NSMutableDictionary.init();
        return tempDict;
    }();
    
    static let sharedInstance = LCCopybookControl.init();
    
    private init() {}
    
    
    
    //MARK: 保存数据
    func saveData() -> () {
        if self.controlDict.count > 0 {
            let userDefault = UserDefaults.standard;
            userDefault.setValue(self.controlDict, forKey: "LCCopybookControl_controlDict");
            userDefault.synchronize();
        }
    }
    
    //MARK: 获取数据
    func configData() -> () {
        let userDefault = UserDefaults.standard;
        
        if let dict = userDefault.object(forKey: "LCCopybookControl_controlDict")  {
            self.controlDict.setDictionary(dict as! [AnyHashable : Any]);
        }
    }
}


