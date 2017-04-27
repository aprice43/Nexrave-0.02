 //
//  FirebaseTools.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 4/4/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import UIKit
import Firebase


class FirebaseToolbelt {
 
     //var ref: FIRDatabaseReference!
     let ref = FIRDatabase.database().reference(fromURL: "https://nexrave-e1c12.firebaseio.com/");
	 let uid = FIRAuth.auth()?.currentUser?.uid
	 let delegate = UIApplication.shared.delegate as! AppDelegate
	var collectionView : FeedController?
	var userEventList = [Event]()
	
	var set = 0

		
     func setFacebookId() {
		
         let userRef = self.ref.child("users").child(self.uid!).child("facebook_id");
         _ = userRef.observe(FIRDataEventType.value, with: { (snapshot) in
                 if (snapshot.exists()) {
					
                     self.delegate.user.facebook_id = snapshot.value as! Int?
					
                 } else {
                     //User has no events
                     print("No events");
                 }
         })
		
     }
 
	func loadFeedEvents(){
		
		
		

         self.setFacebookId()
         self.pullHostingEvents()
         self.pullOrganizationEvents()
		 self.pullAcceptedEvents()
		
		
	

		
		
			

	  
		
}

	
	func pullAcceptedEvents() {
		
		DispatchQueue.global(qos: .userInitiated).sync {
			
		
		
			
		let userRef = self.ref.child("users").child(self.uid!).child("accepted_invites")
		
		_ = userRef.observe(FIRDataEventType.value, with: { (snapshot) in
			  DispatchQueue.main.async {
			if (snapshot.exists()) {
				let map = snapshot.value as? [String : AnyObject] ?? [:];
				var hold = [Any]()
				for (key, _) in map {
					hold.append(key)
				}
				
				self.search(invitedEventsList: hold, userRef2: userRef)
				
			}else {
				//User has no events
				print("No events","===");
			}
			
			}
			
			
		})
		}
		
		
	}
     func pullHostingEvents(){
		DispatchQueue.global(qos: .userInitiated).sync {
			
			
		
         let userRef2 = self.ref.child("users").child(self.uid!).child("hosting_events");
		
         _ = userRef2.observe(FIRDataEventType.value, with: { (snapshot) in
                 if (snapshot.exists()) {
					 DispatchQueue.main.async {
                     let map = snapshot.value as? [String : AnyObject] ?? [:];
 
                     //TODO: Order by event time
					
					var hold = [Any]()
					for (key, _) in map {
						hold.append(key)
					}
					
					self.search(invitedEventsList: hold , userRef2: userRef2)
					}
				}
				 else {
                     //User has no events
                     print("No events");
				}
		})
		}
			
		
     }
 
     func pullOrganizationEvents() {
		DispatchQueue.global(qos: .userInitiated).sync {
			
			
		 
         let userRef2 = self.ref.child("users").child(self.uid!).child("subscribed").child("organizations")
		
		 _ = userRef2.observe(FIRDataEventType.value, with: { (snapshot) in
			 DispatchQueue.main.async {
			if snapshot.exists(){
					let map = snapshot.value as? [String : AnyObject] ?? [:]
					var orgs  = [Any]()
					for (key, _) in map {
					orgs.append(key)
					}
					var i = 0
				while (i < orgs.count) {
					let orgEventsList = self.ref.child("organizations").child( (orgs[i] as! [String : AnyObject])["events"] as! String)
					orgEventsList.observe(FIRDataEventType.value, with: { (snapshot) in
						if (snapshot.exists()) {
					let map2 = snapshot.value as? [String : AnyObject] ?? [:]
					var hold = [Any]()
					for (key, _) in map2 {
					hold.append(key)
					}
				
					self.search(invitedEventsList: hold , userRef2: orgEventsList)
					i += 1;
					} else {
					//User has no events
					print("No events")
		  }
					
		})
	  }
				
    }
	}
  })
 
 }
		
}


	func  search(invitedEventsList: [Any], userRef2: FIRDatabaseReference ){
		DispatchQueue.global(qos: .userInitiated).sync {
			
			
		 
		
		
         let eventsRef = self.ref.child("events");
         var i = 0;
		

			
         while (i < invitedEventsList.count) {
             let event_id = invitedEventsList[i]
             let eventRef = eventsRef.child(event_id as! String);
            // eventRef.keepSynced(true);
			
			
				
             _ = eventRef.observe(FIRDataEventType.value, with: { (snapshot) in
				  DispatchQueue.main.async {
                 if (snapshot.exists()) {
					 let theData = snapshot.value as! [String : AnyObject]
                     eventRef.child("guests").child(String(describing: self.delegate.user.facebook_id)).child("firebase_id").setValue(self.uid)
					let anEvent = Event.init(aDict: theData)
					
					anEvent.feedController = self.collectionView
					
					
					
					
					 self.userEventList.append(anEvent)
					
					
					
                     } else {
                         //This event no longer exists
						var i = 0
                         print("This event no longer exists");
                         userRef2.child(event_id as! String).removeValue();
					while i < self.userEventList.count {
						let test  = self.userEventList[i]
						if ((event_id as! String) == test.event_id) {
							self.userEventList.remove(at: i)
							self.set = self.set - 1
						}
						
						i += 1
					}
					
			   }
				}
		    })
				
			
				
			
			
			
			i += 1;
			
		 }
		
			
		}
	}
	
}
	

