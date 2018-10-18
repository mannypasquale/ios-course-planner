//
//  CourseItemTableViewController.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-02-28.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import UIKit
import os

class CourseItemTableViewController: UITableViewController {
    

    // MARK: - Properties
    
    let cellIdentifier = "CourseItemTableViewCell"
    
    // MARK: - Default Delegate Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if loading app after closing set items to how it was upon close
        if let restored = loadItems() {
            StartScreenViewController.GlobalVariables.items = restored
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StartScreenViewController.GlobalVariables.items.count
    }
    
    
    // populate cell with your course details(only image, courseID, and Course name)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CourseItemTableViewCell else {
            fatalError("Selected cell is not of type \(cellIdentifier)") }
        let item = StartScreenViewController.GlobalVariables.items[indexPath.row]
        cell.photoImage.image = item.image
        cell.courseID.text = item.courseID.text
        cell.courseNameLabel.text = item.courseName.text
        cell.courseNameStaticLabel.text = "Course Name: "
        cell.courseIDStaticLabel.text = "CourseID: "
        return cell
        
    }
    
    // delete course upon swipe
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Delete the row from the data source
            StartScreenViewController.GlobalVariables.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            
        }
        //save the new course list with the deletion
        saveItems()
        
    }
    
    
    // MARK: - Actions

    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        super.prepare(for: segue, sender: sender)
        
        // if press "Details" button of course go to new screen and populate with all the course details of that course
        if segue.identifier == "ShowDetails" {
            guard let detailViewController = segue.destination as? DetailsViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            guard let button = sender as? UIButton else {
                fatalError("Unexpected destination \(String(describing: sender))")
                
            }
            guard let selectedTableViewCell = button.superview?.superview else{
                fatalError("LFDSJHSDLKFJSDFLSDJF")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell as! UITableViewCell) else {
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            detailViewController.item = StartScreenViewController.GlobalVariables.items[indexPath.row]
            let item = StartScreenViewController.GlobalVariables.items[indexPath.row]
            if item.courseName.text == "" {
                detailViewController.cNameLabel = "N/A"
            } else {
                detailViewController.cNameLabel = item.courseName.text

            }
            if item.courseID.text == ""{
                detailViewController.cIDLabel = "N/A"
            } else {
                detailViewController.cIDLabel = item.courseID.text

            }
            if item.courseProf.text == ""{
                detailViewController.cProfLabel = "N/A"
            } else {
                detailViewController.cProfLabel = item.courseProf.text

            }
            let sD = detailViewController.setStartDate(date: item.startDate)
            let eD = detailViewController.setEndDate(date: item.endDate)
            let sT = detailViewController.setTime(date: item.startTime)
            detailViewController.startDate = sD
            detailViewController.startTime = sT
            let eT = detailViewController.setEndTime(date: item.endTime)
            if eT < sT {
                detailViewController.endTime = "End Time before start"
            } else {
                detailViewController.endTime = eT
            }
            if eD < sD {
                detailViewController.endDate = "End Date proceed start date"
            } else {
                detailViewController.endDate = eD
            }
        }
        
        // If you select course go to VC to edit it with new info you desire
        if segue.identifier == "EditCourse" {
            guard let detailViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            guard let selectedTableViewCell = sender as? CourseItemTableViewCell else {
                fatalError("Unexpected destination \(String(describing: sender))")

            }
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell) else {
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            
            detailViewController.item = StartScreenViewController.GlobalVariables.items[indexPath.row]
            }
    }

    // upon press of save button the course Item will be saved to Course LIst
    @IBAction func unwindToCourseItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let item = sourceViewController.item {
            
            // if editing previously created course item
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                StartScreenViewController.GlobalVariables.items[selectedIndexPath.row] = item
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            // if its new course item
            else {
                let newIndexPath = IndexPath(row: StartScreenViewController.GlobalVariables.items.count, section: 0)
                StartScreenViewController.GlobalVariables.items.append(item)
                tableView.insertRows(at: [newIndexPath], with: .automatic) // iOS picks animation
            }
            
        }
        saveItems()
    }
    
    // MARK: - Persistence
    
    // save the current course List upon app termination
    func saveItems(){
        if !NSKeyedArchiver.archiveRootObject(StartScreenViewController.GlobalVariables.items, toFile: CourseItem.archiveURL.path){
            os_log("Cannot save in %@", log: OSLog.default, type: .debug, CourseItem.archiveURL.path)
        }
    }
    // load the course list prior to last app termaination
    func loadItems() -> [CourseItem]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: CourseItem.archiveURL.path) as? [CourseItem]
        }
    }



