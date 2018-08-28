//
//  RSDarkModeAdaptingToolbarButton.swift
//  RSCore
//
//  Created by Daniel Jalkut on 8/28/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Cocoa

class RSDarkModeAdaptingToolbarButton: NSButton {
	public var forceTemplateInDarkMode: Bool = false
	var originalImageTemplateState: Bool = false

	public convenience init(image: NSImage, target: Any?, action: Selector?, forceTemplateInDarkMode: Bool = false) {
		self.init(image: image, target: target, action: action)
		self.forceTemplateInDarkMode = forceTemplateInDarkMode
	}

	override func layout() {
		// Always re-set the NSImage template state based on the current dark mode setting
		if #available(macOS 10.14, *) {
			if self.forceTemplateInDarkMode, let targetImage = self.image {
				var newTemplateState: Bool = self.originalImageTemplateState

				if self.effectiveAppearance.isDarkMode {
					newTemplateState = true
				}

				targetImage.isTemplate = newTemplateState
			}
		}

		super.layout()
	}
}
