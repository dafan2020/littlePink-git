//
//  NoteEditVCViewController.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/8/28.
//

import UIKit
import YPImagePicker;
//import MBProgressHUD; //oc文件
import SKPhotoBrowser;
import AVKit


class NoteEditVC: UIViewController {

    @IBOutlet weak var textView: UIStackView!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    var photos = [UIImage(named: "1")!,UIImage(named: "2")! ]
    var videoURL : URL = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!;
    var dragingIndexPath = IndexPath(item: 0, section: 0)
    
    
    var photoCount: Int{photos.count}//计算属性特性  第一次执行会执行  但如果值没有发生改变,那么之后就不会执行而是把值直接拿出来用
    var isVideo: Bool { videoURL != nil}
    
    
    
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.dragInteractionEnabled = true;//开启拖放交互
        titleCountLabel.isHidden = true;
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
BP
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func TFdidBegin(_ sender: Any) {
        titleCountLabel.isHidden = false;
    }
    
    
    @IBAction func TFEditEnd(_ sender: UITextField) {
        titleCountLabel.isHidden = true;
    }
    
    
}





















