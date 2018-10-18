//
//  DetailsViewController.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-03-01.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseIDLabel: UILabel!
    @IBOutlet weak var courseProffessorLabel: UILabel!
    @IBOutlet weak var courseNameStaticLabel: UILabel!
    @IBOutlet weak var courseDetailsTitleLabel: UILabel!
    @IBOutlet weak var courseIDStaticLabel: UILabel!
    @IBOutlet weak var courseProfStaticLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    var cNameStaticLabel: String = "Course Name: "
    var cIDStaticLabel: String = "Course ID: "
    var cProfStaticLabel: String = "Instructor: "
    var cNameLabel: String!
    var cIDLabel: String!
    var cProfLabel: String!
    var courseTitle: String = "Course Details:"
    var startDate: String!
    var endDate: String!
    var startTime: String!
    var endTime: String!
    
    var item: CourseItem?
    
    // MARK: - Default Delegate Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseNameLabel.text = cNameLabel
        courseNameLabel.sizeToFit()
        courseIDLabel.text = cIDLabel
        courseIDLabel.sizeToFit()
        courseProffessorLabel.text = cProfLabel
        courseProffessorLabel.sizeToFit()
        courseNameStaticLabel.text = cNameStaticLabel
        courseNameStaticLabel.sizeToFit()
        courseIDStaticLabel.text = cIDStaticLabel
        courseIDStaticLabel.sizeToFit()
        courseProfStaticLabel.text = cProfStaticLabel
        courseProfStaticLabel.sizeToFit()
        courseDetailsTitleLabel.text = courseTitle
        courseDetailsTitleLabel.sizeToFit()
        startDateLabel.text = startDate
        startDateLabel.sizeToFit()
        endDateLabel.text = endDate
        endDateLabel.sizeToFit()
        startTimeLabel.text = startTime
        startTimeLabel.sizeToFit()
        endTimeLabel.text = endTime
        endTimeLabel.sizeToFit()
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Make Date a String methods
    
    // takes date and returns string in yyyy-MM-dd format
    func setStartDate(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    // takes date and returns string in yyyy-MM-dd format
    func setEndDate(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    // takes date and returns string in hour, min, am/pm
    func setTime(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    
    // takes date and returns string in hour, min, am/pm
    func setEndTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    
}
