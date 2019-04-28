//
//  AppsHeaderCell.swift
//  AppStoreClone
//
//  Created by Danny Copeland on 4/16/19.
//  Copyright © 2019 Danny Copeland. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Header Cell Title", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Header cell description will be replaced by this", font: .systemFont(ofSize: 24))
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .blue
        imageView.backgroundColor = .red
        titleLabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubViews: [
            companyLabel, titleLabel, imageView
            ], spacing: 12)
        
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
