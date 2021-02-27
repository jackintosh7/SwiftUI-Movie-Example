//
//  DetailMovieView.swift
//  SwiftUI-Movies-Example
//
//  Created by Jack Higgins on 2/26/21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct DetailMovieView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var viewModel: DetailMovieViewModel
    
    init(movie: MovieModel) {
        _viewModel = ObservedObject(wrappedValue: DetailMovieViewModel(movie: movie))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                if let movie = viewModel.movie {
                    HStack {
                        Text(movie.title)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("closeIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
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
                        
                        VStack(alignment: .leading, spacing: 20) {
                            MovieTextView(property: "Year:", text: movie.year)
                            MovieTextView(property: "Rated:", text: movie.rated)
                            MovieTextView(property: "Runtime:", text: movie.runtime)
                            MovieTextView(property: "IMBD Rating:", text: movie.imdbRating)
                            
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    
                    Divider()
                        .padding(.top)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        MovieTextView(property: "Genre:", text: movie.genre)
                        MovieTextView(property: "Plot:", text: movie.plot)
                        MovieTextView(property: "Actors:", text: movie.actors)
                        MovieTextView(property: "Director:", text: movie.director)
                        MovieTextView(property: "Writer:", text: movie.writer)
                        MovieTextView(property: "Language:", text: movie.language)
                        MovieTextView(property: "Country:", text: movie.country)
                        MovieTextView(property: "Released:", text: movie.released)
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .navigationBarTitle("") //this must be empty
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MovieTextView: View {
    
    var property: String
    var text: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(property)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(text ?? "-")
                .padding(.bottom, 5)
        }
    }
}
