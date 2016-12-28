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



















class ViewController: UIViewController {

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
        let imageview = UIImageView(image: image)
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        
        imageview.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.addSubview(imageview)
    }
    
    func createNexraveButtons(containerView: UIView){
        
        let margin:CGFloat = 15.0
        let middleSpacing:CGFloat = 7.5
        let register = UIButton()
        let signIn = UIButton()
        
        signIn.setTitle("Sign In", for: .normal)
        signIn.setTitleColor(UIColor.white, for: .normal)
        signIn.backgroundColor = UIColor.red
        signIn.frame.size.width = ((( containerView.frame.size.width - signIn.frame.size.width) - (margin * 2))/2 - middleSpacing)
        signIn.frame.size.height = 40.0
        signIn.frame.origin.x = margin
        signIn.frame.origin.y = ((containerView.frame.size.height - signIn.frame.size.height) - 25)
        signIn.addTarget(self, action: #selector(signInButtonPressed) , for: UIControlEvents.touchUpInside)
        view.addSubview(signIn)
        register.setTitle("Register", for: .normal)
        register.setTitleColor(UIColor.white, for: .normal)
        register.backgroundColor = UIColor.clear
        register.frame.size.width = (((containerView.frame.size.width - signIn.frame.size.width)-(margin * 2))/2 - middleSpacing)
        register.frame.size.height = 40.0
        register.frame.origin.x = ((containerView.frame.size.width - register.frame.size.width) - (margin + 40))
        register.frame.origin.y = (( containerView.frame.size.height - signIn.frame.size.height) - 25 )
        register.addTarget(self, action: #selector(registerButtonPressed), for: UIControlEvents.touchUpInside)
        view.addSubview(register)
        
        
        
    }
    
    func signInButtonPressed(_ sender: UIButton!) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC: SignUpViewController = storyBoard.instantiateViewController(withIdentifier: "signIn") as! SignUpViewController
        
        signUpVC.buttonTitlePressed = sender.titleLabel?.text
        
        
        let navigationController = UINavigationController(rootViewController: signUpVC)
        
        self.present(navigationController, animated: true, completion: nil)
        
        
        
        
    
    }
    func registerButtonPressed(_ sender: UIButton!) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC : SignUpViewController = storyBoard.instantiateViewController(withIdentifier: "signIn") as! SignUpViewController
        
        
        
        
        let navigationController = UINavigationController(rootViewController: signUpVC)
        
        self.present(navigationController, animated: true, completion: nil)
    }

}
