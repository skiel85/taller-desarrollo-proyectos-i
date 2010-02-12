﻿using System.ServiceProcess;
using ZoosManagmentSystem.Core.Switch;
using ZoosManagementSystem.Core.Storage;
using System.Collections.Generic;
using ZoosManagmentSystem.Core.Foundation;
using ZoosManagmentSystem.Core.Switch.Sensor;
using ZoosManagmentSystem.Core.Foundation.Sensor;
using ZoosManagementSystem.Core.Switch.Service;
using System;
using System.Threading;

namespace ZoosManagementSystem.Core
{
    public partial class ZoosManagementSystemService : ServiceBase
    {
        private List<SensorManager> sensorManagers;
        private DbHelper dbHelper;

        public ZoosManagementSystemService()
        {
            InitializeComponent();
            this.sensorManagers = new List<SensorManager>();
        }

        protected override void OnStart(string[] args)
        {
            this.LoadDataFromStorage();
            this.StartSensorManagers();
        }

        private void StartSensorManagers()
        {
            foreach (SensorManager sensorManager in this.sensorManagers)
            {
                sensorManager.Start();
            }

            Thread feedingServiceThread = new Thread(new ThreadStart(this.StartFeedingService));
        }

        private void StartFeedingService()
        {
            MockFeedingService mockFeedingService = new MockFeedingService();
            try
            {
                mockFeedingService.Initialize();
                mockFeedingService.Start();
            }
            catch (Exception)
            {

            }
        }

        private void LoadDataFromStorage()
        {
            this.dbHelper = new DbHelper();

            List<Sensor> sensors = this.dbHelper.GetSensors();

            foreach (Sensor sensor in sensors)
            {
                this.sensorManagers.Add(new MockSensorManager(sensor.Name, 3000, sensor.Environment.Id));
            }
        }

        protected override void OnStop()
        {
        }
    }
}
