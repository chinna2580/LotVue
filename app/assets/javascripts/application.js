// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
function showHideRoles(){
	$('#hide_roles_div').show()
}

function show_all_users(){
	$("#show_all_users > tbody").html('')
	$.ajax({

    url : '/users/show_all_users',
    type : 'GET',
    dataType: 'json',
    success : function(data) {
       //alert('success: '+data);
       //console.log(data)
       for(var i = 0; i< data.length; i++){

       console.log(data[i])
       newRowContent = "<tr>"+ "<td>"+ data[i].first_name +"</td>"+ "<td>"+ data[i].last_name +"</td>"+ "<td>"+ data[i].email +"</td>"
       $("#show_all_users > tbody").append(newRowContent);
       }
    }
    // ,
    // error : function(request,error)
    // {
    //     alert("Request: "+JSON.stringify(request));
    // }
});

}

function addAddressField() {

    //create Date object
    var date = new Date();

    //get number of milliseconds since midnight Jan 1, 1970
    //and use it for address key
    var mSec = date.getTime();

    //Replace 0 with milliseconds
    idAttributKind =
          "person_addresses_attributes_0_kind".replace("0", mSec);
    nameAttributKind =
          "person[addresses_attributes][0][kind]".replace("0", mSec);

    idAttributStreet =
          "person_addresses_attributes_0_street".replace("0", mSec);
    nameAttributStreet =
          "person[addresses_attributes][0][street]".replace("0", mSec);

    //create <li> tag
    var li = document.createElement("li");

    //create label for Kind, set it's for attribute,
    //and append it to <li> element
    var labelKind = document.createElement("label");
    labelKind.setAttribute("for", idAttributKind);
    var kindLabelText = document.createTextNode("Kind");
    labelKind.appendChild(kindLabelText);
    li.appendChild(labelKind);

    //create input for Kind, set it's type, id and name attribute,
    //and append it to <li> element
    var inputKind = document.createElement("INPUT");
    inputKind.setAttribute("type", "text");
    inputKind.setAttribute("id", idAttributKind);
    inputKind.setAttribute("name", nameAttributKind);
    li.appendChild(inputKind);

    //create label for Street, set it's for attribute,
    //and append it to <li> element
    var labelStreet = document.createElement("label");
    labelStreet.setAttribute("for", idAttributStreet);
    var streetLabelText = document.createTextNode("Street");
    labelStreet.appendChild(streetLabelText);
    li.appendChild(labelStreet);

    //create input for Street, set it's type, id and name attribute,
    //and append it to <li> element
    var inputStreet = document.createElement("INPUT");
    inputStreet.setAttribute("type", "text");
    inputStreet.setAttribute("id", idAttributStreet);
    inputStreet.setAttribute("name", nameAttributStreet);
    li.appendChild(inputStreet);

    //add created <li> element with its child elements
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(li);

    //show address header
    $("#addressHeader").show();
}