//
//  RightView.swift
//  MyProject
//
//  Created by alfian on 29/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import ParallaxHeaderView

class RightView: ParallaxController {
    var presenter: IHomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.tintColor = UIColor.yellowColor()
        self.tableView.addSubview(self.refreshControl!)
        
        self.tableView.registerNib(R.nib.rightMenuCell.instance, forCellReuseIdentifier: "rightMenuCell")
        self.refreshControl?.addTarget(self, action: #selector(self.refreshAction), forControlEvents: .ValueChanged)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rightMenuCell", forIndexPath: indexPath) as! RightMenuCell
            cell.presenter = self.presenter
            cell.selectionStyle = .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    @objc private func refreshAction() {
        self.refreshControl?.endRefreshing()
    }
}

extension RightView: IParallax {
    func setHeaderView() -> UIView {
        let headerView = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)[0] as! HeaderView
        return headerView
    }
    
    func setHeaderHeight() -> CGFloat {
        return 200
    }
    
    func setHeaderCut() -> CGFloat {
        return 0
    }
}