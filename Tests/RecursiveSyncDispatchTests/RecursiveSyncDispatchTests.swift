/*
Copyright 2019 happn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

import XCTest
@testable import RecursiveSyncDispatch



final class RecursiveSyncDispatchTests: XCTestCase {
	
	func testBasicUsage() {
		var wentIn = false
		let a = DispatchQueue(label: "a")
		
		a.recursiveSync{
			a.recursiveSync{
				wentIn = true
			}
		}
		
		XCTAssertTrue(wentIn)
	}
	
	func testSimpleUsage() {
		var wentIn = false
		let a = DispatchQueue(label: "a")
		let b = DispatchQueue(label: "b")
		let c = DispatchQueue(label: "c")
		
		a.recursiveSync{
			b.recursiveSync{
				c.recursiveSync{
					a.recursiveSync{
						b.recursiveSync{
							c.recursiveSync{
								a.recursiveSync{
									wentIn = true
								}
							}
						}
					}
				}
			}
		}
		
		XCTAssertTrue(wentIn)
	}
	
}
