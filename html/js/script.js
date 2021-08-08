const valueBeforeDisappearing = 1.0;

const doc = document;
const h = doc.getElementById('health');
const a = doc.getElementById('armor');

let hNum = 100.0;
let aNum = 100.0;

window.addEventListener('message', (e) => {
    switch (e.data.action) {
        case 'updateInfo':
            let d = new Date();
            let n = d.getHours();
            let m = d.getMinutes();
            let time = n + ":" + m
            hNum = e.data.health;
            aNum = e.data.armor;
            if (hNum < valueBeforeDisappearing) {
                $("#health-text").hide();
            } else {
                $("#health-text").text(e.data.health + "%");
                $("#health-text").show();
            }
            if (aNum < valueBeforeDisappearing) {
                $("#armor-text").hide();
            } else {
                $("#armor-text").text(e.data.armor + "%");
                $("#armor-text").show();
            }
            $("#time").text(time);
            $("#health").css("width", e.data.health + "%");
            $("#armor").css("width", e.data.armor + "%");
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