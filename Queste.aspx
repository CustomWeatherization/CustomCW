<%@ Page Language="C#" MasterPageFile="~/AddJobMaster.master" AutoEventWireup="true" CodeFile="Queste.aspx.cs" Inherits="Queste" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                 <div class="top_Btn_div">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="G" class="top_btn"
                     OnClientClick="return ValidateDateGSave();" /><%--OnClientClick="return ValidateDateG();"--%> <asp:Button ID="btnQuestionaire" runat="server" Text="Questionaire" class="top_btn"
                     /> <asp:Button ID="btnPrint" runat="server" Text="Print" class="top_btn" /> <asp:Button ID="btnSave" runat="server" Text="Save"  ValidationGroup="G"
                    OnClientClick="return ValidateDateGSave();" class="top_btn" /> <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                    CausesValidation="false" class="top_btn" />
            </div>

</asp:Content>

