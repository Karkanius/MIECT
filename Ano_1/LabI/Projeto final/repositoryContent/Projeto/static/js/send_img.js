function sendFile(file) {
var data = new FormData();
data.append("myFile", file);
var xhr = new XMLHttpRequest();
xhr.open("POST", "upload");
xhr.upload.addEventListener("progress", updateProgress, false);
xhr.send(data);
}
function updateProgress(evt){
if(evt.loaded == evt.total)
alert("OK!");
}
function updatePhoto(evt){
...
sendFile(image[0]);
//Libertar recursos da imagem seleccionada
windowURL.revokeObjectURL(picURL);
}