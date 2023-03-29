//
//  MainView.swift
//  MeditationApp
//
//  Created by mak on 24.03.2023.
//

import SwiftUI

enum FilterOptions: Int, CaseIterable {
    case nature
    case city
    case more
    
    var title: String {
        switch self {
        case .nature: return "Природа"
        case .city: return "Город"
        case .more: return "Еще"
        }
    }
}

struct MainView: View {
    @Binding var selectedOption: FilterOptions
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(FilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(FilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ScrollView (showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(FilterOptions.allCases, id: \.self) { option in
                            Button(action: {
                                self.selectedOption = option
                            }, label: {
                                Text(option.title)
                                    .frame(width: underlineWidth - 8)
                                    .foregroundColor(.white)
                            })
                        }
                    }
                    
                    Rectangle()
                        .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.leading, padding)
                        .animation(.spring())

                }
                
                if selectedOption == .nature {
                    NatureCell()
                } else if selectedOption == .city {
                    
                    CityCell()
                    
                } else if selectedOption == .more {
                    
                    MoreCell()
                    
                } else {
                    Text("Nothing found")
                }
            }
        }
        .background {
            Color(red: 24/255, green: 23/255, blue: 22/255)
                .ignoresSafeArea(edges: .top)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedOption: .constant(.nature))
    }
}
