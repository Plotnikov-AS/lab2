<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb" dir="ltr">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>main</title>
</head>
<body>
<script language=JavaScript>
    let zn_col = 0, zn_last = 0, vybor_cnt = 0;
    data_zn = Array();
    data_vybor = Array();
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div class=main>
    <div class="table" id="const">
        <div class="client_row">
            <div class="cell">N1: <input type=text id="n1" value='3' size=3></div>
            <div class="cell">N2: <input type=text id="n2" value='10' size=3>%</div>
        </div>
    </div>
    <div class="table" id="zhach">
        <div class="client_row">
                <div class="cell">Новое значение: <input type=text id="new_zn"><input type=button id="new_but"
                                                                                      value="Добавить"></div>
        </div>
    </div>
    <div class="table" id="tekush">
        <div class="client_row">
            <div class="cell" id="tek_cell"></div>
        </div>
    </div>
    <div class="table" id="chart">
        <div class="client_row">
            <div class="cell">
                <div id="chart_div"></div>
            </div>
        </div>
    </div>
    <div class="table" id="vybor">
        <div class="client_row">
            <div class="cell" id="vybor_cell"></div>
        </div>
    </div>
    <div class="table" id="diag">
        <div class="client_row">
            <div class="cell">
                <div id="chart_div2"></div>
            </div>
        </div>
    </div>
    <script language=JavaScript>
        $('#new_but').click(function () {
            let new_val = $('#new_zn').val();
            if (new_val < 0) {
                alert('Значение отрицательное!');
            }
            ;
            zn_last++;
            $('#tek_cell').append('<input type=button value=' + new_val + ' class="tek_zn" id="tek' + zn_last + '">');
            $('#tek' + zn_last).click(function () {
                $('#vybor_cell').append($(this).val() + ' ');
                $(this).prop('disabled', true);
                vybor_cnt++;
                let zn_arr2 = [Number(vybor_cnt), Number($(this).val())];
                data_vybor.push(zn_arr2);
                drawColumnChart();
            });
            let zn_arr = [Number(zn_last), Number(new_val)];
            data_zn.push(zn_arr);
            zn_col = $('#n1').val();
            if ($('.tek_zn').length > zn_col) {
                $('#tek' + (zn_last - zn_col)).css('display', 'none');
            }
            ;
            drawLineChart();
            if (zn_last > 1) {
                pred = $('#tek' + (zn_last - 1)).val();
                proc = $('#n2').val();
                if ((new_val - pred) / pred > (proc / 100)) {
                    alert('Значение больше предыдущего на ' + Math.round((new_val - pred) / pred * 100) + '%');
                }
            }
            ;
        });
        google.charts.load('current', {packages: ['corechart', 'line']});
        google.charts.load('current', {packages: ['corechart', 'bar']});

        function drawLineChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'X');
            data.addColumn('number', 'Значения');

            data.addRows(data_zn);

            var options = {
                hAxis: {
                    title: 'Время'
                },
                vAxis: {
                    title: 'Значения'
                },
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        };

        function drawColumnChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'X');
            data.addColumn('number', 'Значения');

            data.addRows(data_vybor);

            var options = {
                hAxis: {
                    title: 'Выборочные значения',
                    format: '0'
                },
                vAxis: {
                    title: 'Значения',
                    format: '0'
                },
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
            chart.draw(data, options);
        };
    </script>


</div>
</body>
</html>

