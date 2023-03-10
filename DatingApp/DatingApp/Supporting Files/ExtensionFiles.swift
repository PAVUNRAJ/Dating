//
//  ExtensionFiles.swift
//  DatingApp
//
//  Created by PavunRaj on 09/03/23.
//

import Foundation
import UIKit


extension UIViewController {
    
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func date (ChangeLocalFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = dateFormatter.date(from: "2015-04-01T11:42:00")
        
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = NSTimeZone.local
        let timeStamp = dateFormatter.string(from: date!)
        return timeStamp
    }
    
    func showCustomToast(message: String) {
           let toastView = ToastView(message: message)
           toastView.alpha = 1
           view.addSubview(toastView)
           toastView.show()
       }
    
    
}

// MARK: - UILabel Extension


extension UILabel {
    
    
    func setupHeaderLbl(label:UILabel,txt: String){
        label.text =  txt
        label.textAlignment =  .left
        label.textColor = .black
        label.font =  CustomFont.CustomFontInterRegular(size: 18)
    }
    
    func setupDecLbl(label:UILabel,txt: String){
        label.text =  txt
        label.textAlignment =  .left
        label.textColor = .black
        label.font =  CustomFont.CustomFontInterBold(size: 30)
    }
    
    func setupNormalLbl(label:UILabel,txt: String){
        label.text =  txt
        label.textAlignment =  .left
        label.textColor = .black
        label.font = CustomFont.CustomFontInterBold(size: 18)
    }
    
    func setupItemLbl(label:UILabel,txt: String){
        label.text =  txt
        label.textAlignment =  .left
        label.textColor = .white
        label.font = CustomFont.CustomFontInterBold(size: 18)
    }
    
    func setupDescLbl(label:UILabel,txt: String){
        label.text =  txt
        label.font =  UIFont.boldSystemFont(ofSize: 13)
    }
    
    func setupDesc(label:UILabel,txt: String){
        label.text =  txt
        label.font =  UIFont.systemFont(ofSize: 12)
    }
}

// MARK: - UIButton Extension


extension UIButton{
    
    func underlineMyText() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    
    
    func setButton(titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat,borderColor: UIColor,borderWidth: CGFloat,title: String,fontSize: UIFont) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.titleLabel?.font = fontSize
    }
    
    
    func addleadingButtonPadding(image:UIImage){
        
        let screenWidth = UIScreen.main.bounds.width
        let size = Int(screenWidth*0.06)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size+Int(screenWidth*0.06), height: size))
        let btnImage = UIButton(frame: CGRect(x: 0, y: 0, width: size, height: size))
        btnImage.setImage(image, for: .normal)
        btnImage.contentMode = .scaleAspectFit
        paddingView.addSubview(btnImage)
        
        
    }
    
    func buttonBackgroundAnimation(button:UIButton){
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.red.cgColor
        colorAnimation.duration = 0.3
        button.layer.add(colorAnimation, forKey: "ColorPulse")
    }
   
}


// MARK: - UIView Extension

extension UIView{
    
    func setupUIview(background: UIColor,cornerRadius: CGFloat,borderColor: UIColor,borderWidth:CGFloat){
        
        self.backgroundColor = background
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor  = borderColor.cgColor
        self.layer.masksToBounds = true
        
    }
}


extension UIImageView {
    
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}

extension UITableViewCell  {
    func date (ChangeLocalFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = dateFormatter.date(from: "2015-04-01T11:42:00")
        
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = NSTimeZone.local
        let timeStamp = dateFormatter.string(from: date!)
        return timeStamp
    }
    
}


// MARK: - UItextField

extension UITextField {
    
    func setTextField(cornerRadius: CGFloat,borderColor:UIColor,borderWidth:CGFloat,fontSize: UIFont,textColor: UIColor){
        self.textColor = textColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.font = fontSize
        self.layer.masksToBounds = true
        self.keyboardType = .numberPad
    }
}
