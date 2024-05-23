//
//  TestCollectionViewCell.swift
//  
//
//  Created by admin on 23/05/24.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    public let imageview = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    func commonInit(){
        imageview.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageview)
        let data = ["image":imageview]
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[image]-0-|", options: [], metrics: nil, views: data))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[image]-0-|", options: [], metrics: nil, views: data))
    }
}
