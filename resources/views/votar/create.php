<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de votación</title>
</head>
<body>

    <h1>FORMULARIO DE VOTACIÓN:</h1>
    <main>
        <form action="/region" method="post">

            <div>
                <label for="full_name">Nombre y Apellido</label>
                <input type="text" name="nombre_completo" id="full_name">
            </div>

            <div>
                <label for="nickname">Alias</label>
                <input type="text" name="alias" id="nickname">
            </div>

            <div>
                <label for="DNI">RUN</label>
                <input type="text" name="run" id="DNI">
            </div>

            <div>
                <label for="correo">Email</label>
                <input type="email" name="email" id="correo">
            </div>

            <div>
                <label for="regions">Región</label>
                <select name="region" id="regions">
                    <option value="0" selected>Seleccione su región</option>
                    <?php foreach($resultsRegions as $region): ?>
                        <option value="<?php echo $region['idRegion']; ?>"><?php echo $region['nombre']; ?></option>
                    <?php endforeach; ?>
                </select>
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
            </div>

            <div>
                <label>¿Cómo se enteró de Nosotros?</label>
                <label for="cbox_web"><input type="checkbox" id="cbox_web" value="web"> Web</label>
                <label for="cbox_tv"><input type="checkbox" id="cbox_tv" value="tv"> Tv</label>
                <label for="cbox_rrss"><input type="checkbox" id="cbox_rrss" value="rrss"> Redes Sociales</label>
                <label for="cbox_amigo"><input type="checkbox" id="cbox_amigo" value="amigo"> Amigo</label>
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
                var selectValue = $(this).val();
                var inputElement = $("#comunas");

                if (selectValue != 0) {
                    inputElement.prop("disabled", false);
                } else {
                    inputElement.prop("disabled", true);
                }
            });
        });
    </script>

    <script>
        $(document).ready(function() {
            $("#regions").change(function() {
                var selectedRegion = $(this).val();
                $.ajax({
                    url: "/comuna/index",
                    method: "POST",
                    data: { region: selectedRegion },
                    dataType: "json",
                    success: function(response) {
                        $("#comunas").empty();
                        $.each(response, function(index, commune) {
                            $("#comunas").append('<option value="' + commune.id + '">' + commune.nombre + '</option>');
                        });
                    },
                    error: function(xhr, status, error) {
                        console.log("Error al obtener las comunas: " + error);
                    }
                });
            });
        });
    </script>
</body>
</html>