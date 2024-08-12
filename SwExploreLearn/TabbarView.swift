//
//  TabbarView.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation
import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            UsersListView()
                .tabItem {
                    Label("Users", systemImage: "person.3.fill")
                }
            
            PostsListView()
                .tabItem {
                    Label("Posts", systemImage: "doc.text.fill")
                }
            
            CommentsListView()
                .tabItem {
                    Label("Comments", systemImage: "bubble.left.and.bubble.right.fill")
                }
        }

    }
}
