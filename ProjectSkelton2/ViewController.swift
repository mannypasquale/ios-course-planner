//
//  ViewController.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-02-28.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import UIKit
import os
class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var courseNameOutlet: UITextField!
    @IBOutlet weak var courseIDOutlet: UITextField!
    @IBOutlet weak var courseProfessorOutlet: UITextField!
    @IBOutlet weak var courseStartDate: UIDatePicker!
    @IBOutlet weak var courseEndDate: UIDatePicker!
    @IBOutlet weak var courseStartTime: UIDatePicker!
    @IBOutlet weak var courseEndTime: UIDatePicker!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    
    var item: CourseItem?

    // MARK: - Default Delegate Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.courseProfessorOutlet.delegate = self
        self.courseIDOutlet.delegate = self
        self.courseNameOutlet.delegate = self
        
        // Only entered if item was set by the table view controller on edit
        if let item = item {
            
            courseNameOutlet.text = item.courseName.text!
            courseIDOutlet.text = item.courseID.text!
            courseProfessorOutlet.text = item.courseProf.text!
            courseStartDate.date = item.startDate
            courseEndDate.date = item.endDate
            courseStartTime.date = item.startTime
            courseEndTime.date = item.endTime
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Image Picker Actions
    
    // dismiss picker if user cancels a photo selection
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //tell VC to pick original image and log error if selection fails
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            os_log("Missing image in %@", log: OSLog.default, type: .debug, info)
            return
            
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil) }
    
    // somone taps on image photo lib opens up
    @IBAction func selectImageFromPhotoLibary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated:true, completion:nil)
    }
    
    
    // MARK: - Navigation
    
    
    @IBAction func cancel(_ sender: Any) {
        if presentingViewController is UINavigationController {
            // Add
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController {
            // Edit
            owningNavigationController.popViewController(animated: true)
        }
    }
    
    // pressing return after entering text dismisses keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.courseNameOutlet.resignFirstResponder()
        self.courseIDOutlet.resignFirstResponder()
        self.courseProfessorOutlet.resignFirstResponder()
        return true
    }
    
    // save item when save is pressed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
            
        }
        // user pressed save
        item = CourseItem(image: photoImageView.image ?? #imageLiteral(resourceName: "defaultImage"), courseName: courseNameOutlet, courseID: courseIDOutlet, courseProf: courseProfessorOutlet, startDate: courseStartDate.date, endDate: courseEndDate.date, startTime: courseStartTime.date, endTime: courseEndTime.date)
        
    }

}

