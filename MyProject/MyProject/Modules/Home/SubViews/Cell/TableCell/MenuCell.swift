//
//  MenuCell.swift
//  MyProject
//
//  Created by alfian on 28/12/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let spritedImage = R.image.calendar_sprite
        let spritedRect = CGRectMake(0, 42*4, 42, 42)
        let image = CGImageCreateWithImageInRect(spritedImage?.CGImage, spritedRect)
        guard let thisImage = image else { return }
        let newImage = UIImage(CGImage: thisImage)
        
        self.iconImage.image = newImage
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
