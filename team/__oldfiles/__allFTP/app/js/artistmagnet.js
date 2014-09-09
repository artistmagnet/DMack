/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var forCompany = new Array("companyName", "foundedYear");

var forArtist = new Array("firstName", "lastName", "birthday");

$(document).ready(function(){
    $('#inviteForm').submit(function(){
        $('#sendInvite').val('Sending...');
        $.get('doInvite.jsp', $('#inviteForm').serialize(),function(data) {        
            $('#sendInvite').val('Send Invitations');
            alert('Your Invitations have been sent!');
        });
        return false; 
    });
});
    


function accountTypeChecker(checkerValue) {

    hideDynamicFields();

    if (checkerValue == 5) {

        for (x in forCompany) {

            document.getElementById(forCompany[x]).style.display = "block";

        }

    } else {

        for (x in forArtist) {

            //document.getElementById(forArtist[x]).style.display = "block";

            }

    }

}



function hideDynamicFields() {

    var dynamicFields = new Array("firstName", "lastName", "companyName", "birthday", "foundedYear");

    for (x in dynamicFields) {

        //   document.getElementById(dynamicFields[x]).style.display = "none";

        }

}





function checkDate(that, path, name) {

    var year = document.getElementById(path + "_" + "year").selectedIndex;

    var month = document.getElementById(path + "_" + "month").selectedIndex;

    var day = document.getElementById(path + "_" + "day").selectedIndex;

    if (year != 0) {

        year += 3;

    }

    if (!correctDate(year, month, day)) {

        if (name == "month") {

            document.getElementById(path + "_" + "day").selectedIndex = 0;

        } else if (name == "day" || name == "year") {

            document.getElementById(path + "_" + "month").selectedIndex = 0;

        }

    }



}



function correctDate(year, month, day) {

    var monthList = new Array(31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

    if (month < 12) {

        if (monthList[month] < day) {

            if (month == 2) {

                if (year % 4 == 0) {

                    if (day > 29) {

                        return false;

                    }

                }

                else if (day > 28) {

                    return false;

                }

            } else {

                return false;

            }

        }

    }

    return true;

}



$(document).ready(function() {

    hideDynamicFields();

    for (x in forArtist) {

        // document.getElementById(forArtist[x]).style.display = "block";

        }

    showAccountTypes();

/*accountTypeChecker(document.getElementById("accountTypeId").value);

    if (document.getElementById("accountTypeName").value != "" && document.getElementById("accountTypeId").value > 0

        && document.getElementById("accountTypeId").value <= 5) {

        document.getElementById("accountTypeNameSpan").innerHTML = "  " + document.getElementById("accountTypeName").value;

    } else {

        document.getElementById("accountTypeId").value = 0;

    }


*/
});



function showAccountTypes() {



    var myMenu = {
        "options": [


        {
            "name": "Artist", 
            "customOptions": "Actors, Directors, Designers, etc."
        },


        {
            "name": "Production/Management", 
            "customOptions": "Producers, Stage Managers, Technical Directors, etc."
        },


        {
            "name": "Representative", 
            "customOptions": "Agents, Managers, Publicists, etc."
        },


        {
            "name": "Fan", 
            "customOptions": "Fans and patrons of the arts, artists, etc."
        },


        {
            "name": "Company", 
            "customOptions": "Production Companies, Arts Related Businesses, Affiliate Organizations, etc."
        }

        ]

    };



    var options = document.createElement("div");

    options.className = "accountTypesOptions";

    options.id = "accountTypesOptions";



    for (x in myMenu.options) {

        var option = document.createElement("div");

        option.innerHTML = "  " + myMenu.options[x].name;

        option.customOptions = createCustomOptions(myMenu.options[x].customOptions);

        option.rollId = ++x;



        option.onmouseover = function() {

            this.style.background = "#3c7dd0";

            this.style.color = "white";

            this.customOptions.style.display = "block";

        }



        option.onmouseout = function() {

            this.style.background = "white";

            this.style.color = "black";

            this.customOptions.style.display = "none";

        }



        option.onclick = function() {

            submitAccountType(this.rollId, this.innerHTML);

        }



        options.appendChild(option);



    }



// document.getElementById("accountTypes").appendChild(options);

}



function createCustomOptions(customRoles) {

    var customOptions = document.createElement("div");

    customOptions.className = "customOptions";

    customOptions.innerHTML = customRoles;

    customOptions.style.display = "none";

    // document.getElementById("accountTypes").appendChild(customOptions);

    return customOptions;

}





function submitAccountType(rollId, rollName) {

    document.getElementById("accountTypeId").value = rollId;

    document.getElementById("accountTypeNameSpan").innerHTML = rollName;

    document.getElementById("accountTypeName").value = rollName.substring(2);



    accountTypeChecker(rollId);



}



var accountTypeClick = false;

var accountDisplay = false;



$('#accountTypes').click(function() {

    accountTypeClick = true;

    if (document.getElementById("accountTypesOptions").style.display == "block") {

        document.getElementById("accountTypesOptions").style.display = "none";

        accountDisplay = false;

    } else {

        document.getElementById("accountTypesOptions").style.display = "block";

        accountDisplay = true;

    }

});



$('body').click(function() {

    if (accountTypeClick == true) {

        accountTypeClick = false;

    } else {

        if (accountDisplay == true) {

            document.getElementById("accountTypesOptions").style.display = "none";

        }



    }



});


