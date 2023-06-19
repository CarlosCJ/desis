<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de regiones</title>
</head>
<body>
    <h1>Lista de regiones</h1>
    <main>
        <table>
            <tr>
                <th>#</th>
                <th>Nombre</th>
            </tr>

            <tbody>
            <?php foreach($results as $result): ?>
                <tr>
                    <td><?= $result["idRegion"] ?></td>
                    <td><?= $result["nombre"] ?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>

        </table>
        <a href="/region/create">Agregar nueva región</a>
    </main>

</body>
</html>