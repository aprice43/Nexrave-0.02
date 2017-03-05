//
//  User.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 1/24/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import Foundation




class User {
    var name: String?
    var ProfilePhotoUrl : String?
    var timeline : [Event]?
    var promoGroup : PromoGroup?
    var email : String?
    var gender: String?
    var isHost: Bool?
    var photos : [UIImage]?
    var numOfHosted : Int?
    var pendingInvites : [Event]?
    var eventHistory : [Event]?
    
    

    

    
    
}

class Post : Event {
    
    var PromoGroupname: String?
    var profileImage: UIImage?
    var flyerImage: UIImage?
    var time: String?
    var date: String?
    var eventName: String?
    var city : String?
    
}
class ProfilePage {
    
    
    var name: String?
    var ProfilePhotoUrl: String?
    
    
    
    
    
}
class Event {
    
    
    
    
    
}
class PromoGroup {
    
    
    
    
    
    
    
    
    
}
