//
//  LCCopybookSettingCell.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/22.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit

class LCCopybookSettingCell: UITableViewCell {

    lazy var switchView: UISwitch = {
        () -> UISwitch in
        let tempSwitch = UISwitch.init();
        return tempSwitch;
    }();
    
    lazy var sliderView: UISlider = {
        () -> UISlider in
        let tempSlider = UISlider.init();
        return tempSlider;
    }();
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //do something what you want
        
        self.contentView.addSubview(self.switchView);
        self.contentView.addSubview(self.sliderView);
        
        self.switchView.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
            make.width.equalTo(80);
        }
        self.sliderView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(self.contentView);
        }
        
        self.switchView.addTarget(self, action: #selector(switchViewAction(sender:)), for: UIControlEvents.valueChanged);
        
        self.sliderView.addTarget(self, action: #selector(sliderViewAction(sender:)), for: UIControlEvents.valueChanged);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(data:String, indexPath: IndexPath) -> () {
        self.switchView.isHidden = true;
        self.sliderView.isHidden = true;
        self.textLabel?.isHidden = false;
        
        if self.textLabel?.text == "显示网格" {
            self.switchView.isHidden = false;
            self.sliderView.isHidden = false;
            self.textLabel?.isHidden = true;
            
        }else if self.textLabel?.text == "网格颜色" {
            
        }else if self.textLabel?.text == "自适应大小" {
            if indexPath.section == 1 {
                
            }else {
                
            }
        }else if self.textLabel?.text == "自定义大小" {
            if indexPath.section == 1 {
                
            }else {
                
            }
        }else if self.textLabel?.text == "字体" {
            
        }
    }
    
    @objc func switchViewAction(sender: UISwitch) -> () {
        
    }
    @objc func sliderViewAction(sender: UISlider) -> () {
        
    }
}




