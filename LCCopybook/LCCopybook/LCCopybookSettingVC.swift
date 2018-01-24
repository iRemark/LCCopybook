//
//  LCCopybookUserCenterVC.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/22.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit

private let reuseIdentifier = "LCCopybookUserCenterCell";

class LCCopybookSettingVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var basicArray: NSMutableArray = {
        () -> NSMutableArray in
        let temp: NSMutableArray = NSMutableArray.init();
        
        temp.add(["identifier":"showGrid",
                  "title":"显示网格",
                  "value":""]);
        
        temp.add(["identifier":"gridColor",
                  "title":"网格颜色",
                  "value":""]);
        
        temp.add(["identifier":"setContent",
                  "title":"定义文本",
                  "value":""]);
        return temp;
    }();

    lazy var fontArray: NSMutableArray = {
        () -> NSMutableArray in
        let temp: NSMutableArray = NSMutableArray.init();
        temp.add(["identifier":"autoFontSize",
                  "title":"自适应大小",
                  "value":""]);
        
        temp.add(["identifier":"customFontSize",
                  "title":"自定义大小",
                  "value":""]);
        
        temp.add(["identifier":"fontValue",
                  "title":"",
                  "value":""]);
        
        temp.add(["identifier":"font",
                  "title":"字体",
                  "value":""]);
        return temp;
    }();
    
    lazy var gridArray: NSMutableArray = {
        () -> NSMutableArray in
        let temp: NSMutableArray = NSMutableArray.init();
        temp.add(["identifier":"autoGridSize",
                  "title":"自适应大小",
                  "value":""]);
        
        temp.add(["identifier":"customGridSize",
                  "title":"自定义大小",
                  "value":""]);
        
        temp.add(["identifier":"girdValue",
                  "title":"",
                  "value":""]);
        
        return temp;
    }();
    
    lazy var tableView: UITableView = {
        () -> UITableView in
        let tempTable: UITableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.grouped);
        return tempTable;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.title = "设置";
        self.tabBarItem.title = "设置";
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.register(LCCopybookSettingCell.self, forCellReuseIdentifier: reuseIdentifier);
        self.view.addSubview(self.tableView);
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.basicArray.count;
            
        }else if section == 1 {
            return self.fontArray.count;
            
        }else {
            return self.gridArray.count;
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LCCopybookSettingCell;

        cell.textLabel?.text = "";
        if indexPath.section == 0 {
            let dict: NSDictionary = self.basicArray.object(at: indexPath.row) as! NSDictionary;
            cell.textLabel?.text = dict["title"] as? String;
            
        }else if indexPath.section == 1 {
            let dict: NSDictionary = self.fontArray.object(at: indexPath.row) as! NSDictionary;
            cell.textLabel?.text = dict["title"] as? String;
            
        }else {
            let dict: NSDictionary = self.gridArray.object(at: indexPath.row) as! NSDictionary;
            cell.textLabel?.text = dict["title"] as? String;
        }
        cell.configCell(data: (cell.textLabel?.text)!, indexPath: indexPath);
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "基本设置";
            
        }else if section == 1 {
            return "字体";
            
        }else {
            return "网格";
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                let tempVC: LCCopybookContentVC = LCCopybookContentVC();
                self.navigationController?.pushViewController(tempVC, animated: true);
            }
            
        }else if indexPath.section == 1 {
            //font
            let dict: NSDictionary = self.fontArray.object(at: indexPath.row) as! NSDictionary;
            if dict["identifier"] as? String == "font" {
                let fontVC = LCCopybookFontVC();
                self.navigationController?.pushViewController(fontVC, animated: true);
            }
            
        }else {
            
        }
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
