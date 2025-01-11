//
//  MyBookApp.swift
//  MyBook
//
//  Created by USER on 11/01/25.
//

import SwiftUI
import SwiftData

@main
struct MyBookApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
//        .modelContainer(for: Book.self)
        .modelContainer(container)
    }
    init() {
        let schema = Schema([Book.self])
        let config = ModelConfiguration("MyBooks", schema: schema)
        do {
            container = try ModelContainer(for: Book.self, configurations: config)
        } catch {
            fatalError("Could not configure ModelContainer: \(error)")
        }
        
//        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
//        do {
//            container = try ModelContainer(for: Book.self, configurations: config)
//        } catch {
//            fatalError("Could not configure ModelContainer: \(error)")
//        }
//        print(URL.documentsDirectory.path())
//
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        
    }
}
