//
//  ContentView.swift
//  SideMenu
//
//  Created by Vikram Chaudhary on 23/05/21.
//

import SwiftUI

var menuItems = ["Home", "Settings", "Privacy Policy", "About Us", "Contact Us", "Logout"]
struct ContentView: View {
    
    @State var show: Bool = false
    @State var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            (show ? Color.black.opacity(0.05) : Color.white)
                .edgesIgnoringSafeArea(.all).animation(.default)
            ZStack(alignment:.leading) {
                VStack(alignment: .leading, spacing: 20) {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    
                    VStack(spacing: 8) {
                        ForEach(0..<menuItems.count) { index in
                            Button(action: {
                                currentIndex = index
                                show.toggle()
                            }, label: {
                                ZStack {
                                    if currentIndex == index {
                                        Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
                                            .frame(width: UIScreen.main.bounds.size.width * 0.63, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                                            
                                        Text(menuItems[index])
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    } else {
                                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                                                .frame(width: UIScreen.main.bounds.size.width * 0.63, height: 50)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                                        
                                        Text(menuItems[index])
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                    }
                                }
                            }).foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                }.padding(.leading)
                .padding(.top)
                .animation(.spring())
                
                MainView(show: $show, currentIndex: $currentIndex)
                    .scaleEffect(show ? 0.8 : 1)
                    .offset(x: show ? UIScreen.main.bounds.size.width * 0.6 : 0)
                    .animation(.spring())
                    .shadow(color: show ? .black.opacity(0.3) : .clear, radius: 10, x: 5, y: 0)
                    .disabled(show ? true : false)
            }
        }.onTapGesture {
            if show {
                show = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    @Binding var show: Bool
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.horizontal, 8)
                    })
                    
                    Spacer()
                }
                
                Text(menuItems[currentIndex])
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.vertical, 10)
            
            ZStack {
                switch currentIndex {
                case 0:
                    HomeView()
                case 1:
                    SettingsView()
                case 2:
                    PrivacyView()
                case 3:
                    AboutView()
                case 4:
                    ContactView()
                case 5:
                    HomeView()
                default:
                    Text("")
                }
            }
        }.background(Color.white).cornerRadius(show ? 15 : 0)
    }
}


struct HomeView: View {
    var body: some View {
        ScrollView {
            Text("Design your home screen here")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        ScrollView {
            Text("Design your settings screen here")
        }
    }
}

struct PrivacyView: View {
    var body: some View {
        ScrollView {
            Text("Design your privacy policy screen here")
        }
    }
}

struct AboutView: View {
    var body: some View {
        ScrollView {
            Text("Design your About us screen here")
        }
    }
}

struct ContactView: View {
    var body: some View {
        ScrollView {
            Text("Design your Contact us screen here")
        }
    }
}
