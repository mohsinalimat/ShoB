//
//  OrderItem+CoreDataClass.swift
//  ShoB
//
//  Created by Dara Beng on 6/13/19.
//  Copyright © 2019 Dara Beng. All rights reserved.
//
//

import CoreData
import SwiftUI
import Combine


/// An item of an order.
class OrderItem: NSManagedObject, Identifiable {
    
    @NSManaged var name: String
    @NSManaged var price: Cent
    @NSManaged var quantity: Int64
    @NSManaged var order: Order?
    
    var subtotal: Cent {
        price * quantity
    }
    
    
    override func willChangeValue(forKey key: String) {
        super.willChangeValue(forKey: key)
        objectWillChange.send()
    }
}


extension OrderItem {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<OrderItem> {
        return NSFetchRequest<OrderItem>(entityName: "OrderItem")
    }
}
