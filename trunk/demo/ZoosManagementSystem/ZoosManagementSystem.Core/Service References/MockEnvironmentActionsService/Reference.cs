﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión del motor en tiempo de ejecución:2.0.50727.4927
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ZoosManagementSystem.Core.MockEnvironmentActionsService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="MockEnvironmentActionsService.IEnvironmentActionsService")]
    public interface IEnvironmentActionsService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnvironmentActionsService/ModifyTemperature", ReplyAction="http://tempuri.org/IEnvironmentActionsService/ModifyTemperatureResponse")]
        void ModifyTemperature(System.Guid environmentId, float temperatureOffset);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnvironmentActionsService/ModifyLuminosity", ReplyAction="http://tempuri.org/IEnvironmentActionsService/ModifyLuminosityResponse")]
        void ModifyLuminosity(System.Guid environmentId, float luminosityOffset);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnvironmentActionsService/ModifyHumidity", ReplyAction="http://tempuri.org/IEnvironmentActionsService/ModifyHumidityResponse")]
        void ModifyHumidity(System.Guid environmentId, float humidityOffset);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEnvironmentActionsService/FeedAnimal", ReplyAction="http://tempuri.org/IEnvironmentActionsService/FeedAnimalResponse")]
        void FeedAnimal(System.Guid environmentId, System.Guid animalId, System.Guid feedingId, int amount);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public interface IEnvironmentActionsServiceChannel : ZoosManagementSystem.Core.MockEnvironmentActionsService.IEnvironmentActionsService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public partial class EnvironmentActionsServiceClient : System.ServiceModel.ClientBase<ZoosManagementSystem.Core.MockEnvironmentActionsService.IEnvironmentActionsService>, ZoosManagementSystem.Core.MockEnvironmentActionsService.IEnvironmentActionsService {
        
        public EnvironmentActionsServiceClient() {
        }
        
        public EnvironmentActionsServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public EnvironmentActionsServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EnvironmentActionsServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EnvironmentActionsServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public void ModifyTemperature(System.Guid environmentId, float temperatureOffset) {
            base.Channel.ModifyTemperature(environmentId, temperatureOffset);
        }
        
        public void ModifyLuminosity(System.Guid environmentId, float luminosityOffset) {
            base.Channel.ModifyLuminosity(environmentId, luminosityOffset);
        }
        
        public void ModifyHumidity(System.Guid environmentId, float humidityOffset) {
            base.Channel.ModifyHumidity(environmentId, humidityOffset);
        }
        
        public void FeedAnimal(System.Guid environmentId, System.Guid animalId, System.Guid feedingId, int amount) {
            base.Channel.FeedAnimal(environmentId, animalId, feedingId, amount);
        }
    }
}