//
//  ViewController.swift
//  SnapKitAnimation
//
//  Created by Karolis Stasaitis on 20/09/15.
//  Copyright © 2015 memorado. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var containerView: UIView!
    
    var formView: UIView!
    
    var logoImageView: UIImageView!
    var loginTextField: UITextField!
    var passwordTextField: UITextField!
    var confirmButton: OutlineFillButton!
    var cancelButton: OutlineFillButton!
    
    override func loadView() {
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHandlers()
    }
    
    private func setupViews() {
        view = UIView()
        view.backgroundColor = UIColor(0xEBFFFE)
        
        containerView = UIView()
        
        formView = UIView()
        
        logoImageView = UIImageView(image: UIImage(named: "TangerineLogo"))
        logoImageView.contentMode = .ScaleAspectFit
        
        loginTextField = UITextField()
        loginTextField.borderStyle = .RoundedRect
        loginTextField.placeholder = "Username"
        loginTextField.layer.borderColor = UIColor(0x01FBCE).CGColor
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.cornerRadius = 4
        
        passwordTextField = UITextField()
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
        passwordTextField.layer.borderColor = UIColor(0x01FBCE).CGColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 4
        
        confirmButton = OutlineFillButton()
        confirmButton.setTitle("Login", forState: .Normal)
        confirmButton.foregroundColor = UIColor(0x446982)
        confirmButton.borderColor = UIColor(0x01FBCE)
        
        cancelButton = OutlineFillButton()
        cancelButton.setTitle("Cancel", forState: .Normal)
        cancelButton.foregroundColor = UIColor(0xB181B0)
        cancelButton.borderColor = UIColor(0x01FBCE)
        cancelButton.alpha = 0
        
        view.addSubview(containerView)
        containerView.addSubview(formView)
        formView.addSubviews(logoImageView, loginTextField, passwordTextField, cancelButton, confirmButton)
    }
    
    private func setupConstraints() {
        containerView.snp_makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        
        formView.snp_makeConstraints { make in
            make.centerY.equalTo(self.containerView)
            make.left.equalTo(self.containerView).offset(10)
            make.right.equalTo(self.containerView).offset(-10)
        }
        
        logoImageView.snp_makeConstraints { make in
            make.top.equalTo(self.formView).offset(10)
            make.left.equalTo(self.formView).offset(40)
            make.right.equalTo(self.formView).offset(-40)
        }
        
        loginTextField.snp_makeConstraints { make in
            make.top.equalTo(self.logoImageView.snp_bottom).offset(10)
            make.left.equalTo(self.formView).offset(10)
            make.right.equalTo(self.formView).offset(-10)
        }
        
        passwordTextField.snp_makeConstraints { make in
            make.top.equalTo(self.loginTextField.snp_bottom).offset(10)
            make.left.equalTo(self.formView).offset(10)
            make.right.equalTo(self.formView).offset(-10)
        }
        
        confirmButton.snp_makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp_bottom).offset(10)
            make.left.equalTo(self.formView).offset(10)
            make.right.equalTo(self.formView).offset(-10)
            make.bottom.equalTo(self.formView).offset(-10)
        }
        
        cancelButton.snp_makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp_bottom).offset(10)
            make.right.equalTo(self.formView).offset(-10)
            make.width.equalTo(self.confirmButton)
            make.bottom.equalTo(self.formView).offset(-10)
        }
    }
    
    private func setupHandlers() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        cancelButton.vm_onTouchUpInside = { _ in
            self.loginTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }
        
        confirmButton.vm_onTouchUpInside = { _ in
            self.loginTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }
    }
    
    //MARK: UIKeyboard Notifications
    
    func keyboardWillShow(notification: NSNotification) {
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue ?? 0.3
        let height = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height
        changeKeyboardState(true, duration: duration, height: height)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue ?? 0.3
        changeKeyboardState(false, duration: duration, height: 0)
    }
    
    func changeKeyboardState(shown: Bool, duration: NSTimeInterval, height: CGFloat?) {
        let height = height ?? 0
        containerView.snp_updateConstraints { make in
            make.bottom.equalTo(self.view).offset(-height)
        }
        confirmButton.snp_remakeConstraints { make in
            if shown {
                make.right.equalTo(self.cancelButton.snp_left).offset(-10)
            }
            else {
                make.right.equalTo(self.formView).offset(-10)
            }
            make.top.equalTo(self.passwordTextField.snp_bottom).offset(10)
            make.left.equalTo(self.formView).offset(10)
            make.bottom.equalTo(self.formView).offset(-10)
        }
        UIView.animateWithDuration(duration) {
            self.view.layoutIfNeeded()
            self.cancelButton.alpha = shown ? 1 : 0
        }
    }

}

