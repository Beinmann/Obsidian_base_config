<%*
// I got this function from ChatGPT. It works for now but it might break. Actually understand it now and it seems pretty good. Also taught me some things about Templater like how tR is the template return variable or how you can append a "0" character and then take the last 2 characters to append a 0 if needed to a string
const date = new Date();
date.setHours(date.getHours() - 8);
const day = ("0" + date.getDate()).slice(-2);
const month = ("0" + (date.getMonth() + 1)).slice(-2); // +1 because months are zero indexed
const year = date.getFullYear();
const formattedDate = day + "." + month + "." + year;
tR += formattedDate;
%>