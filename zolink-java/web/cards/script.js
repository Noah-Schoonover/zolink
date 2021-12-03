
function getWorkExperience() {

  var xhttp = new XMLHttpRequest();

  xhttp.onreadystatechange = function() {

    if (this.readyState != 4 || this.status != 200) {
      document.getElementById("work-experience").innerHTML = "error";
      return;
    }

    var xmlDoc = this.responseXML;

    // add section heading
    var html = "<h3>Work Experience</h3>";

    // retrieve all work experience entries from the response
    var x = xmlDoc.getElementsByTagName("company");

    // add company data for each company tag
    for (var i = 0; i < x.length; i++) {
      html = html
        + "<ul>"
        + "<li>"
        + "<strong>"
        + x[i].getElementsByTagName("company-name")[0].childNodes[0].nodeValue
        + "</strong>"
        + "<ul>"
        + "<li>"
        + x[i].getElementsByTagName("dates")[0].childNodes[0].nodeValue
        + "</li>"
        + "<li>"
        + x[i].getElementsByTagName("location")[0].childNodes[0].nodeValue
        + "</li>"
        + "<li>"
        + x[i].getElementsByTagName("description")[0].childNodes[0].nodeValue
        + "</li>"
        + "<li>Achievements / Tasks</li><ul>";

      // add list elements for each task
      var tasks = x[i].getElementsByTagName("task");
      for (var j = 0; j < tasks.length; j++) {
        html = html
          + "<li>"
          + tasks[j].childNodes[0].nodeValue
          + "</li>";
      }

      html = html + "</ul></ul></li></ul>";

    }

    document.getElementById("work-experience").innerHTML = html;

  };

  xhttp.open("GET", "https://weave.cs.nmt.edu/apollo14/noah_hw6/GetWorkExperience", true);
  xhttp.send();
}
