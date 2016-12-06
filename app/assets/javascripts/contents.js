// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// // #
// $(document).on 'turbolinks:load', ->
//   $('#quiztimer').countdown
//     until: gon.time * 60
//     format: 'HMS'
//   return

// $(document).on('turbolinks:load', function() {
//   $('#quiztimer').countdown({
//     until: gon.time * 60,
//     format: 'HMS'
//   });
// });
var timeleft = 0;
function starttimer()
{
  var stopelem = document.getElementById("start");
  //var stopelem1 = document.getElementById("start1");
  if(stopelem.value=="Start Test")
  {
    $('#quiztimer').countdown({
      until: gon.time * 60,
      format: 'HMS'
    });
    document.getElementById("quiztimer").style.display = "";
    document.getElementById("pause").style.display = "";
    var stopelem = document.getElementById("start");
    stopelem.value="Stop";
    document.getElementById("link_to").style.display = "None";
    //document.getElementsById("start").remove;
    document.getElementById("start").style.visibility = "hidden";
    document.getElementById("finish").style.visibility = "hidden";
    document.getElementById("stop").type = "submit";
    
  }
  else
    {
    stoptimer();
    }
}
function pausetimer()
{
  var pauseelem = document.getElementById("pause");
  var stopelem = document.getElementById("start");
  if(pauseelem.value=="Pause"&&stopelem.value=="Stop")
  {
    var ans = confirm("Do you want to take a break ?");
    if(ans)
    {
      $('#quiztimer').countdown('pause');
      pauseelem.value = "Continue";
    }
  }
  else
  {
    continuetimer();
  }
}
function continuetimer()
{
// alert("In continue");
var pauseelem = document.getElementById("pause");
if(pauseelem.value=="Continue")
  $('#quiztimer').countdown('toggle');
pauseelem.value = "Pause";
}
function stoptimer()
{
  //alert("Stop Please");
  var ans = confirm("Do you want to quit ?");
  if(ans)
  {
    $('#quiztimer').countdown('pause');
    timeleft = $('#quiztimer').countdown('getTimes');
    if(timeleft)
    {
      //alert("idar hu");
      //alert(value)
      min = timeleft[4]*60+timeleft[5];
      //alert(min)
      //alert(timeleft[6])
      //alert(gon.contentid)
      if(timeleft[6]>30)
      min++
      //alert(min)
      window.open(gon.contentid+"?&min="+min,"_self");
      document.getElementById("finish").style.visibility = "";
      //document.getElementById("end").type = "submit";

    }
  }
}
