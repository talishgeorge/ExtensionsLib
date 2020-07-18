//
//  Created by TCS.
//  Copyright © 2020 TCS. All rights reserved.
// 

import CoreData

extension NSManagedObjectContext {
    
    /// Coredata Insert
    /// - Parameter type: Generic Type
  public func insert<T: NSManagedObject>(_ type: T.Type) -> T? {
    let entityName = T.description()
    let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: self)
    return entity as? T
  }
}
