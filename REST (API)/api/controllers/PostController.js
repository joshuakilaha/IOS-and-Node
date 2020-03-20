

module.exports = {
  posts: async function(req, res) {

    try {
      const posts = await Post.find()
      res.send(posts)
    } catch (e) {
      res.serverError(e.toString())
    }

// Post.find().exec(function (err, posts) {
//    if (err) {
//      return res.serverError(err.toString())
//     }
//   res.send(posts)
// })

  //  res.send(allPosts)
  },



  //Creating Item

  // create: function(req, res) {
  //
  //   const _itemName = req.body.itemName
  //   const _itemDescription = req.body.itemDescription
  //   const _itemPrice = req.body.itemPrice
  //
  //     //Show in console
  //   sails.log.debug('Item Name:' + "" + _itemName)
  //   sails.log.debug('Item Description' + " " + _itemDescription)
  //   sails.log.debug('Item Price' + " "  + _itemPrice)
  //
  //   Post.create({itemName: _itemName, itemDescription: _itemDescription, itemPrice: _itemPrice})
  //     .exec(function (err) {
  //         if (err) {
  //           return res.serverError(err.toString())
  //         }
  //         console.log("Item Created")
  //
  //       return res.redirect('/home')
  //       return res.end()
  //       //return res.end()
  //     })
  // },

  //GET Post or Item
  findById: function (req,res) {
    const postId = req.param('postId')

    //filtering by id
    const filteredPosts = allPosts
      .filter(p => {return p.id === postId})

    if (filteredPosts.length > 0 ) {
      res.send(filteredPosts[0])
    } else {
      res.send('Failed to find Post by id:' + postId)
    }
  },

  // delete: async function (req,res) {
  //
  //   const postId = req.param('postId')
  //   await Post.destroy({id: postId})
  //
  //   res.send('Finished deleting Post')
  // }
}
