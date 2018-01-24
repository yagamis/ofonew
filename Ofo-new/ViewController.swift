//
//  ViewController.swift
//  Ofo-new
//
//  Created by yons on 2017/9/21.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var creditImageView: UIImageView!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let menus = ["我的行程", "我的钱包", "邀请好友", "兑优惠券", "我的客服"]
    let images = ["icon_slide_trip2","icon_slide_wallet2","icon_slide_invite2","icon_slide_coupon2","icon_slide_usage_guild2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath) as! UserProfileTableViewCell
        
        cell.profileImageView.image = UIImage(named: images[indexPath.row])
        cell.profileNameLabel.text = menus[indexPath.row]

        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

