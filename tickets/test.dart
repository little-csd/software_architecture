void main() {
	var data = Map();
	data['id'] = 1;
	data['pwd'] = 'fad';
	data['v'] = false;

	var newData = Map();
	newData['id'] = 3;
	newData['pwd'] = null;
	data.addAll(newData);
	
	print(data);

	print({'id':1}.runtimeType);
}
