//
//  FetchFactory.swift
//  SkateMapper3
//
//  Created by bryan stober on 12/1/21.
//

import Foundation
actor FetchFactory: ObservableObject {
    static let shared = FetchFactory()
    @Published var data: [Park]!
    func fetchData() async -> [UIPark] {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: URL(string: Constants.API.url)!)
            self.data = try JSONDecoder().decode([Park].self, from: data)
            
            return groupBy(self.data)
        } catch {
            print("error \(error) ")
        }
        return []
    }
    
    public func groupBy(_ parks: [Park]) ->[UIPark] {
        let reduced = Dictionary(grouping: parks, by: { $0.state })
            .map { (UIPark(id: $0.key, parks: $0.value.map { $0 }))}
        
        let groupedAndSorted = reduced.sorted(by: {
            $0.id.compare($1.id) == .orderedAscending
        })
        return groupedAndSorted
    }
}
