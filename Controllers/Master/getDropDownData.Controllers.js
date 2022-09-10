const connection = require('../../db/mysql')
const jwt = require("jsonwebtoken")
const multer = require('multer')

exports.getDroupDown = async (req, res) => {
    var form = multer().array([]);
    await form(req, res, async (err) => {
        let Res = []
        try {
            let Bike_brand = await BikeBrand(); let car_brand = await CarBrand(); let Car_fule = await CarFuel();
            let car_owner = await CarOwner(); let car_type = await CarType(); let commercial_brand = await CommericalBrand();
            let job_type = await JobType(); let office_cabin = await OfficeCabin(); let office_car_parking = await OfficeCarParking();
            let office_employee_capacity = await OfficeEmployeeCapacity(); let office_furnishing = await OfficeFurnishing();
            let office_listed = await OfficeListed(); let office_type = await OfficeType();
            let office_washroom = await OfficeWashroom(); let position_type = await PositionType();
            let property_bathroom = await PropeertyBathroom(); let property_car_parking = await PropertyCarParking();
            let property_furnishing = await PropertyFurnishing(); let property_bedroom = await PropertyBedroom();
            let property_listed = await PropertyListed(); let property_preferred = await PropertyPreferred();
            let property_type = await PropertyTypeMast(); let salary_period = await SalaryPeriod();
            let vehicle_type = await VehicleType(); let year_mast = await YeaMast();
            let mobile_brand = await MobileBrandMast(); let mobile_rom = await MobileRom();
            let mobile_ram = await MoobileRam(); let car_model = await CarModel(); let property_status = await PropertyStatusMast();
            let carreg = await CarReg();

            Res.push({
                "bike": Bike_brand, "carbrand": car_brand, "carfule": Car_fule, "CarOwner": car_owner, "CarType": car_type, "combrand": commercial_brand,
                "jobtype": job_type, "officecabin": office_cabin, "officecarparking": office_car_parking, "officeemployeecapacity": office_employee_capacity,
                "officeFurnishing": office_furnishing, "officeListed": office_listed, "officeType": office_type, "officeWashroom": office_washroom,
                "WorkType": position_type, "propertyBathroom": property_bathroom, "propertyCarParking": property_car_parking,
                "propertyFurnishing": property_furnishing, "propertyBedroom": property_bedroom, "propertyListed": property_listed,
                "propertyPreferred": property_preferred, "salaryPeriod": salary_period, "propertyType": property_type,
                "vehicleType": vehicle_type, "yearMast": year_mast, "mobileBrand": mobile_brand, "mobileRom": mobile_rom, "mobileRam": mobile_ram,
                "CarModelType":car_model,   "PropertyStatus":property_status,   "CarRegistration":carreg

            })
            let Responce = Res[0]
            res.status(200).json({ success: 1, data: Responce })
        } catch (err) {
            console.log(err);
            res.status(500).json({ success: 0, data: err })
        }

    });
}


function BikeBrand() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,name as value FROM bike_brand_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);
            }
        });
    });
}
function CarBrand() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT car_brand_id as id,car_brand_name as value FROM car_brand_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function CarFuel() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT car_fuel_id as id,car_fuel_name as value FROM car_fuel_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function CarOwner() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,name as value FROM car_owner_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function CarReg() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id,value FROM car_registration_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function CarType() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM car_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function CommericalBrand() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,name as value FROM commercial_brand_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function JobType() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT j_type_id as id,j_type_name as value FROM job_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function CarModel() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,name as value FROM car_model_name_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeCabin() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_cabin_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeCarParking() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_car_parking_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeEmployeeCapacity() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_employee_capacity_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeFurnishing() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_furnishing_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeListed() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_listed_by_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeType() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function OfficeWashroom() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM office_washroom_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PositionType() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_type_id as id,p_type_name as value FROM position_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropeertyBathroom() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id,value as value FROM property_bathroom_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyBedroom() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id,value FROM property_bedroom_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyCarParking() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_car_parking_id as id,p_car_parking_name as value FROM property_car_parking_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyFurnishing() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_furnishing_id as id,p_furnishing_name as value FROM property_furnishing_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyStatusMast() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_status_id as id,p_status_title as value FROM property_status_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyListed() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_listed_by_id as id,p_listed_by_name as value FROM property_listed_by_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyPreferred() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_preferred_renters_id as id,p_preferred_renters_name as value FROM property_preferred_renters_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function PropertyTypeMast() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT p_type_id as id,p_type_name as value FROM property_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function SalaryPeriod() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT s_p_id as id,s_p_name as value FROM salary_period_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function VehicleType() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT v_type_id as id,v_type_name as value FROM vehicle_type_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function YeaMast() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id,value FROM year_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function MobileBrandMast() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT brand_id as id, brand_name as value FROM mobile_brand_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function MobileRom() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id, value as value FROM mobile_rom_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}
function MoobileRam() {
    return new Promise(function (resolve, reject) {

        connection.query('SELECT id as id, value as value FROM mobile_ram_mast', async (err, result) => {
            if (err) {
                resolve(err);
            } else {
                resolve(result);

            }
        });
    });
}