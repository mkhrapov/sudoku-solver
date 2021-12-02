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


public final class SudokuSolver {
    let NUMCELLS = 81
    let puzzleData: [Int]
    var solution: SudokuState?
    
    
    public init(_ data: [Int]) {
        puzzleData = data
    }
    
    
    public func solve() -> Bool {
        let inititalState = SudokuState()
        
        for i in 0..<NUMCELLS {
            if puzzleData[i] != 0 {
                inititalState.setAndPropagateConstraints(i, puzzleData[i])
            }
        }
        
        if inititalState.isSolved() && inititalState.isConsistent() {
            solution = inititalState
            return true
        }
        
        solution = search(inititalState)
        
        guard let solution = solution else {
            return false
        }
        
        if solution.isSolved() && solution.isConsistent() {
            return true
        }
        else {
            return false
        }
    }
    
    
    // will only return a state if it is solved,otherwise nil
    func search(_ state: SudokuState) -> SudokuState? {
        guard let cellIndex = state.cellWithMinimumPossibleValues() else {
            return nil
        }
        
        for value in state.getValuesFor(cellIndex).sorted() {
            if state.isLegal(cellIndex, value) {
                let child = state.copy()
                child.setAndPropagateConstraints(cellIndex, value)
                
                if child.isSolved() && child.isConsistent() {
                    return child
                }
                else if child.isConsistent() {
                    let grandchild = search(child)
                    if grandchild != nil {
                        return grandchild
                    }
                }
            }
        }
        
        return nil
    }
    
    
    public func getSolution() -> SudokuState? {
        return solution
    }
}
