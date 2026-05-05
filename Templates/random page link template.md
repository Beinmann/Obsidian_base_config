<%*
const dv = app.plugins.plugins["dataview"]?.api;
if (!dv) {
  tR = "Dataview not available";
  return;
}

const pages = dv.pages()
	.where(p => 
	!p.file.path.startsWith("Templates")
	);
if (pages.length === 0) {
  tR = "No pages found";
  return;
}

const random = pages[Math.floor(Math.random() * pages.length)];
tR = `${random.file.link}`;
%>