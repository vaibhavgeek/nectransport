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
  	$("#messages").append(data.content + "<br/><br/>");	
  	$("#message_content").val(" ");
  	console.log(data);
    // Called when there's incoming data on the websocket for this channel
  }
});
