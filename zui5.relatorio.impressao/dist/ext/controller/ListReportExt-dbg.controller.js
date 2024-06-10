sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {        
        
        onBeforeRendering: function () {
            var oButton = this.getView().byId("ButtonPrint");
             if (oButton) {
                oButton.setIcon("sap-icon://print");
         }
    },
        OnPressPrint: function(oEvent) {
            
            var aSelectedContexts = this.extensionAPI.getSelectedContexts();
            
            if (aSelectedContexts.length === 0) {
                MessageToast.show("Nenhum item selecionado.");
                return;
            }

            var selectedVbelns = [];
            aSelectedContexts.forEach(function(element) {
                let data = element.getModel().getObject(element.getPath());
                console.log('Selected Rows are => ', data);
                if (data && data.vbeln) {
                    selectedVbelns.push(data.vbeln);
                }
            });

            if (selectedVbelns.length > 0) {
                sap.ui.core.BusyIndicator.show(1);

                // MessageToast.show("Vbelns selecionados para impressão: " + selectedVbelns.join(", "));
                var deepLink = "https://vm43.4hub.cloud:44343/sap/bc/ui2/flp?sap-client=100&sap-language=PT#SalesOrderMsf-display";

                // Adicionar o parâmetro SalesOrder com seu valor ao Deep Link
                deepLink += "?SalesOrder=" + encodeURIComponent(selectedVbelns);
    
                // Abrir o Deep Link em uma nova janela ou guia do navegador
                window.open(deepLink, "_blank");
                sap.ui.core.BusyIndicator.hide();


            } else {
                MessageToast.show("Nenhum Vbeln encontrado nos itens selecionados.");
            }
        }
    };
});
