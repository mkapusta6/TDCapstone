<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="dashboardItems.aspx.cs" Inherits="Lab3.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="emailTemplateContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div class="row">
    <div class="col-md-6 col-md-offset-3" id="form_container">
        <h2>Confirmation Email</h2>
        <p>
           Client Email Template
        </p>
        <form role="form" method="post" id="reused_form">

            <div class="row">
                <div class="col-sm-12 form-group">
                    <label for="message">
                        Message:</label>
                    <textarea class="form-control" type="textarea" name="message" id="message" maxlength="6000" rows="7"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 form-group">
                    <label for="name">
                        Name:</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="col-sm-6 form-group">
                    <label for="email">
                        Email:</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
            </div>


            <div class="row">
                <div class="col-sm-12 form-group">
                    <button type="submit" class="btn btn-lg btn-default pull-right" >Send →</button>
                </div>
            </div>

        </form>
        <div id="success_message" style="width:100%; height:100%; display:none; ">
            <h3>Posted your message successfully!</h3>
        </div>
        <div id="error_message"
                style="width:100%; height:100%; display:none; ">
                    <h3>Error</h3>
                    Sorry there was an error sending your form.

        </div>
    </div>
</div>
    <script>
$(function()
{
    function after_form_submitted(data)
    {
        if(data.result == 'success')
        {
            $('form#reused_form').hide();
            $('#success_message').show();
            $('#error_message').hide();
        }
        else
        {
            $('#error_message').append('<ul></ul>');

            jQuery.each(data.errors,function(key,val)
            {
                $('#error_message ul').append('<li>'+key+':'+val+'</li>');
            });
            $('#success_message').hide();
            $('#error_message').show();

            //reverse the response on the button
            $('button[type="button"]', $form).each(function()
            {
                $btn = $(this);
                label = $btn.prop('orig_label');
                if(label)
                {
                    $btn.prop('type','submit' );
                    $btn.text(label);
                    $btn.prop('orig_label','');
                }
            });

        }//else
    }

	$('#reused_form').submit(function(e)
      {
        e.preventDefault();

        $form = $(this);
        //show some response on the button
        $('button[type="submit"]', $form).each(function()
        {
            $btn = $(this);
            $btn.prop('type','button' );
            $btn.prop('orig_label',$btn.text());
            $btn.text('Sending ...');
        });


                    $.ajax({
                type: "POST",
                url: 'handler.php',
                data: $form.serialize(),
                success: after_form_submitted,
                dataType: 'json'
            });

      });
});
    </script>

    
</asp:Content>

<asp:Content ID="toDoListContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Push Notification:
        <asp:Label ID="pushNotificationLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
   <%-- <link rel="stylesheet" type="text/css" href="assets/todoList.css">
   <div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-md-12">
                <div class="card px-3">
                    <div class="card-body">
                        <h4 class="card-title">Awesome Todo list</h4>
                        <div class="add-items d-flex"> <input type="text" class="form-control todo-list-input" placeholder="What do you need to do today?"> <button class="add btn btn-primary font-weight-bold todo-list-add-btn">Add</button> </div>
                        <div class="list-wrapper">
                            <ul class="d-flex flex-column-reverse todo-list">
                                <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> For what reason would it be advisable. <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li class="completed">
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox" checked=""> For what reason would it be advisable for me to think. <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> it be advisable for me to think about business content? <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> Print Statements all <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li class="completed">
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox" checked=""> Call Rampbo <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> Print bills <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    (function ($) {
        'use strict';
        $(function () {
            var todoListItem = $('.todo-list');
            var todoListInput = $('.todo-list-input');
            $('.todo-list-add-btn').on("click", function (event) {
                event.preventDefault();

                var item = $(this).prevAll('.todo-list-input').val();

                if (item) {
                    todoListItem.append("<li>
                        < div class= 'form-check' > <label class='form-check-label'><input class='checkbox' type='checkbox' />" + item + "<i class='input-helper'></i></label></div > <i class='remove mdi mdi-close-circle-outline'></i>
</li > ");
todoListInput.val("");
                }

            });

            todoListItem.on('change', '.checkbox', function () {
                if ($(this).attr('checked')) {
                    $(this).removeAttr('checked');
                } else {
                    $(this).attr('checked', 'checked');
                }

                $(this).closest("li").toggleClass('completed');

            });

            todoListItem.on('click', '.remove', function () {
                $(this).parent().remove();
            });

        });
    })(jQuery);
</script>--%>
    </asp:Content>

<asp:Content ID="buttonTemplateContent" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="form-group row">
  <div class="col-xs-2">
    <label for="TextBox1">Search For Customer</label>
     <asp:TextBox ID="searchBox" runat="server" CssClass="form-control"></asp:TextBox>
      <asp:Button ID="searchButton" runat="server" Text="Search" CssClass="btn btn-secondary" OnClick="searchButton_Click" />

      <asp:Button ID="notificationBtn" runat="server" Text="View Service Requests" OnClick="notificationBtn_Click" CssClass="btn btn-secondary" />

      <asp:GridView ID="searchForCustGrd" runat="server" class="table table-bordered table-condensed"></asp:GridView>
            <asp:Label ID="statusLbl" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:Label ID="statusLbl2" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
            <asp:Label ID="statusLbl3" runat="server" ForeColor="Red" Text="" Font-Bold="true"></asp:Label>
  </div>
             </div>

    <asp:Button ID="formsBtn" runat="server" class="btn-primary btn-lg btn-warning" style="width: 219px" Text="+ New Form" OnClick="formsBtn_Click" CausesValidation="false"/>



    <br />
    <br />
        </asp:Content>

