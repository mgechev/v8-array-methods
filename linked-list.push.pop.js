var LinkedList =
    require('../../Projects/javascript-algorithms' +
   '/src/data-structures/linked-list').LinkedList,
  list = new LinkedList(),
  size = parseInt(process.argv[2]);


for (var i = 0; i < size; i += 1) {
  list.push(i);
}

for (i = 0; i < size; i += 1) {
  list.pop();
}