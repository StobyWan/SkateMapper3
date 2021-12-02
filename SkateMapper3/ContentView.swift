//
//  ContentView.swift
//  SkateMapper3
//
//  Created by bryan stober on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    var body: some View {
        NavigationView {
            List {
                
                ForEach(vm.parks) { state in
                    
            
                    Section(state.id){
                        
                
                        
                        ForEach(state.parks) { park in
                            
                            
                            NavigationLink(destination: DetailView(park: park)) {
                                Text(park.name)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .task {
            await vm.fetchData()
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var parks = [UIPark]()
    @MainActor func fetchData() async {
        self.parks = await FetchFactory.shared.fetchData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
