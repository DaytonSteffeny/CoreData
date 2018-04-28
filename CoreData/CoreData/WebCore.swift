//
//  WebCore.swift
//  Core Data Project
//
//  Created by Dayton Steffeny on 4/27/18.
//  Copyright © 2018 Dayton Steffeny. All rights reserved.
//

import UIKit
import CoreData

@objc(Website)
public class Website: NSManagedObject {
    convenience init?(name: String?, url: String?, summary: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Website.entity(), insertInto: managedContext)
        
        self.name = name
        self.url = url
        self.summary = summary
    }
}
