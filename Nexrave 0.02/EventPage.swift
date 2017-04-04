//
//  Multipage.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 1/2/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import UIKit

class EventCell : UICollectionViewCell {
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
		flyer.clipsToBounds = true
		flyer.alpha = 0.5
        flyer.backgroundColor = UIColor.black
        return flyer
    }()
	let hostPhoto: UIImageView = {
		let photo = UIImageView()
		photo.image = UIImage(named: "3")
		photo.layer.borderColor = UIColor.white.cgColor
		photo.layer.borderWidth = 3
		photo.layer.cornerRadius = 3
		photo.clipsToBounds = true
		
		return photo
	}()
	let flyerOverlay : UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.black
		view.alpha = 0.3
		return view
	}()
	let dateLabel: UILabel = {
		let label = UILabel()
		label.text = " 8:30PM"
		label.textColor = UIColor.white
		label.font = UIFont.boldSystemFont(ofSize: 40)
		return label
	}()
	let eventName: UILabel = {
		let label = UILabel()
		label.text = "Event Name Here"
		label.textColor = UIColor.white
		label.font = UIFont.boldSystemFont(ofSize: 30)
		return label
	}()
	let ticketButton: UIButton = {
		
		let button = UIButton()
		button.backgroundColor = UIColor.red
		button.tintColor = UIColor.black
		let ticket = UILabel()
		ticket.text = "TICKET"
		ticket.font = UIFont.boldSystemFont(ofSize: 25)
		ticket.textColor = UIColor.white
		ticket.textAlignment = .center
		button.addSubview(ticket)
		button.addConstriantsWithFormat(format: "H:|[v0]|", views: ticket)
		button.addConstriantsWithFormat(format: "V:|[v0]|", views: ticket)
		return button
		
	}()
	let horDivider: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.white
		
		
		return view
	}()
	let eventDesLabel : UILabel = {
		let label = UILabel()
		label.textColor = UIColor.white
		label.text = "Description:"
		label.font = UIFont.boldSystemFont(ofSize: 20)
		
		return label
	}()
	
	let eventLocLabel: UILabel = {
		let label = UILabel()
		label.textColor = UIColor.white
		label.text = "Location:"
		label.font = UIFont.boldSystemFont(ofSize: 20)
		return label
		
	}()
	
	func SetupViews(){
    
        backgroundColor = UIColor.black
        
        addSubview(flyerHeader)
		addSubview(horDivider)
        addSubview(hostPhoto)
		addSubview(dateLabel)
		addSubview(eventName)
		addSubview(ticketButton)
		addSubview(eventDesLabel)
		addSubview(eventLocLabel)
		flyerHeader.addSubview(flyerOverlay)
		flyerHeader.addConstriantsWithFormat(format: "H:|[v0]|", views: flyerOverlay)
		flyerHeader.addConstriantsWithFormat(format: "V:|[v0]|", views: flyerOverlay)
        addConstriantsWithFormat(format: "H:|[v0]|", views: horDivider)
		addConstriantsWithFormat(format: "H:|-8-[v0(90)]-8-[v1]", views: hostPhoto, eventName)
		addConstriantsWithFormat(format: "H:|-8-[v0(90)]-8-[v1]-8-|", views: hostPhoto, ticketButton)
		addConstriantsWithFormat(format: "V:|-180-[v0(90)]", views: hostPhoto)
		addConstriantsWithFormat(format: "H:[v0]-8-|", views: dateLabel)
		addConstriantsWithFormat(format: "V:|-20-[v0]", views: dateLabel)
        addConstriantsWithFormat(format: "H:|[v0]|", views: flyerHeader)
        addConstriantsWithFormat(format: "V:|[v0(220)][v1(3)]", views: flyerHeader,horDivider)
		addConstriantsWithFormat(format: "V:[v0]-3-[v1]-9-[v2]-20-[v3]-160-[v4]", views: eventName,horDivider,ticketButton,eventDesLabel, eventLocLabel)
		addConstriantsWithFormat(format: "H:|-16-[v0]", views: eventDesLabel)
		addConstriantsWithFormat(format: "H:|-16-[v0]", views: eventLocLabel)
        

    }
    
    
}

    


