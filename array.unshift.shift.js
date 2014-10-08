var list = [],
    size = parseInt(process.argv[2]);


for (var i = 0; i < size; i += 1) {
  list.unshift(i);
}

for (i = 0; i < size; i += 1) {
  list.shift();
}