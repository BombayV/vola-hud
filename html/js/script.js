const valueBeforeDisappearing = 70.0;

const doc = document;
const h = doc.getElementById('health');
const a = doc.getElementById('armor');

let hNum = 100.0;
let aNum = 100.0;

window.addEventListener('message', (e) => {
    switch (e.data.action) {
        case 'updateInfo':
            hNum = e.data.health;
            aNum = e.data.armour;
            if (hNum < valueBeforeDisappearing) {
                $("#health-text").hide();
            } else {
                $("#health-text").text(e.data.health + "%");
                $("#health-text").show();
            }
            if (aNum < valueBeforeDisappearing) {
                $("#armor-text").hide();
            } else {
                $("#armor-text").text(e.data.armour + "%");
                $("#armor-text").show();
            }
            $("#time").text(e.data.time);
            $("#health").css("width", e.data.health + "%");
            $("#armor").css("width", e.data.armour + "%");
            break;
        case 'status':
            $("#name").text(e.data.name);
            $("#money").text(numberWithCommas(e.data.money));
            $("#bank").text(numberWithCommas(e.data.bank));
            break;
    }
})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}