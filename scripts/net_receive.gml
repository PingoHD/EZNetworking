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
clienttotal += 1;
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
clienttotal -= 1;
return "1";
break;
}

