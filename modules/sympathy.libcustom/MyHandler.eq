public class MyHandler : HTTPRequestHandler
{
	Array sender;
	Array message;
//	String htmlz = "";
	int i;
	int ctr = -1;

	public void post(HTTPRequest req) {
        var data = req.get_body_json_hash_table();
        if(data != null){
			ctr++;
			if(ctr > 0){
			sender.add(data.get_string("sender"));
			message.add(data.get_string("message"));
			}
			else {
				var temp1 = Array.create();
					temp1.add(data.get_string("sender"));
				var temp2 = Array.create();
					temp2.add(data.get_string("message"));
				sender = temp1;
				message = temp2;
			}
		}
    
                req.send_json(HashTable.create().set("status", "OK"));
}
	public void get(HTTPRequest req) {
		var out = HashTable.create();
			out.set("messagearr",message);
			out.set("senderarr",sender);
		req.send_json(out);
	}
//	public void htmlcreate() {
//		htmlz = "";
//		for(i = 0; i <= ctr; i++) {
//			htmlz = htmlz.append("<p>")
//			htmlz = htmlz.append(sender.get(i) as String);
//			htmlz = htmlz.append(": ");
//			htmlz = htmlz.append(message.get(i) as String);
//			htmlz = htmlz.append("</p>");
//		}
//	}
}