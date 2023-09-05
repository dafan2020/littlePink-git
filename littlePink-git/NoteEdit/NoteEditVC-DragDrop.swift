//
//  NoteEditVC-DragDrop.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/9/5.
//

import Foundation

extension NoteEditVC: UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let photo = photos[indexPath.item];
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: photos[indexPath.item]))
        dragItem.localObject = photo
        return   [dragItem]//提供被拖拽的数据  单个cell被拖拽实现的方法
    }
    //一次拖动多个,还需要实现itemsForAddingTo方法
    
    
}

extension NoteEditVC: UICollectionViewDropDelegate{
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    //    dragingIndexPath.section == destinationIndexPath?.section;  //同一个section
        if collectionView.hasActiveDrag{//有效拖拽,比如没有拖到屏幕外面去
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) { //用户离开屏幕之后进行一些增删改查的处理
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first ,
           let sourceIndexPath = coordinator.items.first?.sourceIndexPath,
           let destinationIndexPath = coordinator.destinationIndexPath{
            

            
            collectionView.performBatchUpdates {
                photos.remove(at: sourceIndexPath.item);
                photos.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
            }
            
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
           
        }
    }
    
    
}
