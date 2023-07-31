//
//  DiscoveryVC.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/7/30.
//

import UIKit
import XLPagerTabStrip;
class DiscoveryVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider {  //button bar 这个类是第三方包做什上面tap栏用的
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        IndicatorInfo(title: "发现")
    }
    

    override func viewDidLoad() {
        
        settings.style.selectedBarHeight = 0
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)

        super.viewDidLoad()
        
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = [];
        for channel in kChannels {
            let vc = storyboard?.instantiateViewController(identifier: kWaterFallVCID) as! waterFallVC;
            vc.channel = channel;
            vcs.append(vc)
        }
        return vcs;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
