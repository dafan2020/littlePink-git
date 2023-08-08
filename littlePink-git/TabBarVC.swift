//
//  TabBarVC.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/8/1.
//

import UIKit
import YPImagePicker

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
           //决定到底是常规展示还是 自定义 比如我们这要弹出一个页面来展示
        var config = YPImagePickerConfiguration()
        config.onlySquareImagesFromCamera = false; //照片拍出来是不是正方形
        config.usesFrontCamera = true;
        config.shouldSaveNewPicturesToAlbum = true;
        config.albumName = "littlePink"
        
        Bundle.main.infoDictionary
        Bundle.main.localizedInfoDictionary
        
        
        // [Edit configuration here ...]
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
        
        
        
        
        if viewController is PostVC{
            print("到post了")
            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
                    print(photo.originalImage) // original image selected by the user, unfiltered
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            
            
            
            return false;
        }
           return  true
        
        
        
        
        
    }

    
    
}
