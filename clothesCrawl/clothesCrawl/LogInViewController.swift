import UIKit

class LogInViewController: UIViewController, FBSDKLoginButtonDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginButton : FBSDKLoginButton = FBSDKLoginButton()
        self.view.addSubview(loginButton)
        loginButton.center = self.view.center
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self

//        if (FBSDKAccessToken.currentAccessToken() != nil)
//        {
//            // User is already logged in, do work such as go to next view controller.
//        }
//        else
//        {
//                let loginButton : FBSDKLoginButton = FBSDKLoginButton()
//            self.view.addSubview(loginButton)
//            loginButton.center = self.view.center
//            loginButton.readPermissions = ["public_profile", "email", "user_friends"]
//            loginButton.delegate = self
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                println("User Email is: \(userEmail)")
            }
        })
    }

}