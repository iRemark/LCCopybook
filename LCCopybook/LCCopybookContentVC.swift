//
//  LCCopybookContentVC.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/22.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit

class LCCopybookContentVC: UIViewController {

    lazy var contentTextView: UITextView = {
        () -> UITextView in
        let tempTextView = UITextView();
        return tempTextView;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        self.title = "定义文本";
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "保存", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.saveAction));
        
        self.contentTextView.backgroundColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1);
        self.view.addSubview(self.contentTextView);
        
        self.contentTextView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(10,10,100,10));
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func saveAction() {
        LCCopybookControl.sharedInstance.controlDict.setValue(self.contentTextView.text, forKey: "content");
        LCCopybookControl.sharedInstance.saveData();
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
