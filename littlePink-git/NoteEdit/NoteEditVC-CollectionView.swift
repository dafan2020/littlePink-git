//
//  NoteEditVC-CollectionView.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/9/5.
//

import Foundation
import YPImagePicker;
//import MBProgressHUD; //oc文件
import SKPhotoBrowser;
import AVKit


extension NoteEditVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isVideo{
            let playerVC = AVPlayerViewController();
            playerVC.player = AVPlayer(url: videoURL);
            present(playerVC,animated: true);
            playerVC.player?.play();
        }else{
            
            var images : [SKPhoto] = [];
            for photo in photos {
                images.append(SKPhoto.photoWithImage(photo));
            }
            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
            browser.delegate = self;
            SKPhotoBrowserOptions.displayAction = false;
            SKPhotoBrowserOptions.displayDeleteButton = true;
            present(browser, animated: true)
        }
    }
}

extension NoteEditVC: SKPhotoBrowserDelegate{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData();
        reload();
    }
}





//MARK: - 监听
extension NoteEditVC{
    @objc  func addPhoto(sender: UIButton){ //只要button触发了那个事件,我们就执行这里面的代码
        if photoCount < kMaxPhotoCount{
            var config = YPImagePickerConfiguration()
            
            
            
            config.onlySquareImagesFromCamera = false; //照片拍出来是不是正方形
            config.usesFrontCamera = true;
            config.shouldSaveNewPicturesToAlbum = true;
            config.albumName = "littlePink"
            config.startOnScreen = .library; //默认展示相册 而不是拍照页面
            config.screens = [.library]
             
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
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount;
            config.library.minNumberOfItems = 1
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 1.0
            config.library.skipSelectionsGallery = false //只能选择照片

            config.library.preSelectItemOnMultipleSelection = true
            
            config.gallery.hidesRemoveButton = false  //
            
            //MARK: - 视频配置
            
            
    //        config.filters = [DefaultYPFilters...]
            config.maxCameraZoomFactor = 5.0
    //        config.fonts..
            
            // [Edit configuration here ...]
            // Build a picker with your configuration
            let picker = YPImagePicker(configuration: config)
            
            
            picker.didFinishPicking { [unowned picker] items, _ in

                for item in items {
                    if case let .photo(photo) = item{
                        self.photos.append(photo.image);
                    }
                }
                self.photoCollectionView.reloadData();
                picker.dismiss(animated: true, completion: nil)
            }
            
            
            
            
            present(picker,animated: true)
            
        }else{
            showTextHUD("最多只能选择\(kMaxPhotoCount)张照片哦")
            
        }
            
        
    }
}

extension NoteEditVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        cell.imageView.image = photos[indexPath.item]
        

        return cell;
    }//配置cell的方法
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter;
            
            photoFooter.addPhotoButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            
            
            
            
            return photoFooter;
        default:
//            fatalError("collectionView的footer出问题了")
            return UICollectionReusableView();//返回了一个空的可重用的footer 不让他闪退了,这明显更好嘛
        }
        
    }//配置header footer的方法
    
    
    
}
