//
//  ProfileListVC.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import UIKit
import Toast_Swift
import NVActivityIndicatorView

class ProfileListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var NameLbl: UILabel!
    var userListResponse: UserListResponse? = nil
    var style = ToastStyle()
    var activityIndicator : NVActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(ProfileListCell.nib, forCellReuseIdentifier: ProfileListCell.identifier)
        tableView.separatorStyle = .none
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = ColorPalette.whiteColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        profileListRequest()
    }

    
    func profileListRequest(){
        let param = UserListRequest.init(Authorization: "")
        ResponseModel.userListAPIRequest(with: param, controller: self, boolLoaderEnable: false, completion: {
            Response in
            self.activityIndicator?.startAnimating()
            switch Response {
            case .failure(_):
                print("failure")
            case .success(let result):
                print("Success",result)
                if result.invites.profiles.count > 0 {
                    print(result)
                    self.activityIndicator?.stopAnimating()
                    self.userListResponse = result
                    self.tableView.reloadData()
                }else{
                    self.view.makeToast(ConstantFile.checkotpTxt, duration: 2.0, position: .bottom, style: self.style)
                }
            }
            
        })
    }
}


extension ProfileListVC : UITableViewDelegate{
    
}

extension ProfileListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListResponse?.invites.profiles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "ProfileListCell") as? ProfileListCell else {
            return UITableViewCell()
        }
        let image = (userListResponse?.invites.profiles[indexPath.row].photos[indexPath.row].photo) ?? ""
        let userName = (userListResponse?.invites.profiles[indexPath.row].generalInformation.firstName ) ?? ""
        let userAge = (userListResponse?.invites.profiles[indexPath.row].generalInformation.age ) ?? Int()
        let userHeight = (userListResponse?.invites.profiles[indexPath.row].generalInformation.height) ?? Int()
        let userstatus = (userListResponse?.invites.profiles[indexPath.row].generalInformation.maritalStatusV1.name) ?? String()
        let userLanguage = (userListResponse?.invites.profiles[indexPath.row].generalInformation.motherTongue.name) ?? String()
        
        let userExp = (userListResponse?.invites.profiles[indexPath.row].work.experienceV1.name) ?? String()
        
        let userSmoking = (userListResponse?.invites.profiles[indexPath.row].generalInformation.smokingV1.name) ?? String()
        let userSun = (userListResponse?.invites.profiles[indexPath.row].generalInformation.sunSignV1.name) ?? String()

        let fileUrl = NSURL(string:image)
        if fileUrl != nil {
             cell.profileImg.downloaded(from:fileUrl! as URL , contentMode: .scaleAspectFill)
        }

        NameLbl.setupNormalLbl(label: NameLbl, txt: "\(userName) \(userAge)")
    
        cell.userInfoLbl.setupItemLbl(label: cell.userInfoLbl, txt: "22 Kms Away - Hindu")
        
        cell.userDetailsInfo1.setupNormalLbl(label: cell.userDetailsInfo1, txt: "My Basics")
        cell.userDetailsInfo2.setupNormalLbl(label: cell.userDetailsInfo2, txt: "\(userHeight)")
        cell.userDetailsInfo3.setupNormalLbl(label: cell.userDetailsInfo3, txt: "\(userstatus)")
        cell.userDetailsInfo6.setupNormalLbl(label: cell.userDetailsInfo6, txt: "\(userLanguage)")
        cell.userDetailsInfo7.setupNormalLbl(label: cell.userDetailsInfo7, txt: "\(userSun)")
        cell.userDetailsInfo4.setupNormalLbl(label: cell.userDetailsInfo4, txt: "\(userSmoking)")
        cell.userDetailsInfo5.setupNormalLbl(label: cell.userDetailsInfo5, txt: "\(userExp)")

        
        return cell ?? UITableViewCell()
    }
    
    
}
