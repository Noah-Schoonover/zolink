function allocate_field() {
    //console.log(parseInt(id) + 1);
    var forms = document.getElementById("formList").children;
    var number_of_forms = forms.length;
//    var incremented_id = (parseInt(previous_form_id) + 1).toString();

    // Create the last field (formatted without delete button)
    function create_last_field() {

        var li = document.createElement("LI");
        li.className = "list-group-item";
        // Assign the new field's id to its index after it will be appended as child.
        li.id = (number_of_forms).toString();

        var input = document.createElement("input");
        input.type = "text";
        input.placeholder = "Enter some info";
        input.size = "24";
        input.addEventListener("keyup", allocate_field);

        li.appendChild(input);

        document.getElementById("formList").appendChild(li);
    }

    // Reformat the previous form to include a delete button
    function reformat_previous_form() {

        //IDEA: should this function call remove_empty_fields?
        //
        //store previous value
        var field_value = forms[number_of_forms - 2].firstElementChild.value;

        //create new element
        var li = document.createElement("LI");
        li.className = "list-group-item";
        li.id = forms[number_of_forms - 2].id;

        var input = document.createElement("input");
        input.type = "text";

        input.addEventListener("keyup", allocate_field);
        input.value = field_value;

        var a = document.createElement("a");
        a.href = "#";

        var img = new Image();
        img.src = "assets/dash-circle.svg";
        img.width = "25";
        img.style = "margin-left: 10px; margin-top: -5px";
        img.addEventListener("click", function(){
            var parent = this.parentElement;
            remove_field(parent.parentElement);
        });


        a.appendChild(img);
        li.appendChild(input);
        li.appendChild(a);


        previous_form = forms[number_of_forms - 2];
        previous_form.parentElement.replaceChild(li, previous_form);
    }

    // If the last form is not empty, append another form as a child to formList
    if(forms[number_of_forms - 1].firstElementChild.value !== "") {

        // If the previous form not default one including delete button, update
        if(number_of_forms - 1 >= 2){
            reformat_previous_form();
        }

        create_last_field();
    }
}

function remove_empty_fields(){
    var forms = document.getElementById("formList").children;
    var number_of_forms = forms.length;

    for (var i = 0; i < number_of_forms -1 ; i++) {
        if(forms[i].firstElementChild.value === "") {
            forms[i].remove();

            // Recursive call as temporary fix;
            // Not all remove when consecutive empty fields
            remove_empty_fields();
        }
    }

}

// Create function to remove feild upon button press
function remove_field(element){
    element.parentElement.removeChild(element);
}