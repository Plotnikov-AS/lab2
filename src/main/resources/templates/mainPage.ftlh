<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main page</title>
</head>
<body>
    <div>
        <table>
            <tr>
                <td>N1: <input type="number" min="0" max="10" id="N1" value="3"></td>
                <td>N2: <input type="number" min="5" max="40" id="N2" value="10">%</td>
            </tr>
        </table>
        <form action="add" method="post">
            Новое значение: <input type="number" id="newValue" name="newValue"> <input type="submit" value="Добавить">
        </form>
    </div>
    <#if newValue??>
        <div>

        </div>
    </#if>
</body>
</html>