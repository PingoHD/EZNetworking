#define net_create

server = network_create_server(argument0,argument1,argument2);
socket = noone;

clientid[0] = noone;
clientnumber = 0;
clientinfo[0,0] = noone;


#define net_recall
//Argument0: ClientId
//Argument1: Number

//If the variable is empty, it will output NOONE

var temporaryclientinfo = argument0;

return clientinfo[temporaryclientinfo,argument1];
 


#define net_save
//Binds a value to the client id


//Argument 0: ClientID
//Argument 1: Number
//Argument 2: Value
var temporaryclientinfo = argument0;
clientinfo[temporaryclientinfo,argument1] = argument2;
 


#define net_send
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



#define net_receive
var ntype = async_load[? "type"];
var nipad = async_load[? "ip"];
var nsocket = async_load[? "socket"];

switch (ntype)
{
case network_type_connect:
net_sendadvanced("A8A8",clientnumber,nsocket);
clientid[clientnumber] = nsocket;
socket = nsocket;
// NOTE: You can change preset to the number of variables of your choosing.
var preset = 5000;
for (i=0;i<preset;i++)
{
clientinfo[clientnumber,i] = noone;
}
clientnumber += 1; 
return "0";
break;
case network_type_data:
//Outputs variable you ask for.
var temporarybuffed1 = async_load[? "buffer"];
buffer_seek(temporarybuffed1,buffer_seek_start,0);
var sheepie = buffer_read(temporarybuffed1,buffer_string);

            if (argument0 == sheepie)
    {

if (buffer_read(temporarybuffed1,buffer_string) == "string")
{
return string(buffer_read(temporarybuffed1,buffer_string));
}
else if ("real")
{
return real(buffer_read(temporarybuffed1,buffer_string));
}
    }
    else if (sheepie = "A8A8")
    {
    var sheepie = buffer_read(temporarybuffed1,buffer_string);
    clientnum = real(buffer_read(temporarybuffed1,buffer_string));
    
    }
return noone;

break;
case network_type_disconnect:
return "1";
break;
}


#define net_connect
socket = network_create_socket(argument0);
server = network_connect(socket,argument1,argument2);
// It is basically a shortened version of network connect;


#define net_sendadvanced
//Advanced version, for servers only.

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
network_send_packet(argument2,tempbuff1,buffer_tell(tempbuff1));
buffer_delete(tempbuff1);

 
return true;


