//
//  ContentView.swift
//  SkateMapper3
//
//  Created by bryan stober on 12/1/21.
//

import SwiftUI
struct DetailView: View {
    let park: Park!
    var body: some View {
        Text(park.name)
    }
    
}
struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.parks) { park in
                    NavigationLink(destination: DetailView(park: park)) {
                        Text(park.name)
                    }
                }
            }
        }
        .task {
            await vm.fetchData()
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var parks = [Park]()
    @MainActor func fetchData() async {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: URL(string: Constants.API.url)!)
            self.parks = try JSONDecoder().decode([Park].self, from: data)
        } catch {
            print("error \(error) ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
