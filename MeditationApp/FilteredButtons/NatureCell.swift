//
//  NatureCell.swift
//  MeditationApp
//
//  Created by mak on 28.03.2023.
//

import SwiftUI

struct NatureCell: View {
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                
            } label: {
                
                NavigationLink {
                    MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data))
                } label: {
                    Image("fire")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .background(Color(red: 31/255, green: 141/255, blue: 239/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: 120, height: 120)
                        .padding(.top, 75)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                }
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                
                NavigationLink {

                } label: {
                    Image("waterfall")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .background(Color(red: 31/255, green: 141/255, blue: 239/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: 120, height: 120)
                        .padding(.top, 75)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                }
                
            }
            Spacer()
        }
        
        HStack {
            
            Spacer()
            
            Button {
                
            } label: {
                
                NavigationLink {
                    
                } label: {
                    Image("forest")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .background(Color(red: 31/255, green: 141/255, blue: 239/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: 120, height: 120)
                        .padding(.top, 75)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                }
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                
                NavigationLink {
                   
                } label: {
                    Image("city")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .background(Color(red: 31/255, green: 141/255, blue: 239/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: 120, height: 120)
                        .padding(.top, 75)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                }
                
            }
            Spacer()
        }
        
        HStack {
            
            Spacer()
            
            Button {
                
            } label: {
                
                NavigationLink {
                    
                } label: {
                    Image("bird")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .background(Color(red: 31/255, green: 141/255, blue: 239/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: 120, height: 120)
                        .padding(.top, 75)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                }
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                
                NavigationLink {
                   
                } label: {
                    Image("classic")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .background(Color(red: 31/255, green: 141/255, blue: 239/255))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: 120, height: 120)
                        .padding(.top, 75)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                }
                
            }
            Spacer()
        }

    }
}

struct NatureCell_Previews: PreviewProvider {
    static var previews: some View {
        NatureCell()
    }
}
