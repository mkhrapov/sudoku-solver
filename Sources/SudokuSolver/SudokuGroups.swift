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


final class SudokuGroups {
    static var groups: [Set<Int>] = {
        var g = [Set<Int>]()
        
        g.append(Set<Int>([ 0,  1,  2,  3,  4,  5,  6,  7,  8]))
        g.append(Set<Int>([ 9, 10, 11, 12, 13, 14, 15, 16, 17]))
        g.append(Set<Int>([18, 19, 20, 21, 22, 23, 24, 25, 26]))
        g.append(Set<Int>([27, 28, 29, 30, 31, 32, 33, 34, 35]))
        g.append(Set<Int>([36, 37, 38, 39, 40, 41, 42, 43, 44]))
        g.append(Set<Int>([45, 46, 47, 48, 49, 50, 51, 52, 53]))
        g.append(Set<Int>([54, 55, 56, 57, 58, 59, 60, 61, 62]))
        g.append(Set<Int>([63, 64, 65, 66, 67, 68, 69, 70, 71]))
        g.append(Set<Int>([72, 73, 74, 75, 76, 77, 78, 79, 80]))
        
        g.append(Set<Int>([ 0,  9, 18, 27, 36, 45, 54, 63, 72]))
        g.append(Set<Int>([ 1, 10, 19, 28, 37, 46, 55, 64, 73]))
        g.append(Set<Int>([ 2, 11, 20, 29, 38, 47, 56, 65, 74]))
        g.append(Set<Int>([ 3, 12, 21, 30, 39, 48, 57, 66, 75]))
        g.append(Set<Int>([ 4, 13, 22, 31, 40, 49, 58, 67, 76]))
        g.append(Set<Int>([ 5, 14, 23, 32, 41, 50, 59, 68, 77]))
        g.append(Set<Int>([ 6, 15, 24, 33, 42, 51, 60, 69, 78]))
        g.append(Set<Int>([ 7, 16, 25, 34, 43, 52, 61, 70, 79]))
        g.append(Set<Int>([ 8, 17, 26, 35, 44, 53, 62, 71, 80]))
        
        g.append(Set<Int>([ 0,  1,  2,  9, 10, 11, 18, 19, 20]))
        g.append(Set<Int>([ 3,  4,  5, 12, 13, 14, 21, 22, 23]))
        g.append(Set<Int>([ 6,  7,  8, 15, 16, 17, 24, 25, 26]))
        g.append(Set<Int>([27, 28, 29, 36, 37, 38, 45, 46, 47]))
        g.append(Set<Int>([30, 31, 32, 39, 40, 41, 48, 49, 50]))
        g.append(Set<Int>([33, 34, 35, 42, 43, 44, 51, 52, 53]))
        g.append(Set<Int>([54, 55, 56, 63, 64, 65, 72, 73, 74]))
        g.append(Set<Int>([57, 58, 59, 66, 67, 68, 75, 76, 77]))
        g.append(Set<Int>([60, 61, 62, 69, 70, 71, 78, 79, 80]))
        
        return g
    }()
}

