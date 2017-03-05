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
	
	let flyerHeader: UIImageView = {
		let flyer = UIImageView()
		flyer.image = UIImage(named: "waka")
		flyer.contentMode = .scaleAspectFill
		flyer.backgroundColor = UIColor.black
		return flyer
	}()
	
	func setupViews(){
		
		backgroundColor = UIColor.black
		
		addSubview(flyerHeader)
		
		
		addConstriantsWithFormat(format: "H:|[v0]|", views: flyerHeader)
		addConstriantsWithFormat(format: "V:|[v0(150)]", views: flyerHeader)
		
		
	}
	
	
}
