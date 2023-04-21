//
//  CustomProgressViewStyle.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import Foundation
import SwiftUI

struct CustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(.red)
    }
}

extension ProgressViewStyle where Self == CustomProgressViewStyle {
    static var customProgressView: Self { Self() }
}

