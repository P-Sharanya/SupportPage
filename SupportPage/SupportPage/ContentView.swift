//
//  ContentView.swift
//  SupportPage
//
//  Created by next on 10/02/26.
//

import SwiftUI

struct SupportPerson: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let image: String
}
struct SupportView: View {

    let coordinator = SupportPerson(
        name: "Naveen Kumar P",
        role: "International Source of authority",
        image: "Pics 8"
    )

    let mentors: [SupportPerson] = [
        SupportPerson(name: "Sankar Rao Gone", role: "International Source of authority", image: "Pics 9"),
        SupportPerson(name: "Anjali C.K", role: "International Source of authority", image: "Pics 6"),
        SupportPerson(name: "Arun Balaji M", role: "International Source of authority", image: "Pics 3"),
        SupportPerson(name: "Sudharsan S", role: "International Source of authority", image: "Pics 5"),
        SupportPerson(
            name: "Naveen Kumar P",
            role: "International Source of authority",
            image: "Pics 8")
    ]

    init() {
           let appearance = UINavigationBarAppearance()
           appearance.configureWithOpaqueBackground()
           appearance.backgroundColor = .white
           appearance.shadowColor = .clear

           UINavigationBar.appearance().standardAppearance = appearance
           UINavigationBar.appearance().scrollEdgeAppearance = appearance
       }
    
    var body: some View {
        ZStack(alignment: .bottom) {

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {

                    headerView

                    coordinatorSection

                    mentorsSection

                    Spacer(minLength: 90)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
        }
        .background(Color(hex: "#F8FAFC"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color(hex: "#476AA2"))
                        .frame(width: 32, height: 32)
                        .cornerRadius(8)
                        .overlay(
                            Image("Group 87492")
                                .foregroundColor(Color(hex: "#F8FAFC"))

                                .frame(width: 24, height: 24)
                        )
                    Text("Support")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(hex: "#000000"))
                }
            }
        }
        .safeAreaInset(edge: .bottom, content: {
            bottomHelpBar
        })
        
    }
}

extension SupportView {

    var headerView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hello Srinivas Reddy!")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "#18181A"))

            Text("Lorem ipsum is a dummy text will be replaced with original Content.")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color(hex: "#647388"))
        }
    }

    var coordinatorSection: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text("Your Coordinator")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(hex: "#304F72"))
            
            SupportCardView(person: coordinator)
        }
    }

    var mentorsSection: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Your Mentors")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(hex: "#304F72"))

            ForEach(mentors) { mentor in
                SupportCardView(person: mentor)
            }
        }
    }
}
struct SupportCardView: View {

    let person: SupportPerson

    var body: some View {
        HStack(spacing: 12) {

            Image(person.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(person.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(hex: "#000000"))
                
                Text(person.role)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: "#3C5777"))
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "phone.fill")
                    .foregroundColor(Color(hex: "#F8FAFC"))
                    .frame(width: 38, height: 38)
                    .background(Color(hex: "#30558E"))
                    .clipShape(Circle())
            }
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "#F0F4F7"), lineWidth: 1)
                )
        )
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
    }
}
extension SupportView {

    var bottomHelpBar: some View {
        HStack(spacing: 12) {

            Image("Headphones")
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Rectangle())

            VStack(alignment: .leading, spacing: 4) {
                Text("Need help? Contact Us")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(hex: "#FEFEFE"))

                Text("9 AM - 6 PM")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(hex: "#FEFEFE"))
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "phone.fill")
                    .foregroundColor(Color(hex: "#30558E"))
                    .frame(width: 36, height: 36)
                    .background(Color(hex: "#FFFFFF"))
                    .clipShape(Circle())
            }

            Button(action: {}) {
                Image(systemName: "envelope.fill")
                    .foregroundColor(Color(hex: "#30558E"))
                    .frame(width: 36, height: 36)
                    .background(Color(hex: "#FFFFFF"))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 14)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "#58A5D5"))
    }
}

extension Color {

    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64

        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b) = (
                (int >> 16) & 0xFF,
                (int >> 8) & 0xFF,
                int & 0xFF
            )
        default:
            (r, g, b) = (0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: opacity
        )
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
