<%*
const starting_chars = "adeinorux";
const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
let result = "";

function get_random_element(list) {
  return list.charAt(Math.floor(Math.random() * list.length));
}

function append_block_of_4_to_result() {
  result += "-";
  for (let i = 0; i < 4; i++) {
    result += get_random_element(chars)
  }
}

for (let i = 0; i < 4; i++) {
  result += get_random_element(starting_chars)
}
append_block_of_4_to_result()
append_block_of_4_to_result()

tR += result;
%>