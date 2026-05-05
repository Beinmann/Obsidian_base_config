<%*
let value;
do {
  value = await tp.system.prompt("Enter a number (0–100)");
} while (
  value === null ||
  value === "" ||
  isNaN(value) ||
  !Number.isInteger(Number(value)) ||
  Number(value) < 0 ||
  Number(value) > 100
);

tR += '<span class="progress" style="--p:' + value + ';"></span>'
%>