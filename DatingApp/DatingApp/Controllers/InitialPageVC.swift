//
//  InitialPageVC.swift
//  DatingApp
//
//  Created by PavunRaj on 09/03/23.
//

import UIKit

class InitialPageVC: UIViewController {


    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // hideNavigationBar()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    

    @IBAction func logBtnTap(_ sender: UIButton) {
        logInBtn.buttonBackgroundAnimation(button: logInBtn)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard  let userDetail = storyBoard.instantiateViewController(withIdentifier: "LogInPageVC") as? LogInPageVC
        else{
            return
        }
        
        navigationController?.pushViewController(userDetail, animated: true)
    }
    
}


// MARK: - Setup UI Elements

extension InitialPageVC {
    
    func  setupUI(){

        logInBtn.setButton(titleColor: ColorPalette.blackColor, backgroundColor: ColorPalette.whiteColor, cornerRadius: 20, borderColor: .clear, borderWidth: 0, title: ConstantFile.logInTxt, fontSize: CustomFont.CustomFontInterBold(size: 15))
        
        signUpBtn.setButton(titleColor: ColorPalette.blackColor, backgroundColor: ColorPalette.whiteColor, cornerRadius: 20, borderColor: .clear, borderWidth: 0, title: ConstantFile.signUpTxt, fontSize: CustomFont.CustomFontInterBold(size: 15))
        
      
    }
    
    
}
