//
//  UIHelper.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 29.06.2022.
//

import UIKit

struct UIHelper{
    
    static func ft_Create3ColumnFlowLayout (in view: UIView) -> UICollectionViewFlowLayout {
        let width                             = view.bounds.width
        let padding : CGFloat                 = 12
        let minimumItemSpacing: CGFloat       = 10
        let availableWidth                    = width - ((padding * 2) - (minimumItemSpacing * 2))
        
        let itemWidth                         = (availableWidth / 4)
        print("itemWidth", itemWidth)
        print("view.bounds.width", view.bounds.width)
        
        let flowLayout                        = UICollectionViewFlowLayout()
        flowLayout.sectionInset               = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                   = CGSize(width: itemWidth, height: itemWidth + 40)
        print("flowLayout.itemSize  ",flowLayout.itemSize  )
        return flowLayout
        
    }
    
}
