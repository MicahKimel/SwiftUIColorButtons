//
//  EmployeeWorkOrderElement.swift
//  SwiftUIColorButton
//
//  Created by Micah Kimel on 12/31/24.
//


public extension Array where Element: Equatable {
    //remove duplicates
    //use equatable function in structs to determine how to distinct
    //https://stackoverflow.com/questions/72564539/swift-struct-array-distinct-on-one-column-best-approach
    
    mutating func distinct() {
        guard self.count > 1 else {
            return
        }
        
        let numsCount = self.count
        var slow = 1
        
        for i in 1 ..< numsCount {
            if self[i - 1] != self[i] {
                self[slow] = self[i]
                slow += 1
            }
        }
        
        self.removeSubrange(slow ..< numsCount)
    }
}
