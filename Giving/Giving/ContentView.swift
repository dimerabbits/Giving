//
//  ContentView.swift
//  Giving
//
//  Created by Adam on 10/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.1
    @State private var current = 20_000.0
    @State private var total = 1.0
    @State private var showingAlert = false
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AsyncImage(url: URL(string: "https://thewaterproject.org/images/twp-resp-logo.png")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.accentColor
            }
            .frame(width: 300, height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            ForEach(Client.allClients) { client in
                Text(client.title)
                    .font(.title2.bold())
                    .foregroundColor(.accentColor)
                Text("**Description**")
                Text(client.description)
            }
            
            Spacer()
            
            GroupBox {
                ProgressView(value: progress, label: {
                    Text("**\(current, format: localCurrency)** raised")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                }, currentValueLabel: {
                    Text("*\(Int(progress/total * 100))% to goal*")
                        .foregroundColor(.accentColor)
                })
                    .tint(.accentColor)
                
                Button("Give Now!", action: {
                    if progress <= 1.0 {
                        withAnimation {
                            progress += 0.1
                            current += 20_000.0
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
                    .giveButton()
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
