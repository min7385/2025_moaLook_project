/**
 * 
 */
$(document).ready(function(){
    let signup = $(".links").find("li").find("#signup") ; 
    let signin = $(".links").find("li").find("#signin") ;
    let reset  = $(".links").find("li").find("#reset")  ; 
    let first_input = $("form").find(".first-input");
    let name_input = $("form").find(".input__block").find("#name");
    let signin_btn  = $("form").find(".signin__btn");
    
    let form = $("form");
  
    //----------- sign up ---------------------
    signup.on("click",function(e){
      e.preventDefault();
      $(this).parent().parent().siblings("h1").text("회원가입");
      $(this).parent().css("opacity","1");
      $(this).parent().siblings().css("opacity",".6");
      first_input.removeClass("first-input__block").addClass("signup-input__block");
      name_input.css({
        "opacity" : "1",
        "display" : "block"
      });
      signin_btn.text("회원가입");
      
      // form 태그 동적으로 변경
      form.attr("action", "${pageContext.request.contextPath}/registDo");
    });
    
  
   //----------- sign in ---------------------
   signin.on("click",function(e){
      e.preventDefault();
      $(this).parent().parent().siblings("h1").text("로그인");
      $(this).parent().css("opacity","1");
      $(this).parent().siblings().css("opacity",".6");
      first_input.addClass("first-input__block")
        .removeClass("signup-input__block");
      name_input.css({
        "opacity" : "0",
        "display" : "none"
      });
      signin_btn.text("로그인");
      
      // form 태그 동적으로 변경
      form.attr("action", "${pageContext.request.contextPath}/loginDo");
    });
   
   //----------- reset ---------------------
   reset.on("click",function(e){
     e.preventDefault();
     $(this).parent().parent().siblings("form")
     .find(".input__block").find(".input").val("");
   })
});