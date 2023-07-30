//
//  Home.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/7/30.
//

import UIKit

import XLPagerTabStrip;

class HomeVC: ButtonBarPagerTabStripViewController {

    //MASK: 设置上方bar 按钮 条的UI
    override func viewDidLoad() {
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3;
        settings.style.buttonBarItemBackgroundColor = .clear;
        settings.style.buttonBarItemTitleColor = .label;
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 20)
        settings.style.buttonBarItemLeftRightMargin = 0
        
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID);
        let nearVC = storyboard!.instantiateViewController(withIdentifier: kNearVCID);
        let discoveryVC = storyboard!.instantiateViewController(withIdentifier: kDiscoveryVCID);
        return [followVC,nearVC,discoveryVC];
    }
    

}
