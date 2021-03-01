//
//  MainMoviesView.swift
//  SwiftUI-Movies-Example
//
//  Created by Jack Higgins on 2/26/21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MainMoviesView: View {
    
    @ObservedObject var viewModel: MainMoviesViewModel = MainMoviesViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if viewModel.movieBuckets.isEmpty {
                    //Handle loading and error states
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.movieBuckets, id: \.self) { bucket in
                                VStack {
                                    TileView(bucket: bucket)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .listRowInsets(EdgeInsets())
                                .background(Color.white)
                            }
                        }
                        .padding(.top, 5)
                    }
                }
            }.navigationBarTitle("Movies", displayMode: .large)
        }
    }
}

struct TileView: View {
    
    var bucket: MovieBucket
    
    @State private var selectedMovie: MovieModel?
    @State var pushToDetail = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let movie = selectedMovie {
                NavigationLink(
                    destination: DetailMovieView(movie: movie),
                    isActive: $pushToDetail,
                    label: { EmptyView() }
                )
                .frame(width: 0, height: 0)
                .opacity(0)
            }
            
            HStack(alignment: .bottom) {
                Text(bucket.title)
                    .font(.title2)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
            .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(bucket.movies, id: \.self) { movie in
                        TileCell(movie: movie)
                            .padding(.leading, movie == bucket.movies[0] ? 20 : 5)
                            .padding(.trailing, movie == bucket.movies.last ? 20 : 5)
                            .padding(.bottom)
                            .onTapGesture {
                                self.selectedMovie = movie
                                self.pushToDetail = true
                            }
                    }
                }
            }
        }
    }
}

struct TileCell: View {
    
    var movie: MovieModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if movie._posterURL != "N/A" {
                KFImage(movie.posterURL)
                    .resizable()
                    .cancelOnDisappear(true)
            } else {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                    Text(movie.title)
                        .font(.callout)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
        }
        .frame(width: 200)
        .frame(height: 325)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 5, y: 5)
    }
}

struct MainMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMoviesView()
    }
}
