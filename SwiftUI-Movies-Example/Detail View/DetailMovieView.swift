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
                            
                            if let rated = movie.rated {
                                MovieTextView(property: "Rated:", text:rated)
                            } else {
                                MovieTextView(property: "Rated:", text: "-")
                            }
                            
                            if let runtime = movie.runtime {
                                MovieTextView(property: "Runtime:", text: runtime)
                            } else {
                                MovieTextView(property: "Runtime:", text: "-")
                            }
                            
                            if let imdbRating = movie.imdbRating {
                                MovieTextView(property: "IMBD Rating:", text: imdbRating)
                            } else {
                                MovieTextView(property: "IMBD Rating::", text: "-")
                            }
                        }
                        .padding(.leading)
                        Spacer()
                    }

                    Divider()
                        .padding(.top)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        if let genre = movie.genre {
                            MovieTextView(property: "Genre:", text: genre)
                        } else {
                            MovieTextView(property: "Genre:", text: "-")
                        }
                                                
                        if let plot = movie.plot {
                            MovieTextView(property: "Plot:", text: plot)
                        } else {
                            MovieTextView(property: "Plot:", text: "-")
                        }
                        
                        if let actors = movie.actors {
                            MovieTextView(property: "Actors:", text: actors)
                        } else {
                            MovieTextView(property: "Actors:", text: "-")
                        }

                        if let director = movie.director {
                            MovieTextView(property: "Director:", text: director)
                        } else {
                            MovieTextView(property: "Director:", text: "-")
                        }

                        if let writer = movie.writer {
                            MovieTextView(property: "Writer:", text: writer)
                        } else {
                            MovieTextView(property: "Writer:", text: "-")
                        }
                        
                        if let language = movie.language {
                            MovieTextView(property: "Language:", text: language)
                        } else {
                            MovieTextView(property: "Language:", text: "-")
                        }
                        
                        if let country = movie.country {
                            MovieTextView(property: "Country:", text: country)
                        } else {
                            MovieTextView(property: "Country:", text: "-")
                        }

                        if let released = movie.released {
                            MovieTextView(property: "Released:", text: released)
                        } else {
                            MovieTextView(property: "Released:", text: "-")
                        }
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

    @State var property: String
    @State var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(property)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(text)
                .padding(.bottom, 5)
        }
    }
}
