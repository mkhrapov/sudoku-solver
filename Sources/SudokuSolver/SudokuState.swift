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


public final class SudokuState {
    let NUMCELLS = 81
    var cells: [PossibleCellValues]
    var propagateQueue: [Int]
    
    init() {
        cells = [PossibleCellValues]()
        for _ in 0..<NUMCELLS {
            cells.append(PossibleCellValues())
        }
        
        propagateQueue = [Int]()
    }
    
    
    func setAndPropagateConstraints(_ i: Int, _ v: Int) {
        cells[i].setValue(v)
        propagateQueue.append(i)
        propagateConstraints()
    }
    
    
    func propagateConstraints() {
        if propagateQueue.count == 0 {
            return
        }
        
        while propagateQueue.count != 0 {
            let i = propagateQueue[0]
            propagateQueue.remove(at: 0)
            let v = cells[i].getUniqueValue()
            
            for j in constraintLinkedCells(i) {
                if !cells[j].hasOnlyOneValue() {
                    cells[j].remove(v)
                    if cells[j].hasOnlyOneValue() {
                        propagateQueue.append(j)
                        //display()
                    }
                }
            }
        }
        
        lookForCellsThatCanBeFixed()
    }
    
    
    func lookForCellsThatCanBeFixed() {
        for i in 0..<NUMCELLS {
            if !cells[i].hasOnlyOneValue() {
                if canBeFixed(i) {
                    propagateQueue.append(i)
                }
            }
        }
        
        propagateConstraints()
    }
    
    
    func canBeFixed(_ i: Int) -> Bool {
        for group in SudokuGroups.groups {
            if group.contains(i) {
                if canBeFixedInGroup(i, group) {
                    return true
                }
            }
        }
        
        return false
    }
    
    
    func canBeFixedInGroup(_ i: Int, _ group: Set<Int>) -> Bool {
        var values = Set<Int>([1, 2, 3, 4, 5, 6, 7, 8, 9])
        for j in group {
            if j != i {
                if cells[j].hasOnlyOneValue() {
                    values.remove(cells[j].getUniqueValue())
                }
            }
        }
        
        if values.count == 1 {
            for v in values {
                cells[i].setValue(v)
                return true
            }
            return true // to please XCode
        }
        else {
            return false
        }
    }
    
    
    func isLegal(_ i: Int, _ v: Int) -> Bool {
        for group in SudokuGroups.groups {
            if group.contains(i) {
                for j in group {
                    if j != i {
                        if cells[j].hasOnlyOneValue() {
                            if cells[j].getUniqueValue() == v {
                                return false
                            }
                        }
                    }
                }
            }
        }
        
        return true
    }
    
    
    func constraintLinkedCells(_ i: Int) -> Set<Int> {
        var linkedCells = Set<Int>()
        
        for group in SudokuGroups.groups {
            if group.contains(i) {
                linkedCells.formUnion(group)
            }
        }
        
        linkedCells.remove(i)
        return linkedCells
    }
    
    
    func isSolved() -> Bool {
        // each cell has only one value
        for cell in cells {
            if !cell.hasOnlyOneValue() {
                return false
            }
        }
        
        return true
    }
    
    
    public func isConsistent() -> Bool {
        for i in 0..<NUMCELLS {
            if !cells[i].hasOnlyOneValue() {
                continue
            }
            
            for group in SudokuGroups.groups {
                if group.contains(i) {
                    for j in group {
                        if !cells[j].hasOnlyOneValue() {
                            continue
                        }
                        
                        if j != i {
                            if cells[i].getUniqueValue() == cells[j].getUniqueValue() {
                                return false
                            }
                        }
                    }
                }
            }
        }
        
        return true
    }
    
    
    func getValuesFor(_ i: Int) -> Set<Int> {
        return cells[i].values
    }
    
    
    func cellWithMinimumPossibleValues() -> Int? {
        var result = [Int]()
        
        for i in 0..<NUMCELLS {
            if !cells[i].hasOnlyOneValue() {
                result.append(i)
            }
        }
        
        if result.count == 0 {
            return nil
        }
        
        result = result.sorted(by: { cells[$0].values.count < cells[$1].values.count })
        return result[0]
    }
    
    
    func copy() -> SudokuState {
        let copy = SudokuState()
        for i in 0..<NUMCELLS {
            copy.cells[i] = self.cells[i].copy()
        }
        return copy
    }
    
    
    public func asArray() -> [Int] {
        var result = [Int]()
        
        for c in cells {
            result.append(c.getUniqueValue())
        }
        
        return result
    }
}

