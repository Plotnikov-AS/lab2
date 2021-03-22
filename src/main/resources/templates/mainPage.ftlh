<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main page</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    var selected = [];
    var selected_count = 0;
</script>
<script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(newValueClick);
    google.charts.setOnLoadCallback(valueButtonClick);

    function newValueClick() {
        drawLineChart();
        document.getElementById('N1out').value = document.getElementById('N1').value
    }

    function valueButtonClick() {
        $('#valueBtn').click(function () {
            $(this).prop('disabled', true);
            selected_count++;
            console.log('sel count = ' + selected_count);
            let sel = [String(selected_count), Number($(this).val())];
            selected.push(sel);
            console.log(selected);
            drawColumnChart();
        });
    }

    function drawLineChart() {
        <#if values?? && (values?size > 0)>

        var data = google.visualization.arrayToDataTable([
            ['Номер', 'Значения'],
            <#foreach value in values>
            ['${value_index}', ${value.value}]<#if value_has_next>, </#if>
            </#foreach>
        ]);

        var options = {
            hAxis: {
                title: 'Время'
            },
            vAxis: {
                title: 'Значения'
            },
            backgroundColor: '#f1f8e9'
        };

        var chart = new google.visualization.LineChart(document.getElementById('area_chart_div'));
        chart.draw(data, options);
        </#if>

    };

    function drawColumnChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('number', 'X');
        data.addColumn('number', 'Значения');

        data.addRows(selected);

        var options = {
            hAxis: {
                title: 'Выборочные значения',
                format: '0'
            },
            vAxis: {
                title: 'Значения',
                format: '0'
            },
            backgroundColor: '#f1f8e9'
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('column_chart_div'));
        chart.draw(data, options);
    };
</script>
<div>
    <table>
        <tr>
            <td>N1: <input type="number" min="0" max="10" id="N1" <#if N1??>value="${N1}" <#else>value="3"</#if>></td>
            <td>N2: <input type="number" min="5" max="40" id="N2" value="10">%</td>
        </tr>
    </table>
    <form action="add" method="post">
        Новое значение: <input type="number" id="newValue" name="newValue"> <input type="submit" value="Добавить" onclick="newValueClick()">
        <input type="hidden" id="N1out" name="N1" value="">
    </form>
</div>
<#if values?? && (values?size > 0)>
    <div>
        <table>
            <tr><#foreach value in values><input type="button" id="valueBtn" value="${value.value}"> </#foreach></tr>
        </table>
    </div>
    <div id="area_chart_div" style="width: 100%; height: 500px;"></div>
    <div id="column_chart_div" style="width: 100%; height: 500px;"></div>
</#if>
</body>
</html>