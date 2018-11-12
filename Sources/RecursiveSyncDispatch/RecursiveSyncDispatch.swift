/*
 * RecursiveSyncDispatch.swift
 * RecursiveSyncDispatch
 *
 * Created by François Lamboley on 12/11/2018.
 * Copyright © 2018 happn. All rights reserved.
 */

import Dispatch



extension DispatchQueue {
	
//	@available(OSX 10.10, iOS 8.0, *)
//	public func recursiveSync(execute workItem: DispatchWorkItem)
	
	public func recursiveSync<T>(execute work: () throws -> T) rethrows -> T {
		
	}
	
//	public func recursiveSync<T>(flags: DispatchWorkItemFlags, execute work: () throws -> T) rethrows -> T
	
}
