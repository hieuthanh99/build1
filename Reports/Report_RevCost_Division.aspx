﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Report_RevCost_Division.aspx.cs" Inherits="Report_RevCost_Division" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v20.2, Version=20.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script src="../Scripts/jquery.signalR-2.4.3.js"></script>
    <script src="../signalr/hubs"></script>
    <script>
        function ClientPrintReportButton_Click(s, e) {
            if (ClientReport.GetValue() == null)
                return;
            DoCallback(ClientViewReportPanel, function () {
                ClientViewReportPanel.PerformCallback('GenerateExcel');
            });
        }

        function func_init(s, e) {
            ClientcboCompany.SetValue(1);
            var year = (new Date()).getFullYear();
            ClientYear.SetValue(year);
            DoCallback(ClientcboVersion, function () {
                ClientcboVersion.PerformCallback(year);
            });

        };

        function ClientYear_ValueChanged(s, e) {
            DoCallback(ClientcboVersion, function () {
                ClientcboVersion.PerformCallback(s.GetValue());
            });
        }
    </script>
    <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Orientation="Horizontal" Width="100%" Height="100%" SeparatorVisible="false">
        <Panes>
            <dx:SplitterPane Size="350" ScrollBars="Auto">
                <PaneStyle>
                    <BorderTop BorderWidth="0" />
                    <Paddings PaddingBottom="0" PaddingRight="0" PaddingTop="0" PaddingLeft="0" />
                </PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <dx:ASPxFormLayout ID="ParameterForm" runat="server" Width="100%" RequiredMarkDisplayMode="Auto" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption" ClientInstanceName="ClientParameterForm"
                            AlignItemCaptionsInAllGroups="true" ClientSideEvents-Init="func_init">
                            <Items>
                                <dx:LayoutGroup Caption="Danh sách báo cáo">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxRadioButtonList ID="rdReport" runat="server" ClientInstanceName="ClientReport">
                                                        <ClientSideEvents ValueChanged="function(s,e){
                                                                ClientcboVersion.SetEnabled(true);
                                                                ClientcboCompany.SetEnabled(false);
                                                                    
                                                   
                                                                ClientcboFromMonth.SetEnabled(false);
                                                                ClientcboToMonth.SetEnabled(false);
                                                                if(s.GetValue() == 'RevCostQuantityCOMP' || s.GetValue() == 'ReportKehoachThuchiLVTM' 
                                                                || s.GetValue() == 'ReportKehoachThuchiLVTM_NT' || s.GetValue() == 'ReportPhantichCauthanhTongChiPhiKhoi' ||s.GetValue() == 'ReportKehoachThuchiLVTM_TheoTK')
                                                                {
                                                                    ClientcboVersion.SetEnabled(true);
                                                                    ClientcboCompany.SetEnabled(true);
                                                                    ClientcboFromMonth.SetEnabled(true);
                                                                    ClientcboToMonth.SetEnabled(true);


                                                                }
                                                                else if(s.GetValue() == 'RevCostQuantityALL' || s.GetValue() == 'RevCostQuantityAREA'  )
                                                                {
                                                                    ClientcboVersion.SetEnabled(true);                                                                    
                                                                    ClientcboFromMonth.SetEnabled(true);
                                                                    ClientcboToMonth.SetEnabled(true);
                                                                }
                                                                else if(s.GetValue() == 'KHDTNAM')
                                                                {
                                                                    ClientcboVersion.SetEnabled(false);
                                                                    ClientcboCompany.SetEnabled(false);
                                                                  

                                                                
                                                                    ClientcboFromMonth.SetEnabled(false);
                                                                    ClientcboToMonth.SetEnabled(false);
                                                                }
                                                                else if (s.GetValue() =='RevCost_DanhGia_KH_Division')
                                                                {
                                                                   
                                                                    ClientcboCompany.SetEnabled(true);
                                                                    ClientcboVersion.SetEnabled(true);
                                                                  
                                                                    ClientcboFromMonth.SetEnabled(true);
                                                                    ClientcboToMonth.SetEnabled(true);
                                                                }
                                                                else if (s.GetValue() =='SummaryByDivision' || s.GetValue() =='SummaryByMonth')
                                                                {
                                                                    ClientcboVersion.SetEnabled(true);
                                                                    ClientcboCompany.SetEnabled(false);
                                                                    
                                                              
                                                                    ClientcboFromMonth.SetEnabled(true);
                                                                    ClientcboToMonth.SetEnabled(true);
                                                                }
                                                                else
                                                                {
                                                                    ClientcboVersion.SetEnabled(true);
                                                                    ClientcboCompany.SetEnabled(false);
                                                                    
                                                                
                                                                    ClientcboFromMonth.SetEnabled(false);
                                                                    ClientcboToMonth.SetEnabled(false);
                                                                }
                                                            }"></ClientSideEvents>
                                                        <Items>
                                                            
                                                       <%--     <dx:ListEditItem Value="ReportKehoachThuchiLVTM" Text="Báo cáo kế hoạch thu chi LVTM" />
                                                            <dx:ListEditItem Value="ReportKehoachThuchiLVTM_NT" Text="Báo cáo kế hoạch thu chi theo đơn vị" />
                                                            <dx:ListEditItem Value="ReportPhantichCauthanhTongChiPhiKhoi" Text="Báo cáo phân tích cấu thành chi phí khối" />
                                                   --%>         <%--<dx:ListEditItem Value="RevCostQuantityALL" Text="Sản xuất kinh doanh 12 tháng (Tổng hợp)" />
                                                            <dx:ListEditItem Value="RevCostQuantityCOMP" Text="Sản xuất kinh doanh đơn vị, khối" />
                                                            <dx:ListEditItem Value="RevCostQuantityAREA" Text="Sản xuất kinh doanh 12 tháng (Area)" />--%>
                                                            <%-- <dx:ListEditItem Value="KHDTNAM" Text="Kế hoạch đầu tư năm" />--%>
                                                           <%-- <dx:ListEditItem Value="RevCost_DanhGia_KH_Division" Text="Đánh giá thưc hiện KH chi tiết theo Hộ" Selected="true" />
                                                            <dx:ListEditItem Value="SummaryByMonth" Text="Tổng hợp" />--%>
                                                        </Items>
                                                        <Border BorderStyle="None" />
                                                    </dx:ASPxRadioButtonList>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Tham số báo cáo">
                                    <Items>
                                        <dx:LayoutItem Caption="Năm">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxSpinEdit ID="seYear" runat="server" Width="160px" ClientInstanceName="ClientYear">
                                                        <ClientSideEvents ValueChanged="ClientYear_ValueChanged" />
                                                    </dx:ASPxSpinEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Version báo cáo">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cboVersion" runat="server" Width="160px" OnCallback="cboVersion_Callback" ClientInstanceName="ClientcboVersion"></dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Nhóm đơn vị">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cboGroupUnit" runat="server" Width="160px" OnInit="cboGroupUnit_Init" ClientInstanceName="ClientGroupUnit"
                                                        ValueType="System.String">
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Đơn vị">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cboCompany" runat="server" Width="160px" OnInit="cboCompany_Init" ClientInstanceName="ClientcboCompany"
                                                        ValueType="System.Int32">
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>

                                        <dx:LayoutItem Caption="From Month">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cboFromMonth" runat="server" Width="120px" OnInit="cboFromMonth_Init" ClientInstanceName="ClientcboFromMonth"></dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="To Month">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cboToMonth" runat="server" Width="120px" OnInit="cboToMonth_Init" ClientInstanceName="ClientcboToMonth"></dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>


                                        <%--<dx:LayoutItem Caption="From Date">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxDateEdit ID="dtFromDate" runat="server" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" Width="100px">
                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidateOnLeave="true" SetFocusOnError="true" ErrorTextPosition="Right">
                                                            <RequiredField IsRequired="True" ErrorText="From Date is required" />
                                                        </ValidationSettings>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="To Date">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxDateEdit ID="dtToDate" runat="server" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" Width="100px">
                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidateOnLeave="true" SetFocusOnError="true" ErrorTextPosition="Right">
                                                            <RequiredField IsRequired="True" ErrorText="To Date is required" />
                                                        </ValidationSettings>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>--%>

                                        <%--  <dx:LayoutItem Caption="Format">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cboPormat" runat="server" ValueType="System.String">
                                                        <Items>
                                                            <dx:ListEditItem Value="XLSX" Text="XLSX" />
                                                            <dx:ListEditItem Value="PDF" Text="PDF" />
                                                            <dx:ListEditItem Value="RTF" Text="RTF" />
                                                            <dx:ListEditItem Value="HTML" Text="HTML" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>--%>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:EmptyLayoutItem></dx:EmptyLayoutItem>

                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxButton ID="btnPrintReport" runat="server" Text="Xem báo cáo" AutoPostBack="false" ClientInstanceName="ClientPrintReportButton" UseSubmitBehavior="true">
                                                <%-- <ClientSideEvents Click="function(s, e) { ClientReportViewer.Refresh(); }" />   --%>
                                                <ClientSideEvents Click="ClientPrintReportButton_Click" />
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                            <Styles>
                                <LayoutGroupBox>
                                    <Caption CssClass="layoutGroupBoxCaption"></Caption>
                                </LayoutGroupBox>
                            </Styles>
                        </dx:ASPxFormLayout>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <%-- <dx:SplitterPane ScrollBars="Auto">
                <PaneStyle>
                    <BorderTop BorderWidth="0" />
                    <Paddings PaddingBottom="0" PaddingRight="0" PaddingTop="0" PaddingLeft="0" />
                </PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <dx:ASPxDocumentViewer ID="ReportViewer" runat="server" Width="100%" Height="100%"
                            ClientInstanceName="ClientReportViewer" StylesSplitter-SidePaneWidth="208">
                            <SettingsReportViewer PageByPage="false" TableLayout="false" EnableRequestParameters="false"></SettingsReportViewer>
                            <SettingsSplitter SidePanePosition="Left"></SettingsSplitter>

                            <StylesSplitter SidePaneWidth="208px"></StylesSplitter>
                            <ToolbarItems>
                                <dx:ReportToolbarButton ItemKind="Search" />
                                <dx:ReportToolbarSeparator />
                                <dx:ReportToolbarButton ItemKind="PrintReport" />
                                <dx:ReportToolbarButton ItemKind="PrintPage" />
                                <dx:ReportToolbarSeparator />
                                <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                                <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                                <dx:ReportToolbarLabel ItemKind="PageLabel" />
                                <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px" />
                                <dx:ReportToolbarLabel ItemKind="OfLabel" />
                                <dx:ReportToolbarTextBox ItemKind="PageCount" />
                                <dx:ReportToolbarButton ItemKind="NextPage" />
                                <dx:ReportToolbarButton ItemKind="LastPage" />
                                <dx:ReportToolbarSeparator />
                                <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                                    <Elements>
                                        <dx:ListElement Value="xlsx" />
                                        <dx:ListElement Value="pdf" />
                                        <dx:ListElement Value="xls" />
                                        <dx:ListElement Value="rtf" />
                                        <dx:ListElement Value="mht" />
                                        <dx:ListElement Value="html" />
                                        <dx:ListElement Value="txt" />
                                        <dx:ListElement Value="csv" />
                                        <dx:ListElement Value="png" />
                                    </Elements>
                                </dx:ReportToolbarComboBox>
                                <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                            </ToolbarItems>
                        </dx:ASPxDocumentViewer>

                        <dx:ASPxSpreadsheet ClientInstanceName="ClientSpreadSheet" ID="ASPxSpreadsheet1" runat="server" RibbonMode="OneLineRibbon"  Width="100%" Height="100%" WorkDirectory="~/App_Data/WorkDirectory" ShowConfirmOnLosingChanges="False"  ReadOnly="True" EncodeHtml="True"></dx:ASPxSpreadsheet>

                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>--%>

            <dx:SplitterPane ScrollBars="Auto">
                <PaneStyle>
                    <BorderTop BorderWidth="0" />
                    <Paddings PaddingBottom="0" PaddingRight="0" PaddingTop="0" PaddingLeft="0" />
                </PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" Height="100%" ClientInstanceName="ClientViewReportPanel" RenderMode="Div" OnCallback="ASPxCallbackPanel1_Callback">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" Width="100%" Height="100%" ShowConfirmOnLosingChanges="false" ShowSheetTabs="false" RibbonMode="OneLineRibbon">
                                        <Border BorderWidth="0" />
                                    </dx:ASPxSpreadsheet>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>

</asp:Content>

