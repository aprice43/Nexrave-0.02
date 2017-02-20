//
//  ViewController.swift
//  Nexrave 0.01
//
//  Created by Alvan Price on 12/22/16.
//  Copyright © 2016 Nexrave. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Firebase
import FBSDKLoginKit


















class LoginPageViewController: UIViewController , FBSDKLoginButtonDelegate{

    @IBOutlet var videoView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        self.setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
       let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "partyFootage", ofType: "mp4")!)
        
       let player = AVPlayer(url: path as URL)
        
       let newLayer = AVPlayerLayer(player: player)
       newLayer.frame = self.videoView.frame
       
        self.videoView.layer.addSublayer(newLayer)
        
        newLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.nexraveTextCenter(containerView: self.videoView)
        player.play()
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue:"AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem, queue: nil, using: videoDidPlayToEnd)
       
        self.createNexraveButtons(containerView: self.videoView)
        //Image Overlay
    
        
    }


    
    func videoDidPlayToEnd(_ notification: Notification) {
        
        
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        
        player.seek(to: kCMTimeZero)
        
        
    }
    // This is the logo over the video
    func nexraveTextCenter(containerView: UIView) {
        
        let imagename = "nexraveScreen.png"
        let image = UIImage(named: imagename)
        let Nuview = UIView()
        Nuview.backgroundColor = UIColor.black
        Nuview.alpha = 0.60
        
        let imageview = UIImageView(image: image)
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        
        imageview.frame = CGRect(x: 0, y: 0, width: width, height: height)
        Nuview.frame = imageview.frame
        view.addSubview(Nuview)
        view.addSubview(imageview)
    }
    
    func createNexraveButtons(containerView: UIView){
        
        let margin:CGFloat = 15.0
        
        
        let signIn = FBSDKLoginButton()
        signIn.delegate = self
        signIn.loginBehavior = FBSDKLoginBehavior.browser
        

        signIn.frame.size.width = (UIScreen.main.bounds.width - (2 * margin))
        signIn.frame.size.height = 45.0
        signIn.frame.origin.x = margin
        signIn.frame.origin.y = ((containerView.frame.size.height - signIn.frame.size.height) - 25)
        view.addSubview(signIn)

        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logged Out")
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
           
            print(error)
            return
        }
        print("Is logged in")
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else
        {return}
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user,error) in
            if error != nil {
                print("Something doesn't seem right here: ",error ?? "")
                return
            }
            
            
            print("Successfully logged in"  )
            
            
        })
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id,name,age_range,gender,link"]).start {
         (connection,result,err) in
            
            if err != nil {
                
                print("Failed Graph Request:", err ?? "")
                return
            }
            

            
            let uid = FIRAuth.auth()?.currentUser?.uid
            let ref = FIRDatabase.database().reference(fromURL: "https://nexrave-e1c12.firebaseio.com/")
            let values =  NSMutableDictionary()
            
            
            values.setObject(((result as! NSDictionary).object(forKey: "id")! as! NSString).integerValue, forKey: "facebook_id" as NSCopying)
            values.setObject(((result as! NSDictionary).object(forKey: "age_range")! as! NSDictionary).object(forKey: "min")!, forKey: "age_range" as NSCopying)
            values.setObject((result as! NSDictionary).object(forKey: "name")! , forKey: "name" as NSCopying)
            values.setObject((result as! NSDictionary).object(forKey: "gender")! , forKey: "gender" as NSCopying)
            values.setObject((result as! NSDictionary).object(forKey: "link")! , forKey: "link" as NSCopying)
            values.setObject("user" , forKey: "role" as NSCopying)


            let usersRef = ref.child("users").child(uid!)
            usersRef.updateChildValues((values as NSDictionary) as! [AnyHashable : Any] , withCompletionBlock: {
                (err, ref) in
                
                if err != nil {
                    
                    print(err ?? "")
                    return
                }
                
                print("made it into firbase")
                
                self.performSegue(withIdentifier: "toFeed", sender: self)
                
                
                
            })
            
            
            
            
            
        }
    }

}
