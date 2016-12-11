//
//  RightMenuCell.swift
//  MyProject
//
//  Created by alfian on 30/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import EventKit

class RightMenuCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clickMeButton: UIButton!
    
    var presenter: IHomePresenter!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.font = R.font.roundedEleganceNewRegular(size: 14)
        self.titleLabel.text = "Configure the view for the selected state"
        
        let buttonTitle = Localization.instance.getLocalizationBy("en", key: "buttonTitle")
        self.clickMeButton.setTitle(buttonTitle, forState: .Normal)
        self.clickMeButton.addTarget(self, action: #selector(self.setClickMeAction(_:)), forControlEvents: .TouchUpInside)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func setClickMeAction(sender: UIButton) {
        
    }
}
