//
//  profilePage.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 1/3/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import Foundation


class ProfileCell : UICollectionViewCell {
	override init(frame: CGRect){
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let ProfileHeader: UIImageView = {
		let flyer = UIImageView()
		flyer.image = UIImage(named: "thug")
		flyer.contentMode = .scaleAspectFill
		flyer.clipsToBounds = true
		flyer.alpha = 0.8
		flyer.backgroundColor = UIColor.black
		
		return flyer
	}()
	let effectView : UIVisualEffectView = {
		let view = UIVisualEffectView()
		view.effect = UIBlurEffect(style: (UIBlurEffectStyle(rawValue: 1))!)
		
		return view
		
		
	}()
	let userPhoto: UIImageView = {
		let photo = UIImageView()
		photo.image = UIImage(named: "user")
		photo.layer.borderColor = UIColor.white.cgColor
		photo.layer.borderWidth = 2
		photo.layer.cornerRadius = 70
		photo.isUserInteractionEnabled = true
		photo.clipsToBounds = true
		
		return photo
	}()
	
	let horDivider: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.white
		
		
		return view
	}()
	let instagramFollow : UIButton = {
		let button = UIButton()
		let image = UIImage(named: "instagram")
		button.setImage(image, for: .normal)
		
	
	
		return button
	}()
	let twitterFollow : UIButton = {
		let button = UIButton()
		let image = UIImage(named: "twitter")
		button.setImage(image, for: .normal)
		
		
		
		
		return button
	}()
	let facebookFollow : UIButton = {
		let button = UIButton()
		let image = UIImage(named: "facebook")
		button.setImage(image, for: .normal)
		
		
		
		return button
	}()
	let snapchatFollow : UIButton = {
		let button = UIButton()
		let image = UIImage(named: "snapchat")
		button.setImage(image, for: .normal)
		
		
		
		return button
	}()
	let socialBox : UIView = {
		let view  = UIView()
		view.backgroundColor = UIColor.clear
		return view
	}()
	let nameLabel : UILabel = {
		let label = UILabel()
		label.textColor = UIColor.white
		label.text = "User Profile"
		label.font = UIFont.boldSystemFont(ofSize: 25)
		label.textAlignment = .center
		return label
	}()
	
	func setupViews(){
		let x = (UIScreen.main.bounds.width - 220) / 5
		backgroundColor = UIColor.black
		
		addSubview(ProfileHeader)
		addSubview(effectView)
		addSubview(horDivider)
		socialBox.addSubview(twitterFollow)
		socialBox.addSubview(facebookFollow)
		socialBox.addSubview(instagramFollow)
		socialBox.addSubview(snapchatFollow)
		effectView.addSubview(nameLabel)
		effectView.addSubview(socialBox)
		
		effectView.addSubview(userPhoto)
		addConstriantsWithFormat(format: "H:|[v0]|", views: ProfileHeader)
		addConstriantsWithFormat(format: "H:|[v0]|", views: horDivider)
		addConstriantsWithFormat(format: "H:|[v0]|", views: effectView)
		effectView.addConstriantsWithFormat(format: "H:|-\((UIScreen.main.bounds.width / 2) - 70)-[v0(140)]|", views: userPhoto)
		effectView.addConstriantsWithFormat(format: "V:|-10-[v0]-5-[v1(140)]", views: nameLabel, userPhoto)
		effectView.addConstriantsWithFormat(format: "H:|-\((UIScreen.main.bounds.width / 2) - 75)-[v0(150)]", views: nameLabel)
		addConstriantsWithFormat(format: "V:|[v0(270)]", views: effectView)
		addConstriantsWithFormat(format: "V:|[v0(270)][v1(3)]", views: ProfileHeader, horDivider)
		effectView.addConstriantsWithFormat(format: "V:[v0][v1]|", views: userPhoto ,socialBox)
		effectView.addConstriantsWithFormat(format: "H:|[v0]|", views: socialBox)
		socialBox.addConstriantsWithFormat(format: "H:|-\(x)-[v0(55)]-\(x)-[v1(55)]-\(x)-[v2]-\(x)-[v3(55)]", views: facebookFollow, instagramFollow , snapchatFollow, twitterFollow)
		socialBox.addConstriantsWithFormat(format: "V:|-15-[v0(55)]-15-|", views: facebookFollow)
		socialBox.addConstriantsWithFormat(format: "V:|-15-[v0(55)]-15-|", views: twitterFollow)
		socialBox.addConstriantsWithFormat(format: "V:|-15-[v0(55)]-15-|", views: instagramFollow)
		socialBox.addConstriantsWithFormat(format: "V:|[v0]|", views: snapchatFollow)
		
	}
	
	
}
