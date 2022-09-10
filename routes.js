var express = require('express');
var router = express.Router();


var ActivePackage = require('./Routes/Master/ActivePackageMast')
var CategoryMast = require('./Routes/Master/CategoryMast')
var SubCategoryMast = require('./Routes/Master/SubCategoryMast')
var UserCategoryMast = require('./Routes/Master/UserCategoryMast')
var UserMast = require('./Routes/Master/UserMast')
var All_InventoryMast = require('./Routes/Master/All_InventoryMast')
var MobileInventoryMast = require('./Routes/Master/MobileInventoryMast')
var MobileBrandMast = require('./Routes/Master/MobileBrandMast')
var CarFuelTypeMast = require('./Routes/Master/CarFuelTypeMast')
var CarSell_InventoryMast = require('./Routes/Master/CarSell_InventoryMast')
var CarRentInventoryMast = require('./Routes/Master/CarRentInventoryMast')
var CarBrandMast = require('./Routes/Master/CarBrandMast')
var PropertyInventorySellMast = require('./Routes/Master/PropertyInventorySellMast')
var PropertyStatusMast = require('./Routes/Master/PropertyStatusMast')
var PropertyInventoryRentMast = require('./Routes/Master/PropertyInventoryRentMast')
var PropertyTypeMast = require('./Routes/Master/PropertyTypeMast')
var PropertyListedByMast = require('./Routes/Master/PropertyListedByMast')
var PropertyFurnishingMast = require('./Routes/Master/PropertyFurnishingMast')
var PropertyCarParkingMast = require('./Routes/Master/PropertyCarParkingMast')
var PropertyPreferredRentersMast = require('./Routes/Master/PropertyPreferredRentersMast')
var OfficeInventoryMast = require('./Routes/Master/OfficeInventoryMast')
var BikeInventoryMast = require('./Routes/Master/BikeInventoryMast')
var VehicelTypeMast = require('./Routes/Master/VehicelTypeMast')
var CommVehicleInventoryMast = require('./Routes/Master/CommVehicleInventoryMast')
var JobTypeMast = require('./Routes/Master/JobTypeMast')
var PositionTypeMast = require('./Routes/Master/PositionTypeMast')
var SalaryPeriodMast = require('./Routes/Master/SalaryPeriodMast')
var JobInventoryMast = require('./Routes/Master/JobInventoryMast')
var NearLocationMast = require('./Routes/Master/NearLocationMast')
var Upload = require('./Routes/Master/UploadImage')
var ShowCategoryDataMast = require('./Routes/Master/ShowCategoryDataMast')
var FilterMast = require('./Routes/Master/FilterMast')
var AdStatusMast = require('./Routes/Master/AdStatusMast')
var AdsMast = require('./Routes/Master/AdsMast')
var FavouritesMast = require('./Routes/Master/FavouritesMast')
var DemoApi = require('./Routes/Master/DemoApi')
var AutocompleteMast = require('./Routes/Master/AutocompleteMast')
var PackagePriceMast = require('./Routes/Master/PackagePriceMast')
var MobileRamMast = require('./Routes/Master/MobileRamMast')
var MobileRomMast = require('./Routes/Master/MobileRomMast')
var CarModelNameMast = require('./Routes/Master/CarModelNameMast')
var CarOwnerMast = require('./Routes/Master/CarOwnerMast')
var YearMast = require('./Routes/Master/YearMast')
var CarRegistrationMast = require('./Routes/Master/CarRegistrationMast')
var CarTypeMast = require('./Routes/Master/CarTypeMast')
var PropertyBedroomMast = require('./Routes/Master/PropertyBedroomMast')
var PropertyBathroomMast = require('./Routes/Master/PropertyBathroomMast')
var BikeBrandMast = require('./Routes/Master/BikeBrandMast')
var CommercialBrandMast = require('./Routes/Master/CommercialBrandMast')
var OfficeTypeMast = require('./Routes/Master/OfficeTypeMast')
var OfficeWashroomMast = require('./Routes/Master/OfficeWashroomMast')
var OfficeCabinMast = require('./Routes/Master/OfficeCabinMast')
var OfficeFurnishingMast = require('./Routes/Master/OfficeFurnishingMast')
var OfficeCarParkingMast = require('./Routes/Master/OfficeCarParkingMast')
var OfficeListedByMast = require('./Routes/Master/OfficeListedByMast')
var OfficeEmployeeCapacityMast = require('./Routes/Master/OfficeEmployeeCapacityMast')
var PurchaseAdsMast = require('./Routes/Master/PurchaseAdsMast')
var PackageInventoryMast = require('./Routes/Master/PackageInventoryMast')
var ReportMessageMast = require('./Routes/Master/ReportMessageMast')
var ReportMast = require('./Routes/Master/ReportMast') 
var BannerMast = require('./Routes/Master/BannerMast')
var RejectedReasonsMast = require('./Routes/Master/RejectedReasonsMast')
var UserFollowersMast = require('./Routes/Master/UserFollowersMast')
var DynamicFieldMast = require('./Routes/Master/DynamicFieldMast')
var DisplayTypeMast = require('./Routes/Master/DisplayTypeMast')
var StateMast = require('./Routes/Master/StateMast')
var SponsoredRecommendadtionsMast = require('./Routes/Master/SponsoredRecommendationsMast')
var DeviceMast = require('./Routes/Master/DeviceMast')
var DeviceTokenMast = require('./Routes/Master/DeviceTokenMast')
var getDropDownData = require('./Routes/Master/getDropDownData')

const userRoute = require("./Routes/Master/route")

router.use('/ActivePackage',ActivePackage);

router.use('/CategoryMast',CategoryMast);
router.use('/SubCategoryMast',SubCategoryMast);
router.use('/UserCategoryMast',UserCategoryMast);
router.use('/UserMast',UserMast);
router.use('/All_InventoryMast',All_InventoryMast);
router.use('/MobileInventoryMast',MobileInventoryMast);
router.use('/MobileBrandMast',MobileBrandMast);
router.use('/CarFuelTypeMast',CarFuelTypeMast);
router.use('/CarSell_InventoryMast',CarSell_InventoryMast);
router.use('/CarRentInventoryMast',CarRentInventoryMast);
router.use('/CarBrandMast',CarBrandMast);
router.use('/PropertyInventorySellMast',PropertyInventorySellMast);
router.use('/PropertyStatusMast',PropertyStatusMast);
router.use('/PropertyInventoryRentMast',PropertyInventoryRentMast);
router.use('/PropertyTypeMast',PropertyTypeMast);
router.use('/PropertyListedByMast',PropertyListedByMast);
router.use('/PropertyFurnishingMast',PropertyFurnishingMast);
router.use('/PropertyCarParkingMast',PropertyCarParkingMast);
router.use('/PropertyPreferredRentersMast',PropertyPreferredRentersMast);
router.use('/OfficeInventoryMast',OfficeInventoryMast);
router.use('/BikeInventoryMast',BikeInventoryMast);
router.use('/VehicelTypeMast',VehicelTypeMast);
router.use('/CommVehicleInventoryMast',CommVehicleInventoryMast);
router.use('/JobTypeMast',JobTypeMast);
router.use('/PositionTypeMast',PositionTypeMast);
router.use('/SalaryPeriodMast',SalaryPeriodMast);
router.use('/JobInventoryMast',JobInventoryMast);
router.use('/NearLocationMast',NearLocationMast);
router.use('/Upload',Upload);
router.use('/ShowCategoryDataMast',ShowCategoryDataMast);
router.use('/FilterMast',FilterMast);
router.use('/AdStatusMast',AdStatusMast);
router.use('/AdsMast',AdsMast);
router.use('/FavouritesMast',FavouritesMast);
router.use('/DemoApi',DemoApi);
router.use('/AutocompleteMast',AutocompleteMast);
router.use('/PackagePriceMast',PackagePriceMast);
router.use('/MobileRamMast', MobileRamMast);
router.use('/MobileRomMast', MobileRomMast);
router.use('/CarModelNameMast', CarModelNameMast);
router.use('/CarOwnerMast', CarOwnerMast);
router.use('/YearMast', YearMast);
router.use('/CarRegistrationMast', CarRegistrationMast);
router.use('/CarTypeMast', CarTypeMast);
router.use('/PropertyBedroomMast', PropertyBedroomMast);
router.use('/PropertyBathroomMast', PropertyBathroomMast);
router.use('/BikeBrandMast', BikeBrandMast);
router.use('/CommercialBrandMast', CommercialBrandMast);
router.use('/OfficeTypeMast',OfficeTypeMast);
router.use('/OfficeWashroomMast', OfficeWashroomMast);
router.use('/OfficeCabinMast', OfficeCabinMast);
router.use('/OfficeFurnishingMast', OfficeFurnishingMast);
router.use('/OfficeCarParkingMast', OfficeCarParkingMast);
router.use('/OfficeListedByMast', OfficeListedByMast);
router.use('/OfficeEmployeeCapacityMast', OfficeEmployeeCapacityMast);
router.use('/PurchaseAdsMast', PurchaseAdsMast);
router.use('/PackageInventoryMast', PackageInventoryMast);
router.use('/ReportMessageMast', ReportMessageMast);
router.use('/ReportMast', ReportMast);
router.use('/BannerMast', BannerMast);
router.use('/RejectedReasonsMast', RejectedReasonsMast);
router.use('/UserFollowersMast', UserFollowersMast);
router.use('/DynamicFieldMast', DynamicFieldMast);
router.use('/DisplayTypeMast', DisplayTypeMast);
router.use('/StateMast', StateMast);
router.use('/SponsoredRecommendadtionsMast', SponsoredRecommendadtionsMast);
router.use('/DeviceMast', DeviceMast);
router.use('/DeviceTokenMast', DeviceTokenMast);
router.use('/getDropDownData', getDropDownData);
router.use("/",userRoute);

module.exports = router;