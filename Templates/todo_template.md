#todo_entry_dataview

### Updates and Comments

### Related Pages (if any)

stars:: <%* 

	 // Select the number of stars
	 let numStars = ""
	 numStars = await tp.system.prompt("Number of Stars (1-5)", "");

	let starString = "⭐".repeat(numStars);
%><% starString%>
length:: 
done:: 0
barrier:: 
backlog:: 

date:: <% tp.date.now() %>
due_date::
completed_on::
- format YYYY-MM-DD
