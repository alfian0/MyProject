//
//  CenterView.swift
//  MyProject
//
//  Created by alfian on 28/12/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import SlideOutMenu

class CenterView: UIViewController, ICenterViewController {
    var presenter: IHomePresenter!
    var delegate: ISlideOutMenuDelegate!
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.menu, style: .Plain, target: self, action: #selector(self.actionButtonL(_:)))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 234/25, green: 76/255, blue: 137/255, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.user, style: .Plain, target: self, action: #selector(self.actionButtonR(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 234/25, green: 76/255, blue: 137/255, alpha: 1)
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        self.collectionView?.registerNib(nib, forCellWithReuseIdentifier: "itemCell")
    }
    
    @objc func actionButtonL(sender: UIButton) {
        self.delegate.toggleLeftPanel()
    }
    
    @objc func actionButtonR(sender: UIButton) {
        self.delegate.toggleRightPanel()
    }
}

extension CenterView: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("itemCell", forIndexPath: indexPath) as! ItemCell
        if indexPath.item == 0 {
            cell.bucketsImage?.image = R.image.portofolio_0
        } else if indexPath.item == 1 {
            cell.bucketsImage?.image = R.image.portofolio_1
        } else {
            cell.bucketsImage?.image = R.image.portofolio_2        }
        
        return cell
    }
}

extension CenterView: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((UIScreen.mainScreen().bounds.width-(8*3))/2, (UIScreen.mainScreen().bounds.width-(8*3))/2)
    }
}