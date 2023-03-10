//
//  ToastMessage.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import Foundation
import UIKit

class ToastView: UIView {
    
    private let messageLabel = UILabel()
    private let containerView = UIView()
    
    init(message: String) {
        super.init(frame: .zero)
        
        // Set up message label
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(messageLabel)
        
        // Set up container view
        containerView.backgroundColor = .red
        //UIColor(white: 0, alpha: 0.7)
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        // Set up auto layout constraints
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            containerView.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(duration: TimeInterval = 2) {
        // Animate the toast view
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            self.alpha = 1
            self.containerView.transform = CGAffineTransform(translationX: 0, y: -self.containerView.bounds.height - 32)
        }) { (completed) in
            // After animation is complete, fade out and remove from superview
            UIView.animate(withDuration: 0.2, delay: duration, options: [.curveEaseIn], animations: {
                self.alpha = 0
            }) { (completed) in
                self.removeFromSuperview()
            }
        }
    }
    
}
