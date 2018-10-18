//
//  CourseItem.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-02-28.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import Foundation
import UIKit
import os


// holds names of the properties of CourseItem
class PropertyKey {
    static let image = "image"
    static let courseName = "courseName"
    static let courseID = "courseID"
    static let courseProf =  "courseProf"
    static let startDate = "startDate"
    static let endDate = "endDate"
    static let startTime = "startTime"
    static let endTime = "endTime"
}
class CourseItem: NSObject, NSCoding {
    
    // MARK: - Properties
    
    var image: UIImage
    var courseName: UITextField
    var courseID: UITextField
    var courseProf: UITextField
    var startDate: Date
    var endDate: Date
    var startTime: Date
    var endTime: Date
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("courseItems")
    
    
    // MARK: - Initializers
    
    init(image: UIImage, courseName: UITextField, courseID: UITextField, courseProf: UITextField, startDate: Date, endDate: Date, startTime: Date, endTime: Date) {
        self.image = image
        self.courseName = courseName
        self.courseID = courseID
        self.courseProf = courseProf
        self.startDate = startDate
        self.endDate = endDate
        self.startTime = startTime
        self.endTime = endTime
    }
    
    // MARK: - Coding
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // loading saved data of image
        guard let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage else {
            os_log("Missing image", log: OSLog.default, type: .debug)
            return nil
        }
        // loading courseName saved data
        guard let courseName = aDecoder.decodeObject(forKey: PropertyKey.courseName) as? UITextField else {
            os_log("Missing courseName text", log: OSLog.default, type: .debug)
            return nil

        }
        //loads courseID saved data
        guard let courseID = aDecoder.decodeObject(forKey: PropertyKey.courseID) as? UITextField else {
            os_log("Missing courseID text", log: OSLog.default, type: .debug)
            return nil

        }
        // loads courseProf saved data
        guard let courseProf = aDecoder.decodeObject(forKey: PropertyKey.courseProf) as? UITextField else {
            os_log("Missing courseProf text", log: OSLog.default, type: .debug)
            return nil

        }
        //loads start date of course data
        guard let startDate = aDecoder.decodeObject(forKey: PropertyKey.startDate) as? Date else {
            os_log("Missing startDate date", log: OSLog.default, type: .debug)
            return nil

        }
        //loads endDate of saved data
        guard let endDate = aDecoder.decodeObject(forKey: PropertyKey.endDate) as? Date else {
            os_log("Missing endDate date", log: OSLog.default, type: .debug)
            return nil

        }
        //loads startTime of saved data
        guard let startTime = aDecoder.decodeObject(forKey: PropertyKey.startTime) as? Date else {
            os_log("Missing startTime date", log: OSLog.default, type: .debug)
            return nil

        }
        //loads endTime of saved data
        guard let endTime = aDecoder.decodeObject(forKey: PropertyKey.endTime) as? Date else {
            os_log("Missing endTime date", log: OSLog.default, type: .debug)
            return nil
            
        }
        // instanitates courseitem object with data saved above
        self.init(image: image, courseName: courseName, courseID: courseID, courseProf: courseProf, startDate: startDate, endDate: endDate, startTime: startTime, endTime: endTime)
    
    }
    
    //encodes all the properties of CourseItem and associates them with a string key
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(courseName, forKey: PropertyKey.courseName)
        aCoder.encode(courseID, forKey: PropertyKey.courseID)
        aCoder.encode(courseProf, forKey: PropertyKey.courseProf)
        aCoder.encode(startDate, forKey: PropertyKey.startDate)
        aCoder.encode(endDate, forKey: PropertyKey.endDate)
        aCoder.encode(startTime, forKey: PropertyKey.startTime)
        aCoder.encode(endTime, forKey: PropertyKey.endTime)
    }
}
