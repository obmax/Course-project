    $('.document').ready(function () {
        $("#trash").attr("disabled", true);
        $("#lock").attr("disabled", true);
        $("#unlock").attr("disabled", true);

          

        ["#trash","#ban","#unban"].forEach((value) => {
        let jqObj = $(value); 
        let href = jqObj.attr('href'); 
        jqObj.on('click', (event) => { 
        let newHref = href + '?' 
        $('.checkbox_user').each(function () { 
        if ($(this).prop('checked') == true) { 
        newHref += 'user_ids%5B%5D=' + $(this).val() + '&' 
        } 
        }); 
        jqObj.attr('href', newHref) 
        }); 
        })

        $('#checkAll').click(function () {
            if ($(this).is(":checked"))
                $('.checkbox_user').prop('checked', true);
            else
                $('.checkbox_user').prop('checked', false);
        });


        $('.checkbox_user').on('click', function () {
            var count = $('#checkbox_user:checked').length;

            $("#goodsLenght").text(count);
            if (count == 0) {
                $("#trash").attr("disabled", true);
                $("#ban").attr("disabled", true);
                $("#unban").attr("disabled", true);
            }
            else {
                $("#trash").attr("disabled", false);
                $("#ban").attr("disabled", false);
                $("#unban").attr("disabled", false);
            }


        });


        
    });