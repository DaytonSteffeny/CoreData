//
//  WebData.swift
//  Core Data Project
//
//  Created by Dayton Steffeny on 4/27/18.
//  Copyright © 2018 Dayton Steffeny. All rights reserved.
//

import Foundation
import CoreData


extension Website {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Website> {
        return NSFetchRequest<Website>(entityName: "Website:")
    }

    @NSManaged public var url: String?
    @NSManaged public var summary: String?
    @NSManaged public var name: String?

}
