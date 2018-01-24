//
//  LCCopybookCollectionCell.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/19.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit
import SnapKit

class LCCopybookCollectionCell: UICollectionViewCell {
    lazy var contentLabel: UILabel = {
        () -> UILabel in
        let tempLabel = UILabel.init();
        tempLabel.textAlignment = NSTextAlignment.center;
        return tempLabel;
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //do something what you want
        
        self.contentView.addSubview(self.contentLabel);
        self.contentView.layer.borderColor = UIColor.gray.cgColor;
        self.contentLabel.layer.borderWidth = 1;
        
        self.contentLabel.snp.makeConstraints {
            (make) ->Void in
            make.edges.equalTo(self.contentView);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}
