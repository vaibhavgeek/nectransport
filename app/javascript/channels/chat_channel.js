import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
  	console.log("I am connected to the channel");
  	    // Called when the subscription is ready for use on the server
  },

  disconnected() {
  	console.log("I am not connected to this channel");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if(data.content == "1" /* request_recieved */){

      $('#myModal').modal('show');
       if($("#userinfo").text().trim() == data.userid)
       {
        $("#myinfo").show();
        $("#yourinfo").hide();
       }
       else
       {
        $("#myinfo").hide();
        $("#yourinfo").show();
       }

    }
    else if (data.content == "2" /* accept */) {
      $('#myModal').modal('hide');
      $('#abc').hide();
      var nname = data.name;
      if($("#userinfo").text().trim() == data.userid)
      {
        $("#route").text("Route: Hauz Khauz to MG Road")
        $("#timing").text("Time: 10:00am Boarding");

        nname = "Ujjawal Kumar"
      }
      else
      {
        $("#route").text("Route: IGI Airport to MG Road")
        $("#timing").text("Time: 10:10am Boarding");

      }
       $('#contactInfo').modal('show');
      $('#fname').text(nname);
      //alert("You are connected!");
    }
    else if (data.content == "3" /* reject */) {
        $('#myModal').modal('hide');
         $('#contactInfo').modal('hide');
     // alert("Request rejected!");
    }
    // else if (data.content == "4" /* close both */)
    // {
    //   $('#myModal').modal('toggle');
    // }
    else {
      if($("#userinfo").text().trim() != data.userid)
      {
          $("#messages").append("<section class='reci message'><section class='msg-box-rec'>"+ data.content +" </section></section>");
      }
      else
      {
          $("#messages").append("<section class='sent msg'><section class='msg-box-send'> "+ data.content +" </section></section>");
      }
      $('#messages').scrollTop($('#messages')[0].scrollHeight);
      $("#message_content").val(" ");
    	//console.log(data);
      // Called when there's incoming data on the websocket for this channel
    } 
  }
});
