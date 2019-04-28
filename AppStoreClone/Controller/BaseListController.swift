//
//  BaseListController.swift
//  AppStoreClone
//
//  Created by Danny Copeland on 4/13/19.
//  Copyright © 2019 Danny Copeland. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout()) //allows no use of parameters for the collection view controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
