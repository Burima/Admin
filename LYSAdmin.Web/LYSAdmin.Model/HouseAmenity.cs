using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class HouseAmenity
    {
        ublic int AminityID { get; set; }
        public int HouseID { get; set; }
        public Nullable<bool> AC { get; set; }
        public Nullable<bool> Fridge { get; set; }
        public Nullable<bool> Wifi { get; set; }
        public Nullable<bool> Washingmachine { get; set; }
        public Nullable<bool> AttachBathrooms { get; set; }
        public Nullable<bool> KitchenFacilityWithGas { get; set; }
        public Nullable<bool> CommonTV { get; set; }
        public Nullable<bool> IndividualTV { get; set; }
        public Nullable<bool> LCDTVCableConnection { get; set; }
        public Nullable<bool> Wardrobes { get; set; }
        public Nullable<bool> IntercomFacility { get; set; }
        public Nullable<bool> IroningWashingServices { get; set; }
        public Nullable<bool> LunchGiven { get; set; }
        public Nullable<bool> BreakFastGiven { get; set; }
        public Nullable<bool> DinnerGiven { get; set; }
        public Nullable<bool> WaterSupply { get; set; }
        public Nullable<bool> HotColdWaterSupply { get; set; }
        public Nullable<bool> MineralDrinkingWater { get; set; }
        public Nullable<bool> Aquaguard { get; set; }
        public Nullable<bool> Housekeeping { get; set; }
        public Nullable<bool> RoomService { get; set; }
        public Nullable<bool> Newspaper { get; set; }
        public Nullable<bool> TwoWheelerOpenParking { get; set; }
        public Nullable<bool> TwoWheelerCloseParking { get; set; }
        public Nullable<bool> FourWheelerOpenParking { get; set; }
        public Nullable<bool> FourWheelerCloseParking { get; set; }
        public Nullable<bool> Lockers { get; set; }
        public Nullable<bool> GYM { get; set; }
        public Nullable<bool> Lift { get; set; }
        public Nullable<bool> Playground { get; set; }
        public Nullable<bool> Clubhouse { get; set; }
        public Nullable<bool> Partyhall { get; set; }
        public Nullable<bool> Security { get; set; }
        public Nullable<bool> SwimmingPool { get; set; }
        public Nullable<bool> VideoSurveillance { get; set; }
        public Nullable<bool> Powerbackup { get; set; }
        public Nullable<bool> EmergencyMedicalServices { get; set; }
        public Nullable<bool> NonVegAllowed { get; set; }
        public Nullable<bool> GuardianEntry { get; set; }
        public Nullable<bool> NoSmoking { get; set; }
        public Nullable<bool> NoDrinking { get; set; }
        public Nullable<bool> NoBoysEntry { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
    
        public virtual House House { get; set; }
    }
}
