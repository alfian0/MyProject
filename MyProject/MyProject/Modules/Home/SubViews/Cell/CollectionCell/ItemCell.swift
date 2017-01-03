//
//  ItemCell.swift
//  MyProject
//
//  Created by alfian on 28/12/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var bucketsImage: UIImageView?
    @IBOutlet weak var overlayView: UIView?
    @IBOutlet weak var likeImage: UIImageView?
    
    override var selected: Bool {
        didSet {
            if self.selected {
                self.overlayView?.hidden = false
            } else {
                self.overlayView?.hidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 3
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0).CGColor
        
        self.likeImage?.image = R.image.favoriteFill?.imageWithRenderingMode(.AlwaysTemplate)
        self.likeImage?.tintColor = UIColor.lightGrayColor()
        self.likeImage?.contentMode = .ScaleAspectFit
    }

}
