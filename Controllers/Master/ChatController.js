const connection = require('./../../db/mysql');

const quickBoxUser = (req,res) => {
    try{
        const userId  = req.user
        if(!userId && userId == undefined ){
            res.status(400).json({ data: [{ message: "Enexpacted token" }] })
        }
        if(!req.body.quickbox_id){
            res.status(400).json({ data: [{ message: "Quickbox id is required" }] })
        }
        let lquery="select * from user_mast where user_id=?";
        connection.query(lquery,[userId],(error,data) =>{
            if(error){
                res.status(500).json({ success: 0, data: error })
            }else{
                if(data.length > 0){
                    let upQuery = 'update user_mast set quickbox_id = ? where user_id=?';
                    connection.query(upQuery,[req.body.quickbox_id,userId],(err,re) => {
                        if(err){
                            res.status(500).json({ success: 0, data: err })
                        }else{
                            console.log('res',re);
                            connection.query(lquery,[userId],(e, result) => {
                                if(e){
                                    res.status(500).json({ success: 0, data: e })
                                }else{
                                    res.status(200).json({ success: 1, data: result})
                                }
                            });
                        }
                    })

                }else{
                    res.status(400).json({ data: [{ message: "User not found" }] })
                }
            }
        })
    }catch (err) {
        res.status(500).json({ success: 0, data: err })
    }
}


module.exports = {
    quickBoxUser
}