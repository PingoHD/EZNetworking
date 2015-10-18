// First argument detects the name of the variable you want to send, second determines the 
//value.


//DSLIST
//1. Variable name - MUST BE STRING
//2. Variable real or string
//3. Variable value

var tempbuff1 = buffer_create(1024,buffer_grow,1);
var temporaryconvert = string(argument0);
buffer_seek(tempbuff1,buffer_seek_start,0);
buffer_write(tempbuff1,buffer_string,temporaryconvert);
if (is_real(argument1))
{buffer_write(tempbuff1,buffer_string,"real")}
else
{ buffer_write(tempbuff1,buffer_string,"string")}
buffer_write(tempbuff1,buffer_string,string(argument1));
network_send_packet(server,tempbuff1,buffer_tell(tempbuff1));
buffer_delete(tempbuff1);

 
return true;


