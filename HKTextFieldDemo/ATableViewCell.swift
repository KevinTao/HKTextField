//
//  ATableViewCell.swift
//  HKTextFieldDemo
//
//  Created by tom on 2017/7/28.
//  Copyright © 2017年 Yopark. All rights reserved.
//

import UIKit

class ATableViewCell: UITableViewCell {
    @IBOutlet weak var aaa: HKTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.aaa.placeholder = "aaaa,bbbb"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
