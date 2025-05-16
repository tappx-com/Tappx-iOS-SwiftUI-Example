//
//  StringExtension.swift
//  TappxSwiftUIExample
//
//  Created by Sara on 9/5/25.
//

import Foundation

extension String {
    var localized: String {
          return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
}
