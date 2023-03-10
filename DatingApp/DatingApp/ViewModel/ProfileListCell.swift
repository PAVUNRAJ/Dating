//
//  ProfileListCell.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import UIKit

class ProfileListCell: UITableViewCell {

    @IBOutlet weak var imageViewBg: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var infoBgView: UIView!
    @IBOutlet weak var userInfoLbl: UILabel!
    @IBOutlet weak var userDetailsInfo1: UILabel!
    @IBOutlet weak var userDetailsInfo2: UILabel!
    @IBOutlet weak var userDetailsInfo3: UILabel!
    @IBOutlet weak var userDetailsInfo4: UILabel!
    @IBOutlet weak var userDetailsInfo5: UILabel!
    @IBOutlet weak var userDetailsInfo6: UILabel!
    @IBOutlet weak var userDetailsInfo7: UILabel!
    
    @IBOutlet weak var userImg1: UIImageView!
    @IBOutlet weak var userImg2: UIImageView!
    @IBOutlet weak var userImg3: UIImageView!
    @IBOutlet weak var userImg4: UIImageView!
    @IBOutlet weak var userImg5: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var userImg6: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    static var identifier : String {
        return String(describing: self)
    }
}

extension ProfileListCell {
    func setUpUI(){
        imageViewBg.layer.cornerRadius = 15.0
        profileImg.layer.cornerRadius = 15.0
        infoBgView.layer.cornerRadius = 15.0
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 15
        bottomView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}
