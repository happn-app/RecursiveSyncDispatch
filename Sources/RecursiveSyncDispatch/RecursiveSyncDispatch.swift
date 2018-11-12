/*
 * RecursiveSyncDispatch.swift
 * RecursiveSyncDispatch
 *
 * Created by François Lamboley on 12/11/2018.
 * Copyright © 2018 happn. All rights reserved.
 */

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
	
	private static let queuesPerThreadKey = "FLRSD_QueuesWithRecursiveDispatchOnThread"
	
	private func queueStackCheck(mode: QueueStackCheckMode) -> Bool {
		var queuesSet = Thread.current.threadDictionary[DispatchQueue.queuesPerThreadKey] as! Set<DispatchQueue>? ?? Set()
		
		var modified = false
		switch mode {
		case .push: modified =  queuesSet.insert(self).inserted
		case .pop:  modified = (queuesSet.remove(self) != nil)
		}
		
		if modified {Thread.current.threadDictionary[DispatchQueue.queuesPerThreadKey] = queuesSet}
		return !modified
	}
	
}
