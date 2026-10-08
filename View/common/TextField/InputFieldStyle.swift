//
//  InputFieldStyle.swift
//  productivityApp
//
//  Created by user302637 on 10/7/26.
//
import SwiftUI

struct InputFieldStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            )
    }
}
