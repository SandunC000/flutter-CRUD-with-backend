const express = require('express');
const mongoose = require('mongoose');
const app = express();
const Product = require("./product");
app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);

// const productData = [];

//connect to mongoose
mongoose.set('strictQuery', true);
mongoose.connect("mongodb+srv://sanduncooray000:0713209287@cluster0.6ul68ek.mongodb.net/flutter");

mongoose.connection.on('error', console.error.bind(console, 'Connection error:'));
mongoose.connection.once('open', () => {
    console.log("Connected to MongoDB");

    //post api
    app.post('/api/add_product', async (req, res) => {
        console.log('Result', req.body);
        let data = Product(req.body);
        try {
            let dataToStore = await data.save();
            res.status(200).json(dataToStore);
        } catch (error) {
            res.status(400).json({
                'status': error.message
            })
        }
        // const pdata = {
        //     id: productData.length + 1,
        //     pname: req.body.pname,
        //     pprice: req.body.pprice,
        //     pdesc: req.body.pdesc,
        // };
        // productData.push(pdata);

        // res.status(200).send({
        //     status_code: 200,
        //     message: 'Product added successfully',
        //     product: pdata,
        // });
    });

    //get by id api
    // app.get("/api/get_product/:id", async (req, res) => {
    //     try {
    //         let data = await Product.findById(req.params.id);
    //         res.status(200).json(data);
    //     } catch (error) { res.status(500).json(error.message) }

    //     if (productData.length > 0) {
    //         res.status(200).send({
    //             'status_code': 200,
    //             'products': productData
    //         })
    //     } else {
    //         res.status(200).send({
    //             'status_code': 200,
    //             'products': []
    //         })

    //     }
    // })

    //get api
    app.get("/api/get_product", async (req, res) => {
        try {
            let data = await Product.find();
            const responseObject = { products: data.map(product => ({ ...product.toObject(), id: product._id })) };
            res.setHeader('Content-Type', 'application/json');
            // res.status(200).json(data);
            res.send(JSON.stringify(responseObject));

        } catch (error) { res.status(500).json(error.message) }
    })

    //update api put
    // app.put("/api/update/:id", (req, res) => {
    //     let id = req.params.id * 1;
    //     let productToUpdate = productData.find(p => p.id === id);
    //     let index = productData.indexOf(productToUpdate);

    //     productData[index] = req.body;

    //     res.status(200).send({
    //         'status': "success",
    //         'message': "product updated",
    //     })
    // })

    //update api patch
    app.patch("/api/update/:id", async (req, res) => {
        let id = req.params.id;
        let updatedData = req.body;
        let options = { new: true };

        try {
            const data = await Product.findByIdAndUpdate(id, updatedData, options);
            res.send(data);
        } catch (error) {
            res.send(error.message);
        }
    })

    //delete api
    app.post("/api/delete/:id", async (req, res) => {
        let id = req.params.id;
        try{
            const data = await Product.findByIdAndDelete(id);
            res.send({
                'status' : 'Deleted the product ${data.pname}'  
            });
        } catch (error) {
            res.status(500).send(error.message);
        }
    })
});

app.listen(2000, () => {
    console.log('connected to server at 2000');
});