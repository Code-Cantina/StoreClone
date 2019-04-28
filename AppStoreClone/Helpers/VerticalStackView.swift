//
//  VerticalStackView.swift
//  AppStoreClone
//
//  Created by Danny Copeland on 3/30/19.
//  Copyright © 2019 Danny Copeland. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubViews: [UIView], spacing: CGFloat = 0){
        super.init(frame: .zero) //use but it will be ignored since we are using auto layout
        
        arrangedSubViews.forEach({addArrangedSubview($0)}) //$0 represents object int he loop
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
