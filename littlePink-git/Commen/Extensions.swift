//
//  Extensions.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/8/8.
//

import Foundation
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip

extension UIView{
    @IBInspectable
    var Radius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue;
        }
    }
}



extension waterFallVC: CHTCollectionViewDelegateWaterfallLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        UIImage(named: "\(indexPath.item + 1)")!.size
    }
    
    
}

extension waterFallVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        IndicatorInfo(title: channel); //上面用循环给每一个分类做了名字的赋值,这里呢让一个属性变到视图里去
    }
    
    
}

extension UIViewController{
    
    //MARK: - 展示加载框和提示框
    
    //MARK: -加载框
    
    
    //MARK: -提示框
    func showTextHUD(_ title: String,_ subTitle: String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title;
        hud.hide(animated: true, afterDelay: 2)
    }
}






