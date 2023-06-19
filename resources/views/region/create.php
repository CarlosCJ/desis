<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar una región</title>
</head>
<body>

    <h1>Agregar una región</h1>
    <main>
        <form action="/region" method="post">

            <div>
                <label for="name_region">Nombre de la región</label>
                <input type="text" name="nombre" id="name_region">
            </div>

            <input type="hidden" name="method" value="post">

            <div>
                <button type="submit">Guardar</button>
            </div>

        </form>
    </main>

</body>
</html>