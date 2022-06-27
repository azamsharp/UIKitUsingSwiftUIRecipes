//
//  CounterView.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/27/22.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var counter: Int = 0
}

class CounterViewModel: ObservableObject {
    @Published var value: Int = 0
}

struct FancyCounterView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("Fancy Counter View")
            Text("\(appState.counter)")
        }
    }
}


struct CounterView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("\(appState.counter)")
            Button("Increment") {
                self.appState.counter += 1
            }.buttonStyle(.borderedProminent)
            
            FancyCounterView()
                .padding()
                .foregroundColor(.white)
                .background {
                    Color.green
                }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView().environmentObject(AppState())
    }
}
