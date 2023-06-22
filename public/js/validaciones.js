$(document).ready(function() {

    // VALIDA NOMBRE COMPLETO NO VACIO
    validar_full_name();
    validar_alias();
    $('#dni').on('blur', function() {
        var rut = $(this).val();
        var dniErrorElement = $('#dni-error');
        dniErrorElement.toggle(!validar_rut(rut))
    });
    validar_select_region();
    validar_select_candidato();
    valdiar_check_item();
});

// VALIDAR FULL NAME
function validar_full_name(){
    $("#full_name").on("blur", function() {
        var valor = $(this).val().trim();
        $("#full_name-error").toggle(valor === "");
    });
}

// VALIDAR ALIAS
function validar_alias(){
    $("#nickname").on("blur", function() {
        var alias = $(this).val();
        if (alias.length < 5 || !/[a-zA-Z]/.test(alias) || !/[0-9]/.test(alias)) {
            $("#nickname-error").show();
        } else {
            $("#nickname-error").hide();
        }
    });
}

// VALIDAR RUN
function validar_rut(rut) {
    rut = rut.replace(/[^\dkK]+/g, '');
    if (!/^(\d{1,3}(?:\.?\d{3}){0,2})-?([\dkK])$/.test(rut)) {
        return false;
    }

    rut = rut.replace(/\./g, '');
    var num = parseInt(rut, 10);
    var verif = rut.charAt(rut.length - 1).toUpperCase();
    var factor = 2;
    var suma = 0;
    var digito;

    for (var i = rut.length - 2; i >= 0; i--) {
        suma += factor * parseInt(rut.charAt(i), 10);
        factor = factor === 7 ? 2 : factor + 1;
    }

    digito = 11 - (suma % 11);
    digito = digito === 11 ? '0' : digito === 10 ? 'K' : String(digito);

    return digito === verif;
}

function validar_select_region(){
    $("#regions").change(function() {
        var selectedValue = $(this).val();
        var spanElement = $("#regions-error");
        spanElement.toggle(selectedValue === "0");
    });
}

function validar_select_candidato(){
    $("#candidatos").change(function() {
        var selectedValue = $(this).val();
        var spanElement = $("#candidatos-error");
        spanElement.toggle(selectedValue === "0");
    });
}

function valdiar_check_item(){
    $("input[type='checkbox']").on("change", function() {
        var checkedCount = $("input[type='checkbox']:checked").length;
        $("#checked").val(checkedCount);
        if (checkedCount >= 2) {
            $("#checkbox-error").hide();
        } else {
            $("#checkbox-error").show();
        }
    });
}
