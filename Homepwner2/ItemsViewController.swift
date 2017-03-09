//
//  ItemsViewController.swift
//  Homepwner2
//
//  Created by Timothy Huang on 3/7/17.
//  Copyright © 2017 Timothy Huang. All rights reserved.
//

import Foundation
import UIKit


class ItemsViewController: UITableViewController
{
    var itemStore: ItemStore!

    
    // Editing
    @IBAction func toggleEditingMode(sender: AnyObject)
    {
        if isEditing
        {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }
        
        else
        {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    
    }
    
    // Add
    @IBAction func addNewItem(sender: AnyObject)
    {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem)
        {
            let indexPath = NSIndexSet(forRow: index, inSection: 0)
            
            // Insert this new row into the table
            tableView.insertRows(at: indexPath, with: .automatic)

        }
        
        
        
    }
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        // Create Content Inset padding 
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
    // numberOfRowsInSection = how many rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemStore.allItems.count
    }
    
    
    
    // cellForRowAt = which row and what content 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
    
        
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
        
    } // end func

} // end class