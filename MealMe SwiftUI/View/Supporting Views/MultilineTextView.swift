//
//  MultilineTextView.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-10.
//

import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var isEditable: Bool

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = self.isEditable
        view.isUserInteractionEnabled = self.isEditable
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.isEditable = self.isEditable
        uiView.isUserInteractionEnabled = self.isEditable
    }
}
