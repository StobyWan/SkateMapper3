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
    func fetchData() async -> [Park] {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: URL(string: Constants.API.url)!)
            self.data = try JSONDecoder().decode([Park].self, from: data)
            return self.data
        } catch {
            print("error \(error) ")
        }
        return []
    }
}
