//
//  User.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 1/24/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import Foundation




public class User {
    var name: String?
    var ProfilePhotoUrl : String?
    var timeline = [Event]()
    var promoGroup : PromoGroup
    var email : String?
    var gender: String?
    var isHost: Bool?
    var photos = [UIImage]()
    var numOfHosted = 0
    var pendingInvites = [Event]()
    var eventHistory = [Event]()
    
    init() {
        name = "none"
        ProfilePhotoUrl = "none"
        promoGroup = PromoGroup()
        email = "none"
        gender = "none"
        isHost = false
    }


    

    
    
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
