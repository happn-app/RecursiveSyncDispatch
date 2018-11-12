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
	
	static var allTests = [
		("testBasicUsage", testBasicUsage),
		("testSimpleUsage", testSimpleUsage),
	]
	
}
