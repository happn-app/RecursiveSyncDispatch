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

import Dispatch
import Foundation



extension DispatchQueue {
	
	/* Not implemented yet. (Among other, how do we process the flags?) */
//	@available(OSX 10.10, iOS 8.0, *)
//	public func recursiveSync(execute workItem: DispatchWorkItem)
	
	public func recursiveSync<T>(execute work: () throws -> T) rethrows -> T {
		if queueStackCheck(mode: .push) {
			return try work()
		} else {
			let ret = try sync(execute: work)
			_ = queueStackCheck(mode: .pop)
			return ret
		}
	}
	
	/* Not implemented yet. (How do we process the flags?) */
//	public func recursiveSync<T>(flags: DispatchWorkItemFlags, execute work: () throws -> T) rethrows -> T
	
	/* ***************
      MARK: - Private
	   *************** */
	
	private enum QueueStackCheckMode {
		
		case push
		case pop
		
	}
	
	private static let queuesPerThreadKey = "HPN_RSD__QueuesWithRecursiveDispatchOnThread"
	
	private func queueStackCheck(mode: QueueStackCheckMode) -> Bool {
		let checked = Unmanaged.passUnretained(self).toOpaque()
		var queuesSet = Thread.current.threadDictionary[DispatchQueue.queuesPerThreadKey] as! Set<UnsafeMutableRawPointer>? ?? Set()
		
		var modified = false
		switch mode {
		case .push: modified =  queuesSet.insert(checked).inserted
		case .pop:  modified = (queuesSet.remove(checked) != nil)
		}
		
		if modified {Thread.current.threadDictionary[DispatchQueue.queuesPerThreadKey] = queuesSet}
		return !modified
	}
	
}
