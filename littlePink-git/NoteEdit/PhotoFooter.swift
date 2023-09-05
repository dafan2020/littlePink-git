//
//  PhotoFooter.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/8/30.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoButton: UIButton!
    
    //初始化赋值,但是没有viewcontroller的viewdidload()  但可以用其他方法
    
    override func awakeFromNib() {
        super.awakeFromNib();
        addPhotoButton.layer.borderWidth  = 1;
        addPhotoButton.layer.borderColor = UIColor.systemGray5.cgColor;
    }
}
