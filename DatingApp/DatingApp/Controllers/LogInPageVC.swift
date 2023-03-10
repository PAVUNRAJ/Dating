//
//  LogInPageVC.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import UIKit
import CountryPickerView
import Toast_Swift
import TransitionButton
import IQKeyboardManagerSwift
class LogInPageVC: UIViewController {
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var subHeaderLbl: UILabel!
    @IBOutlet weak var countryPicTxtField: UITextField!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var otpTxtField: UITextField!
    @IBOutlet weak var resentbtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    let countryPickerView = CountryPickerView()
    var continueBtnTapped = Bool()
    var validateOTP = Bool()
    var style = ToastStyle()
    var timer: Timer?
    var remainingTime = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        mobileTxtField.delegate = self
        otpTxtField.delegate = self
        countryPicTxtField.delegate = self
        countryPicTxtField.inputView = countryPickerView
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 20
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        
        let returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        
      //  returnKeyHandler.addTextFieldView(countryPicTxtField)
        returnKeyHandler.addTextFieldView(mobileTxtField)
        returnKeyHandler.addTextFieldView(otpTxtField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    
    @IBAction func editBtnTap(_ sender: UIButton) {
    }
    @IBAction func continueBtn(_ sender: UIButton) {
        if validateOTP {
            
            if otpTxtField.text == ""  {
                let alert = UIAlertController(title: ConstantFile.errorMsgTxt, message: ConstantFile.otpTxt, preferredStyle: .alert)
                let okAction = UIAlertAction(title: ConstantFile.oKTxt, style: .default)
                alert.addAction(okAction)
                present(alert, animated: true)
            }else{
                
                callOTPverify()
            }
        }else{
            if mobileTxtField.text == "" || mobileTxtField.text?.count ?? 0 < 10 {
                let alert = UIAlertController(title: ConstantFile.errorMsgTxt, message: ConstantFile.errorMessage, preferredStyle: .alert)
                let okAction = UIAlertAction(title: ConstantFile.oKTxt, style: .default)
                alert.addAction(okAction)
                present(alert, animated: true)
            }else{
                continueBtnTapped = true
                callAPIFunction()
            }
        }
        
    }
    
    @objc func updateCountdown() {
        if remainingTime > 0 {
            remainingTime -= 1
            resentbtn.setTitle("00:\(remainingTime)", for: .normal)
            resentbtn.contentHorizontalAlignment = .left
            
        } else {
            // Stop the timer
            timer?.invalidate()
            resentbtn.setTitle("", for: .normal)
            
        }
    }
    
}

// MARK: - Setup UI Elements

extension LogInPageVC {
    
    func  setupUI(){
        headerLbl.setupHeaderLbl(label: headerLbl, txt: ConstantFile.headerText)
        subHeaderLbl.setupDecLbl(label: subHeaderLbl, txt: ConstantFile.subheaderPhoneText)
        
        mobileTxtField.setTextField(cornerRadius: 8.0, borderColor: UIColor.systemGray4, borderWidth: 1.0, fontSize: CustomFont.CustomFontInterBold(size: 18), textColor: ColorPalette.blackColor)
        countryPicTxtField.setTextField(cornerRadius: 8.0, borderColor: UIColor.systemGray4, borderWidth: 1.0, fontSize: CustomFont.CustomFontInterBold(size: 18), textColor: ColorPalette.blackColor)
        otpTxtField.setTextField(cornerRadius: 8.0, borderColor: UIColor.systemGray4, borderWidth: 1.0, fontSize: CustomFont.CustomFontInterBold(size: 18), textColor: ColorPalette.blackColor)
        countryPicTxtField.text = "+91"
        
        
        continueBtn.setButton(titleColor: ColorPalette.blackColor, backgroundColor: ColorPalette.btnColor, cornerRadius: 20, borderColor: .clear, borderWidth: 0, title: ConstantFile.continueTxt, fontSize: CustomFont.CustomFontInterBold(size: 14))
        
        resentbtn.setButton(titleColor: ColorPalette.blackColor, backgroundColor:.clear, cornerRadius: 20, borderColor: .clear, borderWidth: 0, title: "", fontSize: CustomFont.CustomFontInterBold(size: 15))
        
        if continueBtnTapped{
            editView.isHidden = false
            headerLbl.text = "+91 \(mobileTxtField.text ?? "")"
            subHeaderLbl.text = ConstantFile.enterOTPText
            otpTxtField.isHidden = false
            countryPicTxtField.isHidden = true
            mobileTxtField.isHidden = true
            
        }else{
            editView.isHidden = true
            otpTxtField.isHidden = true
            
        }
    }
    
    
    func callAPIFunction(){
        
        let param = PhoneNumberRequest.init(number: "+91\(mobileTxtField.text ?? "")")
        ResponseModel.phoneNumberLoginAPIRequest(with: param, controller: self, boolLoaderEnable: false, completion: {
            Response in
            switch Response {
            case .failure(_):
                print("falire")
            case .success(let result):
                print("Success",result)
                if result.status == true {
                    self.setupUI()
                    self.validateOTP = true
                    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCountdown), userInfo: nil, repeats: true)
                }else{
                    self.view.makeToast(ConstantFile.checkPhoneNum, duration: 2.0, position: .bottom, style: self.style)
                    self.validateOTP = false
                }
            }
            
        })
    }
    
    func callOTPverify(){
        let param = PhoneNumberOTPRequest.init(number: "+91\(mobileTxtField.text ?? "")", otp: otpTxtField.text ?? "")
        // phoneNumberOTPAPIRequest
        ResponseModel.phoneNumberOTPAPIRequest(with: param, controller: self, boolLoaderEnable: false, completion: {
            Response in
            switch Response {
            case .failure(_):
                print("falire")
            case .success(let result):
                print("Success",result)
                if result.token != "" {
                    print(result.token)
                    self.callTabBar()
 
                }else{
                    self.view.makeToast(ConstantFile.checkotpTxt, duration: 2.0, position: .bottom, style: self.style)
                }
            }
            
        })
    }
    
    
    func callTabBar(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let pgName = "HomePageTabBar"
        if let tabbar = storyboard?.instantiateViewController(withIdentifier: pgName) as? HomePageTabBar {
            tabbar.hidesBottomBarWhenPushed = false
            tabbar.navigationController?.hidesBottomBarWhenPushed = false
            tabbar.tabBarController?.tabBar.isHidden = false
            tabbar.navigationController?.tabBarController?.tabBar.isHidden = false
            self.navigationController?.pushViewController(tabbar, animated: true)
        }
    }
}


extension LogInPageVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Set the inputView of the textField to the countryPickerView
        if textField == countryPicTxtField {
            countryPickerView.showCountriesList(from: self)
            countryPicTxtField.inputView = countryPickerView
            
        }
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Only allow numeric characters
        var maxLength = Int()
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        guard allowedCharacters.isSuperset(of: characterSet) else {
            return false
        }
        
        // Restrict input to 4 characters
        if textField == mobileTxtField {
            maxLength = 10
        }else{
            maxLength = 4
        }
        
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
        currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}

extension LogInPageVC : CountryPickerViewDelegate,CountryPickerViewDataSource{
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        countryPicTxtField.text = country.phoneCode
        print("Selected country: \(country.code)")
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didTapCountry country: Country) -> Bool {
        // Allow the picker view to select the tapped country
        return true
    }
    
    
    
    
}
