//
//  HKTextField.swift
//  HKTextFieldDemo
//
//  Created by tom on 2017/7/27.
//  Copyright © 2017年 Yopark. All rights reserved.
//

import UIKit

class HKTextField: UIView,UITextFieldDelegate {
    var transformId: CGAffineTransform?
    var placeRect:CGRect? = nil
    var isEditing = false
    
    let textField = UITextField.init()
    
    let placeholderLabel = UILabel.init()
    
    let highlightLine = UIView.init()
    
    var keyboardType:UIKeyboardType{
        set{
            self.textField.keyboardType = keyboardType
        }
        get{
            return self.textField.keyboardType
        }
    }
    
    var placeholder:String = ""{
        didSet{
            let attribute = NSMutableDictionary()
            attribute.setObject(UIFont.systemFont(ofSize: 12), forKey: NSAttributedStringKey.font as NSCopying)
            self.placeRect = placeholder.boundingRect(with: CGSize.init(width: 300, height: 25), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attribute as? [NSAttributedStringKey : Any], context: nil)
            self.placeholderLabel.text = placeholder
            self.placeholderLabel.frame = CGRect.init(x: 15, y: 25, width: self.placeRect!.width, height: 80-25)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.borderStyle = .none
        textField.delegate = self
        self.addSubview(textField)
        self.addSubview(placeholderLabel)
        self.addSubview(highlightLine)
        highlightLine.backgroundColor = UIColor.green
        highlightLine.isHidden = true
        placeholderLabel.font = UIFont.systemFont(ofSize: 12)
        placeholderLabel.backgroundColor = UIColor.clear;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = CGRect.init(x: 15, y: 25, width: self.frame.width-30, height: self.frame.height-25)
        self.highlightLine.frame = CGRect.init(x: 0, y: self.frame.height-4, width: self.frame.width, height: 4)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.highlightLine.isHidden = false
        self.transformId = self.placeholderLabel.transform
        UIView.animate(withDuration: 0.20) {
            self.placeholderLabel.frame = CGRect.init(x: 15, y: 0, width: (self.placeRect?.width)!, height: 80-25)
            self.placeholderLabel.transform = self.placeholderLabel.transform.scaledBy(x: 1.0, y: 1.0)
            self.placeholderLabel.textColor = UIColor.init(white: 0.5, alpha: 1)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.highlightLine.isHidden = true
        if textField.text!.isEmpty{
            UIView.animate(withDuration: 0.25) {
                self.placeholderLabel.transform = self.transformId!
                self.placeholderLabel.frame = CGRect.init(x: 15, y: 25, width: (self.placeRect?.width)!, height: 80-25)
                self.placeholderLabel.textColor = UIColor.black
            }
        }
        
    }
    
    
    
}
