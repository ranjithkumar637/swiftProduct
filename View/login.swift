import SwiftUI

struct HomeView: View {
    @State var loginDetail:LoginViewModel = LoginViewModel()
    
    var body: some View {
       
        VStack{
            Text("Login")
                .font(.system(.title))
                .fontWeight(.bold)
            FieldLogin(field: $loginDetail.email, title:"User Name", hint:"Name")
            FieldLogin(field: $loginDetail.password, title:"Password", hint:"******")
            
            Button("Login"){
                print("Login")
            }
            .padding(.vertical,10)
            .padding(.horizontal,40)
            .background(
                RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.7)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .disabled(!loginDetail.isFormValid)
        }
        
        Text("I don't have account")
            .font(.default)
            .foregroundStyle(.blue)
   
    }}


struct FieldLogin:View{
    @Binding var field:String
    var title:String
    var hint:String
    
    var body : some View{
        VStack(alignment: .leading){
            Text(title)
                .font(.title3)
           HStack {
                FieldDecide(field: $field, hint: hint, isPassword:title=="Password" )
               
               
            }
            
//            TextField(hint, text: $field)
//                .padding(.horizontal,10)
//                .padding(.vertical,15)
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.gray.opacity(0.1))
//                )
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(.gray.opacity(0.4), lineWidth: 1)
//                )
                
        }.padding(.horizontal,20)
            .padding(.vertical,10)
    }
}

struct FieldDecide:View{
    @Binding var field:String
    @State var isVisible:Bool = false
    var hint:String
    var isPassword : Bool = false
    
    var body : some View{
        Group{
            
            if !isPassword{
                TextField(hint, text: $field).loginTextField()
            }
            else {
                HStack{
                    if !isVisible{
                        TextField(hint, text: $field)
                    }else{
                        SecureField("***", text: $field)
                                           
                    }
                    Button {
                        isVisible.toggle()
                        } label: {
                            Image(systemName: isVisible ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                }.loginTextField()
                
            }

            
        }}}




#Preview {
    HomeView()
}
