using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab3
{
    public class Customer
    {
        private string CustomerName;
        private int CustomerPhone;
        private string CustomerEmail;
        private string CustomerState;
        private string CustomerCity;
        private string CustomerZip;

        public Customer(string CustomerName, int CustomerPhone, string CustomerEmail, string CustomerState, string CustomerCity, string CustomerZip)
        {
            this.CustomerName = CustomerName;
            this.CustomerPhone = CustomerPhone;
            this.CustomerEmail = CustomerEmail;
            this.CustomerState = CustomerState;
            this.CustomerCity = CustomerCity;
            this.CustomerZip = CustomerZip;


        }

        public string CustomerNameV
        {
            get
            {
                return this.CustomerName;
            }
            set
            {
                this.CustomerName = value;
            }
        }

        public int CustomerPhoneV
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


        public string CustomerEmailV
        {
            get
            {
                return this.CustomerEmail;
            }
            set
            {
                this.CustomerEmail = value;
            }
        }

        public string CustomerStateV
        {
            get
            {
                return this.CustomerState;
            }
            set
            {
                this.CustomerState = value;
            }
        }


        public string CustomerCityV
        {
            get
            {
                return this.CustomerCity;
            }
            set
            {
                this.CustomerCity = value;
            }
        }

        public string CustomerZipV
        {
            get
            {
                return this.CustomerZip;
            }
            set
            {
                this.CustomerZip = value;
            }
        }

    }
}