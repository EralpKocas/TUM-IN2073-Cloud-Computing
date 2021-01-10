module.exports = function (options) {
    //Import the mock data json file
    const mockData = require('./MOCK_DATA.json');

    //Add the patterns and their corresponding functions
    this.add('role:product,cmd:getProductURL', productURL);
    this.add('role:product,cmd:getProductName', productName);


    //To DO: add the pattern functions and describe the logic inside the function
    function productURL(args, done)
    {
        var product_id = args.productId;
        var bookURL = null; 
        for(var i=0; i < mockData.length; i++)
        {
            if (mockData[i].product_id == product_id)
            {
                bookURL = mockData[i].product_url;
            }
        }
        done(null, bookURL);
    }

    function productName(args, done)
    {
        var product_id = args.productId;
        var bookName = null; 
        for(var i=0; i < mockData.length; i++)
        {
            if (mockData[i].product_id == product_id)
            {
                bookName = mockData[i].product_name;
            }
        }
        done(null, bookName);
    }
}