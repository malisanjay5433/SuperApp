//
//  LoginWithFBViewController.swift
//  SuperApp
//
//  Created by Sanjay Mali on 06/11/15.
//  Copyright © 2015 TickledMedia. All rights reserved.
//

import UIKit
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKShareKit

class LoginWithFBViewController: UIViewController,FBSDKLoginButtonDelegate{

    var name:String!
    var email:String!
    var id:String!
    var picture_Url:String!

    override func viewDidLoad() {
        super.viewDidLoad()

          configure_facebook()
        // Do any additional setup after loading the view.
    }

    func configure_facebook()
    {
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            
            print("Not login")
        }
        else {
            
            
            dispatch_async(dispatch_get_main_queue(),{
                self.performSegueWithIdentifier("Next", sender: self)
                print("login")
            })
        }
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email","user_friends","user_location"]
        loginButton.center = self.view.center
        loginButton.delegate  = self
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Facebook Integration
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil{
            fetch_User_Info()
            print("login Complete")
            self.performSegueWithIdentifier("Next", sender: self)
            
        }
        else {
            
            print(error.localizedDescription)
        }
        
        
    }
    
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        print("logged Out")
    }
    
    
func fetch_User_Info()
    {
        if ((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath:"me", parameters: ["fields": "id,name,first_name,last_name,picture.type(large),email"]).startWithCompletionHandler({(
    connection,result,error) -> Void in
    if (error == nil) {
    let user_dict = result as! NSDictionary
    self.name = user_dict["name"] as! String
    self.email = user_dict["email"] as! String
    self.id = user_dict["id"] as! String
    let  picture = user_dict["picture"] as! NSDictionary
    let picture_data = picture["data"] as! NSDictionary
    self.picture_Url = picture_data["url"] as! String
    print(self.name)
    print(self.email)
    print(self.id)
    print(self.picture_Url)
    }
    else {
    print("Error Getting Friends \(error)");
    }
    
    })
    }
    }

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
