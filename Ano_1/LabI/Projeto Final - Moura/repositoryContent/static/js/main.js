/*  _______  _______ _________ _             _______  _______  _______  _______  _______  _______  _______
 * (       )(  ___  )\__   __/( (    /|     (  ____ )(  ____ )(  ___  )(  ____ \(  ____ )(  ___  )(       )
 * | () () || (   ) |   ) (   |  \  ( |     | (    )|| (    )|| (   ) || (    \/| (    )|| (   ) || () () |
 * | || || || (___) |   | |   |   \ | |     | (____)|| (____)|| |   | || |      | (____)|| (___) || || || |
 * | |(_)| ||  ___  |   | |   | (\ \) |     |  _____)|     __)| |   | || | ____ |     __)|  ___  || |(_)| |
 * | |   | || (   ) |   | |   | | \   |     | (      | (\ (   | |   | || | \_  )| (\ (   | (   ) || |   | |
 * | )   ( || )   ( |___) (___| )  \  |     | )      | ) \ \__| (___) || (___) || ) \ \__| )   ( || )   ( |
 * |/     \||/     \|\_______/|/    )_)     |/       |/   \__/(_______)(_______)|/   \__/|/     \||/     \|
 */

path = "https://xcoa.av.it.pt/labi1617-p2-g2"

function generateContent() {

  var url = window.location.href.toLowerCase();

  // if on a dinamically created page, like imageUpload, image, gallery or otherGalleries
  if ($("div.content").data("id") == "index") {

    // add logo to page
    $("#logo img").prop("src", path+"/static/img/100brains.png");

    // get user credentials and save them
    $.get(path+"/userID", function(response){
      sessionStorage.setItem("userID", response.userID);
      sessionStorage.setItem("username", response.username);
      sessionStorage.setItem("avatar", response.avatar);
      sessionStorage.setItem("userUpvotes", response.upvotes);
      sessionStorage.setItem("userDownvotes", response.downvotes);
      sessionStorage.setItem("userViews", response.views);
    });

    setTimeout(function() {
      location.replace(path+"/static/home.html");
    }, 600);

  /** UPLOAD *********************************************************************************/
  } else if ($("div.content").data("id") == "upload") {
    var url_params = parseURLParams(url);
    // get img id
    var imgID = url_params.id[0];

    // generate memefy and effectify links
    $("#effect").parent().attr("href", "effectify.html?id="+imgID);
    $("#meme").parent().parent().attr("href", "memefy.html?id="+imgID);

    $("#currentImage").parent().click(function() {
      // add loading effect
      $("#loading").toggleClass("invisible");
      $.post(path+"/api/putAdvanced", {
        "id" : imgID,
        "type" : "PHOTO",
        "allIDs" : "["+imgID+"]"
      }, function () {
        location.replace("gallery.html?g=photo&sort=upvotes");
      }, 'json');
    });

    var imgPath = imgID.split('.');
    var imgRequestPath = path+"/api/getTemp?id="+imgID;
    var negRequestPath = path+"/api/getTemp?id="+imgPath[0]+"-neg."+imgPath[1];

    setImgSrc(imgRequestPath, "#currentImage", false);
    setImgSrc(negRequestPath, "#effect", false);
    setImgSrc(imgRequestPath, "#meme", false);

  /** IMAGE **********************************************************************************/
  } else if ($("div.content").data("id") == "image") {

    // get img id
    var url_params = parseURLParams(url);
    var imgID = url_params.id[0];

    // get image
    setImgSrc(path+"/api/get?id="+imgID, "#mainImg", false);

    // generate go back link
    var prevURL = document.referrer;
    // confirm user came from either gallery.html or all.html
    if (prevURL.indexOf("gallery.") === -1 && prevURL.indexOf("all.") === -1) {
      // if not, use a default address
      prevURL = "gallery.html?g=photo&sort=upvotes"
    }
    $("#header a").attr("href", prevURL);

    // populate fields and do checks
    getImgInfo(imgID, function(imgInfo) {
      // populate votes and views fields
      $('#views span').html(imgInfo.views);
      $('.votes span.upvotes').html(imgInfo.votes_up);
      $('.votes span.downvotes').html(imgInfo.votes_down);

      // increment image views if being seen for the first time (only for 100Cerebros' Gallery)
      var allCategoriesViews = JSON.parse(sessionStorage.getItem("userViews"));
      var userViews = allCategoriesViews[imgInfo.category];

      if(userViews.indexOf(imgID) === -1) {
        // it's the first time user is seeing the image
        $.post(path+"/api/updateViews", { "imgID" : imgID }, function() {
          allCategoriesViews[imgInfo.category].push(imgID);
          sessionStorage.setItem("userViews", JSON.stringify(allCategoriesViews));
        }, 'json');
      }
    });
  /** EFFECTIFY *******************************************************************************/
  } else if ($("div.content").data("id") == "effectify") {
    // get img id
    var url_params = parseURLParams(url);
    var imgID = url_params.id[0];
    var imgPath = imgID.split(".");

    // generate img and go back links
    setImgSrc(path+"/api/getTemp?id="+imgID, "#mainImg", false);
    $("#header a").attr("href", "upload.html?id="+imgID);

    // store previews
    var imgIDs = [imgID];
    var currentIndex = 0;

    // populate effect thumbnails
    $.get(path+"/api/getEffectThumbnails", {
      "tempID" : imgPath[0],
      "imgExtension" : imgPath[1]
    }, function(data) {
      for (var i = 0; i < data.length; i++) {
        var thumbnail = JSON.parse(data[i]);
        $('button[name="'+thumbnail.effect+'"] img').prop("src",
              "data:image/"+thumbnail.id.split('.')[1]+";base64,"+thumbnail.image);
      }
    }, 'json');

    $("#effectsList button").click(function() {
      var effect = $(this).attr("name");
      var imgIDPath = imgID.split('.');

      // add loading effect
      $("#loading").toggleClass("invisible");

      // get current image path info
      var currentImgPath = imgIDs[currentIndex].split(".");

      // make a preview request
      $.post(path+"/api/getEffectPreview", {
  			"tempImgID"    : currentImgPath[0],
        "imgExtension" : currentImgPath[1],
  			"effect"		 : effect
      }, function(data) {
        data = JSON.parse(data);
        imgIDs.push(data.newImgID);
        currentIndex++;
        // update image and remove loading effect
        setImgSrc(path+"/api/getTemp?id="+data.newImgID, "#mainImg", false);
        $("#loading").toggleClass("invisible");
      }, 'json');
    });
    $("button#undo").click(function() {
      // go back in array of images, update image shown to user
      currentIndex--;
      imgIDs.pop();
      setImgSrc(path+"/api/getTemp?id="+imgIDs[currentIndex], "#mainImg", false);
    });
    $('button[type="submit"]').click(function() {
      // add loading effect
      $("#loading").toggleClass("invisible");

      // make a submit request
      var category = (currentIndex === 0) ? "PHOTO" : "EFFECT";
      $.post(path+"/api/putAdvanced", {
        "id" : imgIDs[currentIndex],
        "type" : category,
        "allIDs" : JSON.stringify(imgIDs)
      }, function () {
        location.replace("gallery.html?g="+category.toLowerCase()+"&sort=upvotes");
      }, 'json');
    });

  /** MEMEFY *********************************************************************************/
  } else if ($("div.content").data("id") == "memefy") {

    // get img id
    var url_params = parseURLParams(url);
    var imgID = url_params.id[0];

    // store previews
    var imgIDs = [imgID];
    var currentIndex = 0;

    // generate img and go back links
    setImgSrc(path+"/api/getTemp?id="+imgID, "#mainImg", false);
    $("#header a").attr("href", "upload.html?id="+imgID);

    $('#memefy button[name="preview"]').click(function(event) {
      event.preventDefault();

      var topLine = $('#memefy input[name="topLine"]').val();
      var bottomLine = $('#memefy input[name="bottomLine"]').val();

      // validate input text
      if (topLine == "" && bottomLine == "") return;

      // add loading effect
      $("#loading").toggleClass("invisible");

      var currentImgPath = imgIDs[currentIndex].split(".");
      // make a preview request
      $.post(path+"/api/getMemePreview", {
  			"tempImgID" : currentImgPath[0],
        "imgExtension" : currentImgPath[1],
  			"topLine"	: topLine,
        "bottomLine" : bottomLine
      }, function(data) {
        data = JSON.parse(data);
        imgIDs.push(data.newImgID);
        currentIndex++;
        // update image and remove loading effect
        setImgSrc(path+"/api/getTemp?id="+data.newImgID, "#mainImg", false);
        $("#loading").toggleClass("invisible");
      }, 'json');
    });

    $('#memefy button[type="submit"]').click(function(event) {
      event.preventDefault();

      var topLine = $('#memefy input[name="topLine"]').val();
      var bottomLine = $('#memefy input[name="bottomLine"]').val();

      // make a submit request
      var category = (topLine == "" && bottomLine == "") ? "PHOTO" : "MEME";
      $.post(path+"/api/putAdvanced", {
        "id" : imgIDs[currentIndex],
        "type" : category,
        "allIDs" : JSON.stringify(imgIDs)
      }, function () {
        location.replace("gallery.html?g="+category.toLowerCase()+"&sort=upvotes");
      }, 'json');

    });

  /** GALLERY ********************************************************************************/
  } else if ($("div.content").data("id") == "gallery") {

    // validate url
    if (url.indexOf("photo&") === -1 && url.indexOf("effect&") === -1 && url.indexOf("meme&") === -1) {
      window.location.replace("gallery.html?g=photo&sort=upvotes");
    }

    // process url's info
    var url_params = parseURLParams(url);

    var gallery = url_params.g[0].toUpperCase();
    $("h3").html(gallery.charAt(0) + gallery.slice(1).toLowerCase()); // capitalize first letter only

    var sortOption = url_params.sort[0];
    $("#sort li").removeClass("selected");
    $('[data-sort="'+sortOption+'"]').addClass("selected");


    // create sort options links
    var links = $("#sort li a");
    for(var i = 0; i < links.length; i++) {
      $(links[i]).attr("href", "gallery.html?g="+gallery+"&sort="+$($("#sort li")[i]).data('sort'));
    }

    // request server the images depending on which gallery is selected (and sort method?)
    $.get(path+"/api/list", function(data){

      var userUpvotes = JSON.parse(sessionStorage.getItem("userUpvotes"))[gallery];
      var userDownvotes = JSON.parse(sessionStorage.getItem("userDownvotes"))[gallery];

      data = JSON.parse(data);
      data.sort(imgSort(sortOption));

      // add images to the page
      for (var i = 0; i < data.length; i++) {
        addNewImage(data[i], userUpvotes, userDownvotes);
      }
    });


  /**  ALL  **********************************************************************************/
  } else if ($("div.content").data("id") == "all") {

    // show loading effect
    $("#loading").toggleClass("invisible");

    $.get(path+"/api/listAll", function(data){
      // remove loading effect
      $("#loading").toggleClass("invisible");

      data = JSON.parse(data);
      for (var i = 0; i < data.length; i++) {
        for (key in data[i]) {
          $(".content").append("<ul class='table-view gallery-view' id='"+key+"'> \
                                  <h4>"+ ((key == 2) ? "100Cerebros\'" : "Group "+key+"\'s") +" Images</h4> \
                                </ul>");
          for (var j = 0; j < data[i][key].length; j++) {
            addNewImageOnly(data[i][key][j],
                            "https://xcoa.av.it.pt/labi1617-p2-g"+key+"/api/get?id="+data[i][key][j].id,
                            "#"+key, "not-selected", "", "not-selected", "");
          }
        }
      }
    });
  /** SETTINGS ******************************************************************************/
  } else if ($("div.content").data("id") == "settings") {
    // generate user's avatar and username
    $("#username").html(sessionStorage.getItem("username"));
    $("#userAvatar").prop('src', "img/icons/avatar_"+sessionStorage.getItem("avatar")+".png");

    // handle eusername change
    $('#changeUsername button[type=submit]').click(function(event) {
      event.preventDefault();

      var newName = $('#changeUsername input[name="username"]').val();

      $.post(path+"/api/updateUserInfo", {
        "avatar" : sessionStorage.getItem("avatar"),
        "username" : newName
      }, function() {
        sessionStorage.setItem("username", newName);
        location.reload();
      }, 'json');
    });

    // handle avatar change
    $("#avatarModal img").click(function(event) {
      var newAvatar = $(event.target).data('index');

      $.post(path+"/api/updateUserInfo", {
        "avatar" : newAvatar,
        "username" : sessionStorage.getItem("username")
      }, function() {
        sessionStorage.setItem("avatar", newAvatar);
        location.reload();
      }, 'json');
    });

  /** LOGOUT ********************************************************************************/
  } else if ($("div.content").data("id") == "logout") {
    sessionStorage.clear();

    $("#login").attr('href', path);
  }
}













/*           _______  _        _______  _______  _______  	  	 _______           _        _______ __________________ _______  _        _______
 * |\     /|(  ____ \( \      (  ____ )(  ____ \(  ____ ) 	 	(  ____ \|\     /|( (    /|(  ____ \\__   __/\__   __/(  ___  )( (    /|(  ____ \
 * | )   ( || (    \/| (      | (    )|| (    \/| (    )| 	 	| (    \/| )   ( ||  \  ( || (    \/   ) (      ) (   | (   ) ||  \  ( || (    \/
 * | (___) || (__    | |      | (____)|| (__    | (____)| 	 	| (__    | |   | ||   \ | || |         | |      | |   | |   | ||   \ | || (_____
 * |  ___  ||  __)   | |      |  _____)|  __)   |     __) 	 	|  __)   | |   | || (\ \) || |         | |      | |   | |   | || (\ \) |(_____  )
 * | (   ) || (      | |      | (      | (      | (\ (    	 	| (      | |   | || | \   || |         | |      | |   | |   | || | \   |      ) |
 * | )   ( || (____/\| (____/\| )      | (____/\| ) \ \__  		| )      | (___) || )  \  || (____/\   | |   ___) (___| (___) || )  \  |/\____) |
 * |/     \|(_______/(_______/|/       (_______/|/   \__/	  	|/       (_______)|/    )_)(_______/   )_(   \_______/(_______)|/    )_)\_______)
 */


/*********************************************************************************************
 * multi-page functions
 *********************************************************************************************/

// parseURLParams function done by Tomalak at
// https://stackoverflow.com/questions/814613/how-to-read-get-data-from-a-url-using-javascript
function parseURLParams(url) {
    var queryStart = url.indexOf("?") + 1,
        queryEnd   = url.indexOf("#") + 1 || url.length + 1,
        query = url.slice(queryStart, queryEnd - 1),
        pairs = query.replace(/\+/g, " ").split("&"),
        parms = {}, i, n, v, nv;

    if (query === url || query === "") return;

    for (i = 0; i < pairs.length; i++) {
        nv = pairs[i].split("=", 2);
        n = decodeURIComponent(nv[0]);
        v = decodeURIComponent(nv[1]);

        if (!parms.hasOwnProperty(n)) parms[n] = [];
        parms[n].push(nv.length === 2 ? v : null);
    }
    return parms;
}





/*********************************************************************************************
 * specific-page functions
 *********************************************************************************************/

/*******************************
 * gallery.html
 *******************************/

// adds a new image, with users' specific vote information
function addNewImage(data, userUpvotes, userDownvotes) {
  var upvoted = "not-selected", downvoted = "not-selected";
  var upvotesPrefix = "", downvotesPrefix= "";

  if(userUpvotes.indexOf(data.id) !== -1) {
    upvoted = "selected";
    upvotesPrefix = "_small";
  } else if (userDownvotes.indexOf(data.id) !== -1) {
    downvoted = "selected";
    downvotesPrefix = "_small";
  }

  addNewImageOnly(data, path+"/api/get?id="+data.id, "#imgList", upvoted, upvotesPrefix, downvoted, downvotesPrefix);

}

// add a new image, with generic vote information
function addNewImageOnly(data, requestPath, parentSelector, upvoted, upvotesPrefix, downvoted, downvotesPrefix) {

    $(parentSelector).append(
      "<li class='table-view-cell media' > \
        <a href= 'image.html?id="+ data.id +"'> \
          <img id='"+data.id+"' class='media-object pull-left' src=''> \
          <div class='votes'> \
            <img src='img/icons/upvotes"+upvotesPrefix+".png' alt='Upvote'> \
            <span class='upvotes "+upvoted+"'>"+ data.votes_up +"</span> \
            <img src='img/icons/downvotes"+downvotesPrefix+".png' alt='Downvote'> \
            <span class='downvotes "+downvoted+"'>"+ data.votes_down +"</span> \
          </div> \
        </a> \
      </li>");
      setImgSrc(requestPath, "#"+data.id, true); // unique ids are used to avoid async conflicts
}

function setImgSrc(requestPath, imgSelector, removeIdSelector) {
  // get image from server (since we receive a blob, must be xhr request)
  var req = new XMLHttpRequest();
  req.onreadystatechange = function(e){
      if (this.readyState == 4 && this.status == 200){
        // process server answer
        var fileRead = new FileReader();
        fileRead.onload = function () {
          $(imgSelector).prop("src", fileRead.result);
          if (removeIdSelector) {
            $(imgSelector).removeAttr('id');
          }
        };
        fileRead.readAsDataURL(this.response);
      }
  }
  req.open('GET', requestPath);
  req.responseType = 'blob';
  req.send();
}

function getImgInfo(id, callback) {
  $.get(path+"/api/getImgInfo", {"id":id}, function(response) {
    callback(response);
  }, 'json');
}

function imgSort(field) {
  if (field === "votes") {
    return function(a, b) {
      return b.votes_up + b.votes_down - a.votes_up - a.votes_down; // desceding order
    }
  } else if (field === "views") {
    return function(a, b) {
      return b.views - a.views; // desceding order
    }
  } else if (field === "date") {
    return function(a, b) {
      return a.date - b.date; // ascending order
    }
  } else { // sorts by upvotes by default
    return function(a, b) {
      return b.votes_up - a.votes_up; // desceding order
    }
  }
}



/*******************************
 * image.html
 *******************************/
function updateVotes(selectorVotes, selectorBtn, addedVote) {
  var votes = $(selectorVotes).html();

  if (addedVote) {
    votes--;
  } else {
    votes++;
  }

  $(selectorVotes).html(votes);
  $(selectorBtn).toggleClass("inactive");
}














/*  _______           _______  _       _________ 	  _       _________ _______ _________ _______  _        _______  _______  _______
 * (  ____ \|\     /|(  ____ \( (    /|\__   __/ 	 ( \      \__   __/(  ____ \\__   __/(  ____ \( (    /|(  ____ \(  ____ )(  ____ \
 * | (    \/| )   ( || (    \/|  \  ( |   ) (    	 | (         ) (   | (    \/   ) (   | (    \/|  \  ( || (    \/| (    )|| (    \/
 * | (__    | |   | || (__    |   \ | |   | |    	 | |         | |   | (_____    | |   | (__    |   \ | || (__    | (____)|| (_____
 * |  __)   ( (   ) )|  __)   | (\ \) |   | |    	 | |         | |   (_____  )   | |   |  __)   | (\ \) ||  __)   |     __)(_____  )
 * | (       \ \_/ / | (      | | \   |   | |    	 | |         | |         ) |   | |   | (      | | \   || (      | (\ (         ) |
 * | (____/\  \   /  | (____/\| )  \  |   | |    	 | (____/\___) (___/\____) |   | |   | (____/\| )  \  || (____/\| ) \ \__/\____) |
 * (_______/   \_/   (_______/|/    )_)   )_(    	 (_______/\_______/\_______)   )_(   (_______/|/    )_)(_______/|/   \__/\_______)
*/

/*********************************************************************************************
 * all pages' event listeners
 *********************************************************************************************/

// runs every time we change page via push.js
window.addEventListener('push', function() {
  // generate any dynamic content
  generateContent();
});

// runs every time we load/refresh a page
$(document).ready(function() {
  // generate any dynamic content
  generateContent();
});



/*********************************************************************************************
 * specific pages' event listeners
 *********************************************************************************************/

/*******************************
 * home.html
 *******************************/
$(document).on('change', "#getMedia", function() {

  // add loading effect
  $("#loading").toggleClass("invisible");

  // get input field's values
  var files = $("#getMedia input")[0].files;
  if (!files || !files[0]) {
    return;
  }
  var file = files[0];

  // get image file
  fileRead = new FileReader();

	fileRead.onload = function () {
		// fr.result is the image in the format:
    // data:image/png;base64,imageInBinaryString
    var imageInfo = fileRead.result.split(',');

    $.ajax({
      url: path+"/api/getNegative",
      type: "POST",
      data: JSON.stringify({
        "imgExtension" : imageInfo[0].split(';')[0].split('/')[1],
        "img" : imageInfo[1]
      }),
      headers: {
        "Content-Type" : "application/json"
      },
      dataType: 'json',
      success: function (data) {
        location.href = "upload.html?id="+JSON.parse(data).tempImgID;
      }
    });
  }

	fileRead.readAsDataURL(file);
});



/*******************************
 * gallery.html
 *******************************/
$(document).on('click', "#toggleSort", function() {
  $("#sort").toggleClass("invisible");
});



/*******************************
 * image.html
 *******************************/
$(document).on('click', "#imageView .votes button.upvote", function() {
  var upvoteBtn = "#imageView .votes button.upvote";
  var upvoteNum = "#imageView .votes button.upvote span.upvotes";
  var downvoteBtn = "#imageView .votes button.downvote";

  var addedVote = $(upvoteBtn).hasClass("inactive");
  var imgID = $("#mainImg").data("id");

  // added or removed upvote
  if (!$(downvoteBtn).hasClass("inactive")) { // sanity check

    $.post(path+"/api/updateVotes", {
      "imgID"  : imgID,
      "vote"   : addedVote ? 2 : 1
    }, function() {
      getImgInfo(imgID, function(imgInfo) {
        var userUpvotes = JSON.parse(sessionStorage.getItem("userUpvotes"));
        if (addedVote) { // add vote
          userUpvotes[category].push(imgID);
        } else { // remove vote
           userUpvotes[category].splice(userUpvotes[imgInfo.category].indexOf(imgID), 1);
        }
        sessionStorage.setItem("userViews", JSON.stringify(userUpvotes));
        updateVotes(upvoteNum, upvoteBtn, addedVote);
      });
    }, 'json');

  }
});
$(document).on('click', "#imageView .votes button.downvote", function() {
  //var apiPrefix = document.URL.slice("/static/");

  var upvoteBtn = "#imageView .votes button.upvote";
  var downvoteBtn = "#imageView .votes button.downvote";
  var downvoteNum = "#imageView .votes button.downvote span.downvotes";

  var addedVote = $(downvoteBtn).hasClass("inactive");
  var imgID = $("#mainImg").data("id");

  // added or removed downvote
  if (!$(upvoteBtn).hasClass("inactive")) {

    $.post(path+"/api/updateVotes", {
      "imgID"  : imgID,
      "vote"   : addedVote ? -1 : 0
    }, function() {
      getImgInfo(imgID, function(imgInfo) {
        var userDownvotes = JSON.parse(sessionStorage.getItem("userDownvotes"));
        if (addedVote) { // add vote
          userUpvotes[imgInfo.category].push(imgID);
        } else { // remove vote
           userUpvotes[imgInfo.category].splice(userUpvotes[imgInfo.category].indexOf(imgID), 1);
        }
        sessionStorage.setItem("userViews", JSON.stringify(userUpvotes));
        updateVotes(upvoteNum, upvoteBtn, addedVote);
      });
    }, 'json');

  }
});
