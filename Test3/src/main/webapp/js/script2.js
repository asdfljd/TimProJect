window.onload=function(){
    //var a = Date.now();//초
    var a= console.time();//시간 재기
    
    var i = document.getElementsByTagName("img")[0];
    console.log(i);
    var m = document.getElementsByTagName("ul")[1];
    var m2 = document.getElementsByTagName("ul")[2];
    console.log(m);
    /*i.addEventListener("click", function(){ 
        m.setAttribute("style", "display:block;");
        m2.setAttribute("style", "display:block;");
    });*/

    var fourty = 40;
    var a = new Date();

    
    var e = console.timeEnd()*60;
    console.log(e);

    var ti = document.getElementsByClassName("time")[0];
        //div 'time'
    console.log(ti);
    //div ti 보기


        
    var tim = document.createTextNode(60);
    //60이라는 텍스트 노드를 만든다.
    ti.appendChild(tim);
    //div에 넣는다.
    tim = toString(tim);
    //object를 문자로 변환
    tim = parseInt(tim);
    //문자를 숫자로 변환
    console.log(typeof(tim));
    //60.
    
    tim = 60; 
    //ti에 60 넣기(초)
    
    //console.log(typeof(tim));
    //document.body.appendChild(tim);
   
    setInterval(fun,1000)
    function fun(){
        tim--;
        //document.write(tim);
        console.log(tim);//60에서 1씩 빼기
        ti.innerHTML = tim;//교수님의 의견.
        if(tim<=0){
            tim = 60;
        }

        //DIV에 INNERHTML해서 숫자를 넣기.
    }    /*
        }*/
            //tim가 60이면. 안보이게 해주고 문자 0을 넣는다.

    //1초마다 실행
 











    /*function(){
        var ti = new Date();
        console.log(ti);
    };*/

    
}