//
//  ViewController.swift
//  HKTextFieldDemo
//
//  Created by tom on 2017/7/27.
//  Copyright © 2017年 Yopark. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textField1 = HKTextField.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 60))
        self.view.addSubview(textField1)
        print(textField1)
        let textField2 = HKTextField.init(frame: CGRect.init(x: 100, y: 180, width: 200, height: 60))
        self.view.addSubview(textField2)
        print(textField2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCellIdentifier")!
        cell.selectionStyle = .none
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

