function doLike(pid, uid) {
    console.log(pid + "..." + uid);
    const d = {
        pid: pid,
        uid: uid,
        operation: 'like'
    };

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == "true") { // Check for string "true"
                let c = parseInt($(".like-count").text()); // Parse the current count to integer
                if (!isNaN(c)) { // Check if c is a valid number
                    c++; // Increment the count
                    $('.like-count').text(c); // Update the count in the DOM
                } else {
                    console.log("Error: Current like count is not a number");
                }
            } else {
                console.log("Error: Like operation failed");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}
