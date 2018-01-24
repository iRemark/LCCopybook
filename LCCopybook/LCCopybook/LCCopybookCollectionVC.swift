//
//  LCCopybookVC.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/19.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit
import SnapKit





private let reuseIdentifier = "Cell"

class LCCopybookCollectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var dataSourceString = "永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右，引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。是日也，天朗气清，惠风和畅。仰观宇宙之大，俯察品类之盛，所以游目骋怀，足以极视听之娱，信可乐也。夫人之相与，俯仰一世。或取诸怀抱，悟言一室之内；或因寄所托，放浪形骸之外。虽趣舍万殊，静躁不同，当其欣于所遇，暂得于己，快然自足，不知老之将至；及其所之既倦，情随事迁，感慨系之矣。向之所欣，俯仰之间，已为陈迹，犹不能不以之兴怀，况修短随化，终期于尽！古人云：“死生亦大矣。”岂不痛哉！每览昔人兴感之由，若合一契，未尝不临文嗟悼，不能喻之于怀。固知一死生为虚诞，齐彭殇为妄作。后之视今，亦犹今之视昔，悲夫！故列叙时人，录其所述，虽世殊事异，所以兴怀，其致一也。后之览者，亦将有感于斯文。";
    
    lazy var defaultLayout: UICollectionViewFlowLayout = {
        () -> UICollectionViewFlowLayout in
        let width = (self.view.frame.size.width - 20)/6.0;
        let tempLayout = UICollectionViewFlowLayout.init();
        tempLayout.itemSize = CGSize.init(width: width, height: width);
        
        tempLayout.minimumLineSpacing = 0;
        tempLayout.minimumInteritemSpacing = 0;
        
        return tempLayout;
    }();
    
    lazy var collectionView: UICollectionView = {
        () -> UICollectionView in
        let tempCollection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: self.defaultLayout);
        tempCollection.register(LCCopybookCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier);
        
        tempCollection.backgroundColor = UIColor.white;
        tempCollection.delegate = self;
        tempCollection.dataSource = self;
        
        return tempCollection;
    }();
    
    lazy var fontManager: LCFontManager = {
        () -> LCFontManager in
        let temp = LCFontManager();
        return temp;
    }();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.configSetting));
        
        
        self.view.addSubview(self.collectionView);
        
        self.collectionView.snp.makeConstraints {
            (make) -> Void in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10));
        }
        
        self.loadData();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.loadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func configSetting() -> () {
        let settingVC = LCCopybookSettingVC();
        self.navigationController?.pushViewController(settingVC, animated: true);
    }
    
    func loadData() -> () {
        LCCopybookControl.sharedInstance.configData();
        
        if let content = LCCopybookControl.sharedInstance.controlDict.value(forKey: "content") {
            self.dataSourceString = content as! String;
        }
        
        if let fontName = LCCopybookControl.sharedInstance.controlDict.value(forKey: "fontName") {
            LCFontManager().asynchronouslySetFontName(fontName as! String, fontSize: 40, completion: { (iResCode, font, progress, error) in
                if iResCode == LCFontManager_loaded {
                    self.collectionView.reloadData();
                }
            });
        }
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.dataSourceString.count;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LCCopybookCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LCCopybookCollectionCell;
    
        
        // Configure the cell
        let index = dataSourceString.index(dataSourceString.startIndex, offsetBy: indexPath.row);
        cell.contentLabel.text = String.init(dataSourceString[index]);
        
     
        if let fontName = LCCopybookControl.sharedInstance.controlDict.value(forKey: "fontName") {
             cell.contentLabel.font = UIFont.init(name: fontName as! String, size: 40);
            
        }else {
            cell.contentLabel.font = self.fontManager.cofigFont(withFontPath: "defaultFont", fontSize: 40);
        }
        
        return cell
    }
}
