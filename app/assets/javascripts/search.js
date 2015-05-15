function Search(subParam, resultForm, controller, functionName){
    var substringVar = document.getElementById("query").value;
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4) {
            if (this.status == 200) {
                var search_json = JSON.parse(this.responseText);
                var search_html = "<p>Search Results</p>"
                search_html += "<ul>"
                for (var i = 0; i < search_json.length; i++) {
                    search_json[i].photo_id
                    search_html += "<li>" + search_json[i].comment + "</li>"
                }
                search_html += "</ul>"
                for (var i = 0; i < search_json.length; i++) {
                    var source = "/assets/" + search_json[i].file_name 
                    search_html += "<a> <img src = " + source + " ></a>"; 
                }
                
                document.getElementById("result").innerHTML = search_html;
                }
            }
        }
        xhr.open("GET", "/users/filter?substring=" + substringVar);
        xhr.send();
    return false; 
}