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
		photo.image = UIImage(named: "thug")
		photo.layer.borderColor = UIColor.white.cgColor
		photo.layer.borderWidth = 2
		photo.layer.cornerRadius = 75
		photo.isUserInteractionEnabled = true
		photo.clipsToBounds = true
		
		return photo
	}()
	
	let horDivider: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.white
		
		
		return view
	}()
	
	func setupViews(){
		
		backgroundColor = UIColor.black
		
		addSubview(ProfileHeader)
		addSubview(effectView)
		addSubview(horDivider)
		effectView.addSubview(userPhoto)
		addConstriantsWithFormat(format: "H:|[v0]|", views: ProfileHeader)
		addConstriantsWithFormat(format: "H:|[v0]|", views: horDivider)
		addConstriantsWithFormat(format: "H:|[v0]|", views: effectView)
		effectView.addConstriantsWithFormat(format: "H:|-\((UIScreen.main.bounds.width / 2) - 75)-[v0(150)]|", views: userPhoto)
		effectView.addConstriantsWithFormat(format: "V:|-20-[v0(150)]", views: userPhoto)
		addConstriantsWithFormat(format: "V:|[v0(250)]", views: effectView)
		addConstriantsWithFormat(format: "V:|[v0(250)][v1(3)]", views: ProfileHeader, horDivider)
		

		
	}
	
	
}
