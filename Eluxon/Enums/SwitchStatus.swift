//
//  SwitchStatus.swift
//  Eluxon
//
//  Created by Matt Tripodi on 9/7/17.
//  Copyright © 2017 Matthew Tripodi. All rights reserved.
//

import Foundation

enum SwitchStatus: Togglable {
	case on
	case off
	
	mutating func toggle() {
		switch self {
		case .on:
			self = .off
		case .off:
			self = .on 
		}
	}
}
