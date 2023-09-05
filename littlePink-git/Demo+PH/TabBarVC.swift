//
//  TabBarVC.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/8/1.
//

import UIKit
import YPImagePicker
import AVKit
class TabBarVC: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        //MARK: -登录验证功能(待做)
        
        
        
        
        
           //决定到底是常规展示还是 自定义 比如我们这要弹出一个页面来展示
        var config = YPImagePickerConfiguration()
        
        
        
        config.onlySquareImagesFromCamera = false; //照片拍出来是不是正方形
        config.usesFrontCamera = true;
        config.shouldSaveNewPicturesToAlbum = true;
        config.albumName = "littlePink"
        config.startOnScreen = .library; //默认展示相册 而不是拍照页面
        config.screens = [.library,.photo,.video]
         
        config.overlayView = UIView() //捕捉到视频的时候,屏幕上方显示一些功能,就需要这个属性了
        config.hidesStatusBar = true;//隐藏上方状态栏,但是没用,苹果已经禁用这个api了

        
        
        //MARK: - 相册配置
        
        config.library.preSelectItemOnMultipleSelection = false;
        
//        config.library.options = nil
//        config.library.onlySquare = false
        config.library.isSquareByDefault = false;
//        config.library.minWidthForItem = nil   规定照片不能太长
        config.library.mediaType = YPlibraryMediaType.photoAndVideo //允许有照片和视频
        config.library.defaultMultipleSelection = true  //相册多选
        config.library.maxNumberOfItems = kMaxPhotoCount;
        config.library.minNumberOfItems = 1
        config.library.numberOfItemsInRow = 4
        config.library.spacingBetweenItems = 1.0
        config.library.skipSelectionsGallery = false //只能选择照片

        config.library.preSelectItemOnMultipleSelection = true
        
        config.gallery.hidesRemoveButton = false  //
        
        //MARK: - 视频配置
        
        config.video.compression = AVAssetExportPresetHighestQuality  //视频压缩质量
        config.video.fileType = .mov  // 视频压缩格式
        config.video.recordingTimeLimit = 60.0  //视频最大多长时间
        config.video.libraryTimeLimit = 60.0 // 相册最多多长时间
        config.video.minimumTimeLimit = 3.0   //最少视频时间
        config.video.trimmerMaxDuration = 60.0 //最大剪辑视频时间
        config.video.trimmerMinDuration = 3.0 //最小剪辑视频时间
        
        
//        config.filters = [DefaultYPFilters...]
        config.maxCameraZoomFactor = 5.0
//        config.fonts..
        
        // [Edit configuration here ...]
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
        
        
        
        
        if viewController is PostVC{
            print("到post了")
            
            
            
            picker.didFinishPicking { [unowned picker] items, cancelled in
                for item in items {
                    switch item {
                    case .photo(let photo):
                        print(photo)
                    case .video(let video):
                        print(video)
                    }
                }
                picker.dismiss(animated: true, completion: nil)
            }
            
            
            
            present(picker, animated: true, completion: nil)
            
            
            
            
            return false;
        }
           return  true
        
        
        
        
        
    }

    
    
}
