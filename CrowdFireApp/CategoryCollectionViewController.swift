//
//  CollectionCell.swift
//  CrowdFireApp
//
//  Created by Sanjay Mali on 26/10/15.
//  Copyright © 2015 TickledMedia. All rights reserved.
//

import UIKit
class CategoryCollectionViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    var categories = ["Today SuggestionS", "Tue Suggestions", "Wen Suggestions", "Thu Suggestions", "Fri Suggestions", "Sat Suggestions","Sun Suggestions"]
    
    @IBOutlet weak var imagePicked: UIImageView!

    @IBAction func showActionSheetTapped(sender: AnyObject) {
        let actionSheetController: UIAlertController = UIAlertController(title: "CrowdFireApp", message: "Choose Action!", preferredStyle: .ActionSheet)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
       
        let otherSuggestion: UIAlertAction = UIAlertAction(title: "Would you like to shuffle", style: .Default) { action -> Void in
            print("Shuffle")
        }
        actionSheetController.addAction(otherSuggestion)
        
        actionSheetController.addAction(cancelAction)
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
            self.camera()
            print("Click Camera")
        }
        actionSheetController.addAction(takePictureAction)
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
            self.photoLib()
            print("Go Libraray")
        }
        actionSheetController.addAction(choosePictureAction)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    func camera() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        else{
            let alertView = UIAlertController(title: "Camera Not Support", message: "Thanks", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
                   }
    }
    
    func photoLib() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButt(sender: AnyObject) {
        let imageData = UIImageJPEGRepresentation(imagePicked.image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        _ = UIAlertAction(title: "Photo Saved", style: .Default)
            {(action:UIAlertAction) -> Void in
                // do something with action
                return
        }
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
       // imagePicked.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
}
extension CategoryCollectionViewController : UITableViewDelegate {
}


extension CategoryCollectionViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return categories[section]
    }
//     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let vw = UIView()
//        vw.backgroundColor = UIColor.whiteColor()
//        
//        return vw
//    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! RowCell
        
        return cell
    }
    
    
    
}
