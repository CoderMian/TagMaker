//
//  Home.swift
//  chips_tag_view
//
//  Created by devsaar on 28/06/2022.
//
import SwiftUI

struct Home: View {
    @State var text:String = ""
    @State var tags:[Tag] = []
    @State var showAlert: Bool = false
    var body: some View {
        
        VStack
        {
            Text("Filter \nMenus")
                .font(.system(size: 38,weight: .bold))
                .foregroundColor(Color("Tag"))
                .frame(maxWidth:.infinity,alignment:.leading)
            
            //Custom Tag View
            TagView(maxLimit: 150, tags: $tags)
                .frame(height:280)
                .padding(.top,20)
            //TextField....
            
            TextField("apple",text:$text)
                .font(.title3)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius:8)
                        .strokeBorder(Color("Tag").opacity(0.4),lineWidth: 1)
                )
            //setting only textfield as dark
                .environment(\.colorScheme,.dark)
                .padding(.vertical,18)
            //Add button
            Button
            {
                addTag(tags: tags, text: text, fontSize: 16, maxLimit:150)
                {
                    alert, tag in
                    if alert{
                        //show alert....
                        showAlert.toggle()
                    }
                    else
                    {
                        //adding tag
                        tags.append(tag)
                        text = ""
                    }
                }
                
                
            }label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("BG"))
                    .padding(.vertical,12)
                    .padding(.horizontal,45)
                    .background(Color("Tag"))
                    .cornerRadius(10)
            }
            .disabled(text == "")
            .opacity(text == "" ? 0.6 : 1)
        }.padding(15)
            .frame(maxWidth:.infinity, maxHeight:.infinity,alignment: .top)
            .background(
                Color("BG")
                    .ignoresSafeArea()
            )
            .alert(isPresented:$showAlert)
        {
            Alert(title: Text("Error"),message: Text("Tag Limit Exeeded try to delete some tags !!!"),dismissButton:.destructive(Text("OK")))
        }
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
