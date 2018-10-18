//
//  CourseCollection.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-03-01.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import Foundation
import UIKit

class CourseCollection: NSObject{
    var courseCollection: [CourseItem]
    
    init(courseCollection: [CourseItem]){
        self.courseCollection = courseCollection
    }
}
