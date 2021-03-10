using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab3
{
    public class Service
    {
        private Customer CustomerPhone;
        private string ServiceType;
        private DateTime DateStarted;
        private DateTime DateCompleted;
        private string CompletionPercentage;
        private string ServiceDescription;

        public Service(Customer CustomerPhone, string ServiceType,
            DateTime DateStarted, DateTime DateCompleted, string CompletionPercentage,
            string ServiceDescription)
        {
            this.CustomerPhone = CustomerPhone;
            this.ServiceType = ServiceType;
            this.DateStarted = DateStarted;
            this.DateCompleted = DateCompleted;
            this.CompletionPercentage = CompletionPercentage;
            this.ServiceDescription = ServiceDescription;


        }

        public Customer CustomerPhoneV
        {
            get
            {
                return this.CustomerPhone;
            }

            set
            {
                this.CustomerPhone = value;
            }

        }

        public string ServiceTypeV
        {
            get
            {
                return this.ServiceType;
            }

            set
            {
                this.ServiceType = value;
            }

        }

        public DateTime DateStartedV
        {
            get
            {
                return this.DateStarted;
            }

            set
            {
                this.DateStarted = value;
            }

        }

        public DateTime DateCompletedV
        {
            get
            {
                return this.DateCompleted;
            }

            set
            {
                this.DateCompleted = value;
            }

        }

        public string CompletionPercentageV
        {
            get
            {
                return this.CompletionPercentage;
            }

            set
            {
                this.CompletionPercentage = value;
            }

        }

        public string ServiceDescriptionV
        {
            get
            {
                return this.ServiceDescription;
            }

            set
            {
                this.ServiceDescription = value;
            }

        }
    }


}