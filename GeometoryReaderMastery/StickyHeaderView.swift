//
//  StickyHeaderView.swift
//  GeometoryReaderMastery
//
//  Created by hiraoka on 2022/03/18.
//

import SwiftUI

let scrollCoordinateSpace = "scroll"

struct StickyHeaderView: View {

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HeaderView()
                    .frame(height: 250)


            }
        }
        .coordinateSpace(name: scrollCoordinateSpace)
        .ignoresSafeArea(.container, edges: .vertical)
    }

    struct HeaderView: View {
        var body: some View {
            GeometryReader { proxy in
                let minY = proxy.frame(in: .named(scrollCoordinateSpace)).minY
                let width = proxy.size.width
                let height = proxy.size.height + minY

                Color.blue
                    .frame(width: width, height: height, alignment: .center)
                    .overlay {
                        ZStack(alignment: .bottom) {
                            LinearGradient(colors: [.clear, .white],
                                           startPoint: .top, endPoint: .bottom)
                            VStack {
                            Text("Header Content")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .offset(y: -minY)
            }
        }
    }
}

struct StickyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeaderView()
    }
}
