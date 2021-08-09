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
        case 'updateHudLocation':
            updateHudPosition(e.data.position)
        break;
    }
})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function updateHudPosition(Minimap) {
	let width = Minimap.width;
	let x = Minimap.left_x;
	let y = Minimap.bottom_y;
    let right = 
    console.log((Minimap.right_x * $(window).width()))

	let xCalc = (x * $(window).width());
	let widthCalc = width * $(window).width()+ 2;
	let yCalc = (y * $(window).height()) - 25;
    $('#info-container').css('left', (Minimap.right_x * $(window).width() + 12) + 'px')
	$('#container').css('left', xCalc + 'px').css('top', yCalc + 'px').css('width', widthCalc + 'px')
}