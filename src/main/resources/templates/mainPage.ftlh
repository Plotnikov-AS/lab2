<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main page</title>
</head>
<body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    var selected = [];
    google.charts.load('current', {'packages': ['corechart']});
    google.charts.setOnLoadCallback(drawAreaChart);

    function drawAreaChart() {
        <#if values?? && (values?size > 0)>
        var data = google.visualization.arrayToDataTable([
            ['Номер', 'Значения'],
            <#foreach value in values>
            ['${value_index}', ${value.value}]<#if value_has_next>,</#if>
            </#foreach>
        ]);

        var options = {
            hAxis: {title: 'Время', titleTextStyle: {color: '#333'}},
            vAxis: {title: 'Значения', minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('area_chart_div'));
        chart.draw(data, options);
        </#if>
    }

    function drawColumnChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('number', 'Выборочные значения');
        selected.forEach(function (item, i, selected) {
            data.addRows([
                [i, item]
            ]);
        });

        var options = {
            title: 'Выбранные значения',
            hAxis: {
                title: 'Номер'
            },
            vAxis: {
                title: 'Значение'
            }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('column_chart_div'));

        chart.draw(data, options);
    }

    function getN1() {
        document.getElementById('N1out').value = document.getElementById('N1').value
    }

    function addToSelectedDisableAndDraw(sel) {
        selected.push(sel.value);
        sel.disabled = true;
        drawColumnChart();
    }
</script>
<div>
    <table>
        <tr>
            <td>N1: <input type="number" min="0" max="10" id="N1" <#if N1??>value="${N1}" <#else>value="3"</#if>></td>
            <td>N2: <input type="number" min="5" max="40" id="N2" value="10">%</td>
        </tr>
    </table>
    <form action="add" method="post">
        Новое значение: <input type="number" id="newValue" name="newValue"> <input type="submit" value="Добавить"
                                                                                   onclick="getN1()">
        <input type="hidden" id="N1out" name="N1" value="">
    </form>
</div>
<#if values?? && (values?size > 0)>
    <div>
        <table>
            <tr><#foreach value in values><input type="button" value="${value.value}" onclick="addToSelectedDisableAndDraw(this)"> </#foreach></tr>
        </table>
    </div>
    <div id="area_chart_div" style="width: 100%; height: 500px;"></div>
    <div id="column_chart_div" style="width: 100%; height: 500px;"></div>
</#if>
</body>
</html>