//
//  RightView.swift
//  MyProject
//
//  Created by alfian on 27/12/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class RightView: UIViewController {
    var presenter: IHomePresenter!
    
    @IBOutlet weak var logoImage: UIImageView?
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var profileImage: UIImageView?
    @IBOutlet weak var hireUsButton: UIButton?
    @IBOutlet weak var followingButton: UIButton?
    @IBOutlet weak var settingButton: UIButton?
    @IBOutlet weak var user0Image: UIImageView?
    @IBOutlet weak var user1Image: UIImageView?
    @IBOutlet weak var user2Image: UIImageView?
    @IBOutlet weak var project0Image: UIImageView?
    @IBOutlet weak var project1Image: UIImageView?
    @IBOutlet weak var project2Image: UIImageView?
    @IBOutlet weak var project3Image: UIImageView?
    @IBOutlet weak var moreButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoImage?.image = R.image.logo
        self.logoImage?.contentMode = .ScaleAspectFit
        self.containerView?.layer.cornerRadius = 5
        self.profileImage?.layer.cornerRadius = 30
        self.profileImage?.image = R.image.profile
        self.profileImage?.contentMode = .ScaleAspectFit
        self.profileImage?.clipsToBounds = true
        self.hireUsButton?.layer.cornerRadius = 3
        self.followingButton?.layer.cornerRadius = 3
        self.settingButton?.layer.cornerRadius = 3
        self.settingButton?.setImage(R.image.list, forState: .Normal)
        self.settingButton?.tintColor = UIColor.whiteColor()
        self.user0Image?.layer.cornerRadius = 19
        self.user0Image?.clipsToBounds = true
        self.user0Image?.image = R.image.user_0
        self.user1Image?.layer.cornerRadius = 19
        self.user1Image?.clipsToBounds = true
        self.user1Image?.image = R.image.user_1
        self.user2Image?.layer.cornerRadius = 19
        self.user2Image?.clipsToBounds = true
        self.user2Image?.image = R.image.user_2
        self.project0Image?.image = R.image.portofolio_0
        self.project0Image?.contentMode = .ScaleAspectFit
        self.project1Image?.image = R.image.portofolio_1
        self.project1Image?.contentMode = .ScaleAspectFit
        self.project2Image?.image = R.image.portofolio_2
        self.project2Image?.contentMode = .ScaleAspectFit
        self.project3Image?.image = R.image.portofolio_3
        self.project3Image?.contentMode = .ScaleAspectFit
        self.moreButton?.setImage(R.image.more, forState: .Normal)
        self.moreButton?.tintColor = UIColor.whiteColor()
        self.moreButton?.layer.cornerRadius = 19
        
        guard let scrollView = self.scrollView else { return }
        scrollView.contentSize = CGSizeMake(scrollView.frame.width, UIScreen.mainScreen().bounds.height)
    }
}
