//
//  ItemStore.swift
//  Homepwner2
//
//  Created by Timothy Huang on 3/7/17.
//  Copyright © 2017 Timothy Huang. All rights reserved.
//

import Foundation
import UIKit


class ItemStore
{
    var allItems = [Item]()
    
    func createItem() -> Item
    {
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    
    
    } // end func
    
    
    init()
    {
        for _ in 0..<5
        {
            createItem()
            
        }
    
    }
    

} // end class
