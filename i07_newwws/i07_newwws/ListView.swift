//
//  ListView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

import SwiftUI

struct ListView: View {
    let title: String
    let content: String
    let image: String
    var body: some View {
        VStack {
            if let url = URL(string: image), let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                
            }
            HStack {
                VStack {
                    Text(title)
                        .font(.title3)
                    Text(content)
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
        }
        .padding(5)
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(10)
    }
}


struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        ListView(title: "test", content: "test", image: "blah")
    }
}