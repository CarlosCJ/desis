<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
    <title>Formulario de votación</title>
</head>
<body>

    <h1>FORMULARIO DE VOTACIÓN:</h1>
    <main>
        <form action="/region" method="post">

            <div>
                <label for="full_name">Nombre y Apellido</label>
                <input type="text" name="nombre_completo" id="full_name" placeholder="María Soto" required>
                <span id="full_name-error">No debe estar vacío.</span>
            </div>

            <div>
                <label for="nickname">Alias</label>
                <input type="text" name="alias" id="nickname" placeholder="Ingrese su alias" required>
                <span id="nickname-error">Debe contener al menos 5 caracteres de números y letras.</span>
            </div>

            <div>
                <label for="dni">RUN</label>
                <input type="text" name="run" id="dni" pattern="/^[0-9]{8,9}-[0-9kK]$/" placeholder="12345678-9" required>
                <span id="dni-error">No tiene el formato correcto (sin puntos) o no es valido</span>
            </div>

            <div>
                <label for="correo">Email</label>
                <input type="email" name="email" id="correo" placeholder="jperez@gmail.com" required>
                <span id="email-error">Debe ingresar un correo valido</span>
            </div>

            <div>
                <label for="regions">Región</label>
                <select name="region" id="regions">
                    <option value="0" selected>Seleccione su región</option>
                    <?php foreach($resultsRegions as $region): ?>
                        <option value="<?php echo $region['idRegion']; ?>"><?php echo $region['nombre']; ?></option>
                    <?php endforeach; ?>
                </select>
                <span id="regions-error">Debe seleccionar una región</span>
            </div>

            <div>
                <label for="comunas">Comuna</label>
                <select name="comuna" id="comunas" disabled>
                    <option value="0" selected>Seleccione su comuna</option>
                </select>
            </div>

            <div>
                <label for="candidatos">Candidato</label>
                <select name="candidato" id="candidatos">
                    <option value="0" selected>Seleccione a su candidato</option>
                    <?php foreach($resultsCandidatos as $candidato): ?>
                        <option value="<?php echo $candidato['idcandidato']; ?>"><?php echo $candidato['nombre']; ?></option>
                    <?php endforeach; ?>
                </select>
                <span id="candidatos-error">Debe seleccionar un candidato</span>
            </div>

            <div>
                <label>¿Cómo se enteró de Nosotros?</label>
                <label for="cbox_web"><input type="checkbox" id="cbox_web" value="web" checked> Web</label>
                <label for="cbox_tv"><input type="checkbox" id="cbox_tv" value="tv" checked> Tv</label>
                <label for="cbox_rrss"><input type="checkbox" id="cbox_rrss" value="rrss"> Redes Sociales</label>
                <label for="cbox_amigo"><input type="checkbox" id="cbox_amigo" value="amigo"> Amigo</label>
                <span id="checkbox-error">Debe seleccionar al menos 2 items</span>
            </div>

            <input type="hidden" name="method" value="post">

            <div>
                <button type="submit">Votar</button>
            </div>

        </form>
    </main>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#regions").change(function() {
                var regionId = $(this).val();
                var inputElement = $("#comunas");

                inputElement.prop("disabled", regionId == 0 ? true : false);

                getComunasByRegion(regionId);
            });
        });
        function getComunasByRegion(regionId) {
            $.ajax({
                url: "/comuna/index",
                method: "POST",
                data: { region: regionId },
                dataType: "json",
                success: function(response) {
                    var options = "";
                    $.each(response, function(index, commune) {
                        options += '<option value="' + commune.id + '">' + commune.nombre + '</option>';
                    });
                    $("#comunas").html(options);
                },
                error: function(xhr, status, error) {
                    console.log("Error al obtener las comunas: " + error);
                }
            });
        }
    </script>
</body>
</html>