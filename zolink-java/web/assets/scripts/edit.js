function allocate_field() {
    //console.log(parseInt(id) + 1);
    var forms = document.getElementsByClassName("zolink-info-field");
    var number_of_forms = forms.length;
//    var incremented_id = (parseInt(previous_form_id) + 1).toString();

    // Create the last field (formatted without delete button)
    function create_last_field() {

        var list_group_item = document.createElement("div");
        list_group_item.className = "list-group-item";

		var row = document.createElement("div");
        row.className = "row";
		list_group_item.appendChild(row);

		var col_11 = document.createElement("div");
        col_11.className = "px-0";
		col_11.id = "inputColumn";
		row.appendChild(col_11);

		var input = document.createElement("input");
        input.type = "text";
        input.className = "w-100 zolink-info-field";
		input.name = (parseInt(forms[number_of_forms -1].name) + 1).toString();
        input.addEventListener("keyup", allocate_field);
        input.placeholder = "Enter some info";
		col_11.appendChild(input);

		var col_1 = document.createElement("div");
        col_1.className = "px-0";
		col_1.id = "minusColumn";
		row.appendChild(col_1);

        document.getElementById("zolink-list-group").appendChild(list_group_item);
    }

    // Reformat the previous form to include a delete button
    function reformat_previous_form() {

        var a = document.createElement("a");
        a.href = "#";

        var img = new Image();
        img.src = "/assets/images/dash-circle.svg";
        img.width = "25";
        img.style = "margin-left: 10px; margin-top: -5px";
        img.onclick = function() {
			remove_field(this);
			return false;
		}

        a.appendChild(img);

        previous_form = forms[number_of_forms - 1];
		var inputColumn = previous_form.closest("#inputColumn");
		inputColumn.className = "col-11 px-0";

		var minusColumn = inputColumn.nextElementSibling;
		minusColumn.className = "col-1 px-0";
		minusColumn.appendChild(a);

    }

	console.log(forms);
	console.log(number_of_forms);

    // If the last form is not empty, append another form as a child to formList
    if(forms[number_of_forms - 1].value !== "") {

        // If the previous form not default one including delete button, update
        if(number_of_forms >= 1){
            reformat_previous_form();
        }

        create_last_field();
    }
}

function remove_empty_fields(){
    var forms = document.getElementById("formList").children;
    var number_of_forms = forms.length;

    for (var i = 0; i < number_of_forms -1 ; i++) {
        if(forms[i].value === "") {
            forms[i].remove();

            // Recursive call as temporary fix;
            // Not all remove when consecutive empty fields
            remove_empty_fields();
        }
    }

}

// Create function to remove feild upon button press
function remove_field(element){
    element.closest(".list-group-item").remove();
	return false;
}
