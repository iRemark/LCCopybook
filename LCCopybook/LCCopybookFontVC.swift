//
//  LCCopybookFontVC.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/22.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//


import UIKit


typealias callBackType = (_ fontName:String) -> Void

class LCCopybookFontVC: UIViewController {

    var callBack:callBackType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "字体";
        self.view.backgroundColor = UIColor.white;
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下载", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.configLoad));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @objc func configLoad() -> () {
        let appearance = LCAlertView.LCAppearance(showCloseButton: true)
        let alert = LCAlertView(appearance: appearance);
        
        let textField = alert.addTextField("请输入要下载的字体");
        _ = alert.addButton("开始下载") {
            self.loadFont(fontName: (textField.text) as! String);
        }
        _ = alert.showEdit("参考Mac 系统软件 字体册", subTitle:"输入 PostScript 名称");
    }

    
    func loadFont(fontName: String) -> () {
        
        let manager = LCFontManager();
        
        let appearance = LCAlertView.LCAppearance(showCloseButton:false);
        let alert = LCAlertView.init(appearance: appearance).showWait("DownLoad", subTitle: "loadding...", closeButtonTitle: nil, timeout: nil, colorStyle: nil, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: LCAnimationStyle.topToBottom);
        
        manager.asynchronouslySetFontName(fontName, fontSize: 30.0, completion: {
            (iResCode, font, progressValue, error) -> Void in
            
            if iResCode == LCFontManager_beginLoad ||
                iResCode == LCFontManager_loadding {
                if iResCode == LCFontManager_beginLoad {
                    
                }
                let progressString = String(format: "%.2f", progressValue)
                alert.setTitle(progressString)
                
            }else if iResCode == LCFontManager_loadCompletion ||
                     iResCode == LCFontManager_loaded {
                LCCopybookControl.sharedInstance.controlDict.setValue(fontName, forKey: "fontName");
                if (self.callBack != nil) {
                    self.callBack!(fontName);
                }
                LCCopybookControl.sharedInstance.saveData();
                alert.close();
                
            }else {
                alert.close();
            }
        });
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
