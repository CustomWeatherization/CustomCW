<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    CodeFile="JobStatusMenu.aspx.cs" Inherits="JobStatusMenu" Title="Job Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Owl Carousel Assets -->
    <link href="owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="owl-carousel/owl.theme.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- form section -->
    <div id="JobStatus" runat="server" class="jobstatus">
        <h1>
            Jobs Status And Count By Utility Company</h1>

        <%if (dt_jobMenu.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobMenu.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsStatus.aspx?UC=<%=dt_jobMenu.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobMenu.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobMenu.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_jobPPLZ1.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobPPLZ1.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsStatus.aspx?UC=<%=dt_jobPPLZ1.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobPPLZ1.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobPPLZ1.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_jobPPLZ2.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobPPLZ2.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsStatus.aspx?UC=<%=dt_jobPPLZ2.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobPPLZ2.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobPPLZ2.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_jobPPLZ3.Rows.Count > 0)
          {
              for (int i = 0; i < dt_jobPPLZ3.Rows.Count; i++)
              {
        %>
        <div class="circle_btn">
            <a href="JobsStatus.aspx?UC=<%=dt_jobPPLZ3.Rows[i]["UtilityCompany"].ToString()%>">
                <%=dt_jobPPLZ3.Rows[i]["UtilityCompany"].ToString()%></a> <span class="count">
                    <%=dt_jobPPLZ3.Rows[i]["NumberofJobs"].ToString()%></span>
        </div>
        <%}
          } %>
        <%if (dt_AllJob.Rows.Count > 0)
          {  
        %>
        <div class="circle_btn">
            <a href="JobsStatus.aspx?UC=All">All Job</a> <span class="count">
                <%=AllJob%></span>
        </div>

        <%} %>
    </div>
    <div id="VendorJob" runat="server" class="span12 jobstatus">
        <h1>
        
             Account Status And Count By Vendor</h1>
        <div id="owl-demo" class="owl-carousel">
            <div class="item">
                <%if (dt_jobvendor.Rows.Count > 0)
                  {
                      for (int i = 0; i < dt_jobvendor.Rows.Count; i++)
                      {
                       %>
                <div class="circle_btn">
                    <a href="DisplayJobSearchRecords.aspx?Jobs=<%=dt_jobvendor.Rows[i]["JobNumber"].ToString()%>&InvoiceNo=1&GT=Vendor&Back=DisplayJobSearchRecords">
                        <%=dt_jobvendor.Rows[i]["JobNumber"].ToString()%></a> <span class="count">
                            <%=dt_jobvendor.Rows[i]["InvoiceId"].ToString()%></span>
                </div>
                <%
                    }
                  }
                           %>
                           
        <div class="circle_btn">
         <a href="VendorPayments.aspx">All Accts </br>Payable</a>
             
        </div>
            </div>
        </div>
        <div class="owl-buttons">
            <a class="prev">Previous</a>
            <a class="next">Next</a>    
        </div>
    </div>
    <div class="btmsubmit" style="clear: both;">
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
            class="btn_all" />
        <%--<input name="" type="submit" value="Cancel" />--%>
    </div>

    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>

    <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {

        var owl = $("#owl-demo");

        owl.owlCarousel({

        items : 1, //10 items above 1000px browser width
        itemsDesktop : [1000,5], //5 items between 1000px and 901px
        itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
        itemsTablet: [600,2], //2 items between 600 and 0;
        pagination : false,
        itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option      
        });

      // Custom Navigation Events
      $(".next").click(function(){
        owl.trigger('owl.next');
      })
      $(".prev").click(function(){
        owl.trigger('owl.prev');
      })    


    });
    </script>

    <!-- end form section -->
</asp:Content>
