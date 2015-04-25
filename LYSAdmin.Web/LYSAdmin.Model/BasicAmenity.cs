using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class BasicAmenity
    {
        public int AminityID { get; set; }
        public int HouseID { get; set; }
        public Nullable<bool> AC { get; set; }
        public Nullable<bool> Two_wheeler_open_parking { get; set; }
        public Nullable<bool> Wifi { get; set; }
        public Nullable<bool> Room_service { get; set; }
        public Nullable<bool> Fridge { get; set; }
        public Nullable<bool> Water_supply { get; set; }
        public Nullable<bool> Ward_robes { get; set; }
        public Nullable<bool> GYM { get; set; }
        public Nullable<bool> Party_Hall { get; set; }
        public Nullable<bool> Four_wheeler_open_parking { get; set; }
        public Nullable<bool> Common_TV { get; set; }
        public Nullable<bool> House_Keeping { get; set; }
        public Nullable<bool> Washing_machine { get; set; }
        public Nullable<bool> Hot_Cold_Water_Supply { get; set; }
        public Nullable<bool> Lockers { get; set; }
        public Nullable<bool> Swimming_pool { get; set; }
        public Nullable<bool> Lift { get; set; }
        public Nullable<bool> Attach_bathrooms { get; set; }
        public Nullable<bool> Two_wheeler_close_parking { get; set; }
        public Nullable<bool> Individual_TV { get; set; }
        public Nullable<bool> Security { get; set; }
        public Nullable<bool> Newspaper { get; set; }
        public Nullable<bool> Mineral_drinking_water { get; set; }
        public Nullable<bool> Intercom_facility { get; set; }
        public Nullable<bool> Playground { get; set; }
        public Nullable<bool> Club_house { get; set; }
        public Nullable<bool> Power_back_up { get; set; }
        public Nullable<bool> Four_wheeler_close_parking { get; set; }
        public Nullable<bool> LCD_TV_cable_connection { get; set; }
        public Nullable<bool> Emergency_Medical_Services { get; set; }
        public Nullable<bool> Ironing_washing_services { get; set; }
        public Nullable<bool> Aqua_guard { get; set; }
        public Nullable<bool> Video_Surveillance { get; set; }
        public Nullable<bool> Kitchen_Facility_with_Gas { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }

        public virtual House House { get; set; }
    }
}
