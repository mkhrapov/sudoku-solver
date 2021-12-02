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


import XCTest
import SudokuSolver

final class SudokuSolverTests: XCTestCase {
    private func str2arr(_ s: String) -> [Int] {
        XCTAssert(s.count == 81)
        var data = [Int]()
        
        for c in s {
            if c == "." {
                data.append(0)
            }
            else {
                data.append(Int(String(c))!)
            }
        }
        return data
    }
    
    
    private func display(_ a: [Int]) {
        print("--------------------------------------------------------")
        var counter = 0
        for i in a {
            counter += 1
            print(i, " ", terminator: "")
            if counter % 9 == 0 {
                counter = 0
                print("\n")
            }
        }
        print("--------------------------------------------------------")
    }
    
    
    func testSudokuAll() {
        let puzzles = [
            "12..4......5.69.1...9...5.........7.7...52.9..3......2.9.6...5.4..9..8.1..3...9.4",
            "...57..3.1......2.7...234......8...4..7..4...49....6.5.42...3.....7..9....18.....",
            "7..1523........92....3.....1....47.8.......6............9...5.6.4.9.7...8....6.1.",
            "1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..",
            "1...34.8....8..5....4.6..21.18......3..1.2..6......81.52..7.9....6..9....9.64...2",
            "...92......68.3...19..7...623..4.1....1...7....8.3..297...8..91...5.72......64...",
            ".6.5.4.3.1...9...8.........9...5...6.4.6.2.7.7...4...5.........4...8...1.5.2.3.4.",
            "7.....4...2..7..8...3..8.799..5..3...6..2..9...1.97..6...3..9...3..4..6...9..1.35",
            "....7..2.8.......6.1.2.5...9.54....8.........3....85.1...3.2.8.4.......9.7..6....",
            "6.........8..5...........16.2.91.....1.....6.....64.7.47...........7..3.........2",
            ".731......6..495.....7......9....3..3.2.1.6.7..4....9......6.....789..5......513.",
            "85...24..72......9..4.........1.7..23.5...9...4...........8..7..17..........36.4.", // Arto Inkala 2006
            "..53.....8......2..7..1.5..4....53...1..7...6..32...8..6.5....9..4....3......97..", // Arto Inkala 2010
            ".......12........3..23..4....18....5.6..7.8.......9.....85.....9...4.5..47...6...", // Platinum Blonde
            "8..........36......7..9.2...5...7.......457.....1...3...1....68..85...1..9....4..", // Hardest Sudoku
            "................................................................................."  // boundary condition
        ]
        
        
        for puzzle in puzzles {
            let solver = SudokuSolver(str2arr(puzzle))
            let solved = solver.solve()
            XCTAssert(solved)
            
            if (solved) {
                let solution = solver.getSolution()!
                XCTAssert(solution.isConsistent())
                display(solution.asArray())
            }
        }
    }
}
