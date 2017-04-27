//
//  User.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 1/24/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import Foundation
import Firebase



class User {
    var name: String?
	var age_range: Int?
	var uid: String?
	var photo: UIImage?
	var ProfilePhotoUrl : String? {
	willSet(newProfilePhotoUrl) {
		self.photo =  UIImage(data: NSData(contentsOf: NSURL(string:newProfilePhotoUrl!) as! URL) as! Data)
		} didSet {
			print("profile set")
		}
	}
	var timeline : [Event]?
    var promoGroup : PromoGroup?
    var email : String?
    var gender: String?
    var role: String?
	var facebook_id: Int?
    var photos : [UIImage]?
    var numOfHosted : Int?
    var pendingInvites : [Event]?
    var eventHistory : [Event]?
	lazy var toolbelt = FirebaseToolbelt()
	

	func setUserProperties() {
		DispatchQueue.global(qos: .userInteractive).sync {
		let ref = FIRDatabase.database().reference(fromURL: "https://nexrave-e1c12.firebaseio.com/");
		let uid = FIRAuth.auth()?.currentUser?.uid
	
		let userRef = ref.child("users").child(uid!)
		
			
		_ = userRef.observe(FIRDataEventType.value, with: { (snapshot) in
			DispatchQueue.main.async {
			if (snapshot.exists()) {
				self.name = snapshot.childSnapshot(forPath: "name").value as! String?
				self.age_range = snapshot.childSnapshot(forPath: "age_range").value as! Int?
				self.ProfilePhotoUrl = snapshot.childSnapshot(forPath: "pic_uri").value as! String?
				self.gender = snapshot.childSnapshot(forPath: "gender").value as! String?
				self.role = snapshot.childSnapshot(forPath: "role").value as?
				String
				self.facebook_id = (snapshot.childSnapshot(forPath: "facebook_id").value as! Int)
			} else {
				print("user doesn't exist")
			}
			}
		})
	 }
	}
//	func setTimeLine(eventID: [String]) {
//			let ref = FIRDatabase.database().reference(fromURL: "https://nexrave-e1c12.firebaseio.com/")
//			var i = 0
//			
//			while (i < eventID.count ){
//				let userRef = ref.child("events").child(eventID[i] as String!)
//			 DispatchQueue.global(qos: .userInteractive).sync {
//
//				_ = userRef.observe(FIRDataEventType.value, with: { (snapshot) in
//					if (snapshot.exists()) {
//					 let theData = snapshot.value as! [String : AnyObject]
//						eventRef.child("guests").child(String(describing: self.delegate.user.facebook_id)).child("firebase_id").setValue(self.uid)
//					 let anEvent = Event()
//					 anEvent.initWithDict(aDict: theData)
//						
//					 self.userEventList.append(anEvent)
//					 
//						
//					}
//			})
//		   }
//			i += 1
//		}
//		
//	}
	
}

class Post : Event {
	

	
}
class ProfilePage {
	
	
    var name: String?
    var ProfilePhotoUrl: String?
    
    
    
    
    
}
class Event {
	var event_id : String?
	var facebook_cover_pic: String?  {
		didSet(newhostrofilePhotoUrl) {
			self.flyerPhoto =  UIImage(data: NSData(contentsOf: NSURL(string:newhostrofilePhotoUrl!) as! URL) as! Data)
		}
	}

	var flyerPhoto: UIImage?
	var facebook_url: String?
	var guests: ([String : AnyObject])?
	var location: String?
	var main_host_id: String? {
		willSet(newmain_host_id){
			
		}
	}
	var number_checked_in: Int = 0
	var description: String?
	var date_time: String?
	var event_name: String?
	var city_state : String?
	var hostName: String?
	var hostProfilephoto: UIImage?
	var hostProfilePhotoUrl : String? {
		willSet(newhostrofilePhotoUrl) {
			self.hostProfilephoto =  UIImage(data: NSData(contentsOf: NSURL(string:newhostrofilePhotoUrl!) as! URL) as! Data)
			self.feedController?.reload()
		} didSet {
			print("profile set")
		}
	}
	var feedController: FeedController?

	init(aDict: [String: AnyObject]) {
		self.event_id = aDict["event_id"] as! String?
		self.facebook_cover_pic = aDict["facebook_cover_pic"] as! String?
		self.facebook_url = aDict["facebook_url"] as! String?
		self.location = aDict["location"] as! String?
		self.city_state = aDict["city_state"] as! String?
		self.date_time = aDict["date_time"] as! String?
		self.guests = (aDict["guests"] as! [String : AnyObject]?)!
		self.description = aDict["description"] as! String?
		self.event_name = aDict["event_name"] as! String?
		self.main_host_id = aDict["main_host_id"] as! String?
		self.number_checked_in = (aDict["number_checked_in"] as! Int?)!
	
			let ref = FIRDatabase.database().reference(fromURL: "https://nexrave-e1c12.firebaseio.com/");
			let uid = self.main_host_id
			
			let userRef = ref.child("users").child(uid!)
			
			DispatchQueue.global(qos: .userInteractive).sync {
			_ = userRef.observe(FIRDataEventType.value, with: { (snapshot) in
				
					if (snapshot.exists()) {
						self.hostName = snapshot.childSnapshot(forPath: "name").value as! String?
						self.hostProfilePhotoUrl = snapshot.childSnapshot(forPath: "pic_uri").value as! String?
						
					} else {
						print("user doesn't exist")
					}
				
			})
		}
		

	}
	
	func printDes() {
		
		print(self.event_id, self.location)
		
		
	}
	
	
	}
class PromoGroup {
    
    
    
    
    
    
    
    
    
}
