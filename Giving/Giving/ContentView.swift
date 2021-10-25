//
//  ContentView.swift
//  Giving
//
//  Created by Adam on 10/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.1
    @State private var current = 20_000
    @State private var total = 1.0
    @State private var showingAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AsyncImage(url: URL(string: "https://thewaterproject.org/images/twp-resp-logo.png")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.accentColor
            }
            .frame(width: 300, height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Text("**The Water Project**").font(.title2)
            Text("**Description**")
            Text("The Water Project, Inc. is a 501(c)(3) non-profit organization unlocking human potential by providing reliable water projects to communities in sub-Saharan Africa who suffer needlessly from a lack of access to clean water and proper sanitation. For ten years, we have been helpingcommunities gain access to clean, safe water by providing training, expertise and financial support for water project construction through our staff and implementing partners.")

            Spacer()

            GroupBox {
                ProgressView(value: progress, label: {
                    Text("**$\(current)** raised")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                }, currentValueLabel: {
                    Text("*\(Int(progress/total * 100))% to goal*")
                        .foregroundColor(.accentColor)
                })
                    .tint(.accentColor)

                Button("Give Now!", action: {
                    if progress < 1.0 {
                        withAnimation {
                            progress += 0.1
                            current += Int(Double(20_000))
                        }
                        showingAlert = true
                    }
                })
                    .alert(
                        "Hooray! You've now given \(Int(progress/total * 100))% of your goal",
                        isPresented: $showingAlert
                    ) {
                        Button("OK", role: .cancel) { }
                    }
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.accentColor.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
