// Copyright © 2018 - 2021 Maksim Khrapov. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


final class PossibleCellValues {
    var values: Set<Int>
    
    
    init() {
        values = Set<Int>()
        
        for i in 1...9 {
            values.insert(i)
        }
    }
    
    
    func setValue(_ v: Int) {
        values.removeAll()
        values.insert(v)
    }
    
    
    func remove(_ v: Int) {
        if values.contains(v) {
            values.remove(v)
        }
    }
    
    
    func hasOnlyOneValue() -> Bool {
        return values.count == 1
    }
    
    
    func getUniqueValue() -> Int {
        if values.count == 1 {
            for i in values {
                return i
            }
        }
        else {
            fatalError("There are more than one possible value.")
        }
        return 0 // to please XCode
    }
    
    
    func copy() -> PossibleCellValues {
        let copy = PossibleCellValues()
        copy.values = self.values
        return copy
    }
}

