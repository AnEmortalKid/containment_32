$(document).ready(function () {
    // set initial data
    search()
});

function createCard(data) {
    var $container = $("<div>", { "class": "w3-container s3" });

    var $card = $("<div>", { "class": "w3-card w3-dark-gray"});
    
    var $viewSection = $("<div>", {"class": "w3-container w3-center"});
    var $name = $("<h3>").text(data.name);
    var $img = $("<img>", { "style": "width:300px;height:300px;", "src": data.imgLink });
    $viewSection.append($name);
    $viewSection.append($img);

    var $detailsSection = $("<div>", {"class": "w3-section"})

    var $description = $("<p>").text(data.description);
    $detailsSection.append($description);

    var $typeSpan = $("<span>");
    $typeSpan.append($("<b>").text("Type: "));
    $typeSpan.append(data.type);
    $detailsSection.append($typeSpan);

    $card.append($viewSection);
    $card.append($detailsSection);
    $container.append($card);
    return $container;
}

function search() {
    var queryField = document.querySelector('input[name="query"]');
    var query = queryField.value;
    if (query.replace(/\s/g, "") == "") {
        // no search, search all
        query = "*:*"
    }

    $.get(`http://localhost:8983/solr/galaxy/select?q=${query}&rows=20&sort=name%20asc`, function (data) {
        var docs = data.response.docs
        $('#results').empty()
        docs.forEach(doc => {
            $("#results").append(createCard(doc));
        });
    });
}