//
//  HeaderView.swift
//  MyProject
//
//  Created by alfian on 29/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    @IBOutlet weak var headerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerImage.image = R.image.header
    }
}