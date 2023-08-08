//
//  Extensions.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/8/8.
//

import Foundation
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip

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








