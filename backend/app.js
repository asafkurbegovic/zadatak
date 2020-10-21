const express = require("express");
const mysql = require("mysql");
const bcrypt = require("bcrypt");
const cookie = require("cookie-parser");
const jwt = require("jsonwebtoken");

const app = express();
app.use(express.json());
app.use(cookie());

const base = mysql.createConnection({
  multipleStatements: true,
  host: "localhost",
  user: "root",
  password: "root",
  database: "mop",
  insecureAuth: true,
});

base.connect();
var credentials = [];

app.get("/setcookie", function (req, res) {
  // setting cookies
  res.cookie("username", "john doe", { maxAge: 900000, httpOnly: true });
  return res.send("Cookie has been set");
});

app.get("/getcookie", function (req, res) {
  var username = req.cookies["username"];
  if (username) {
    return res.send(username);
  }

  return res.send("No cookie found");
});

app.get("/deleteusers", (req, res) => {
  base.query("delete from users where _password='hahaha'", (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.get("/users", (req, res) => {
  base.query("select * from users", (err, result) => {
    if (err) res.json({ message: "something wrong" });
    res.send(result);
  });
});

//--------------------------------------------------------------------
//--------------------------------------------------------------------
let mail;
let id;

app.post("/login", (req, res) => {
  var newCred = {
    email: req.body.email,
    password: req.body.password,
  };
  console.log(req.body.email);
  base.query(
    "select * from users where email=?",
    req.body.email,
    async (err, result) => {
      if (err) console.log(err);

      try {
        if (await bcrypt.compare(req.body.password, result[0]._password)) {
          console.log("SUCCESS!!!");
          mail = result[0].email;
          id = result[0].id;
          console.log(result[0].id);
          try {
            //result[0].email
            const token = jwt.sign('jwt', "oh how protected you are");
            console.log("token " + token);
            res.cookie(result[0].email, token, {
              httpOnly: true,
              maxAge: 86400000,
            });
            res.status(200).json(result);
          } catch (err) {
            console.log(err);
          }
        } else {
          console.log("something went wrong");
          res.status(401).json({ error: "wrong password or email" });
        }
      } catch {
        res.status(500).send();
      }
    
    }
  );
  credentials.push(newCred);
  console.log(credentials);
});

app.post("/registration", async (req, res) => {
  var newCred = {
    firstname: req.body.name,
    lastname: req.body.lastname,
    email: req.body.email,
    password: req.body.password,
  };
  const salt = await bcrypt.genSalt();
  const hashedPass = await bcrypt.hash(req.body.password, salt);

  base.query(
    "insert into users(firstname, secondname, email, _password) values(?,?,?,?)",
    [req.body.name, req.body.lastname, req.body.email, hashedPass],
    (err, result) => {
      if (err) res.json({ errorMessage: "THIS EMAIL ALLREADY EXIST" });
      res.status(200).send(result);
      // res.redirect("http://localhost:3000/login");
      // *********  TODO -- finish redirection --   *********
    }
  );
  credentials.push(newCred);
  console.log(credentials);
});

app.post("/profile", (req, res) => {
  const cookie = req.cookies[mail];
  if (cookie && jwt.verify(cookie, "oh how protected you are")) {
    base.query("select * from users where email =?", mail, (err, result) => {
      if (err) res.json({ errorMessage: "SOMETHING WENT WRONG" });
      else res.send({ result: result, message: "positive" });
    });
  } else res.json({ message: "negative" });
});

app.get("/topquestions", (req, res) => {
  base.query(
    "select firstname,question  from users inner join questions on users.id = questions.userid limit 20 ;select count(*) as top, question from likes inner join questions on questions.id=likes.questionid group by question order by top desc;select count(email) as count, firstname  from users inner join answers on users.id = answers.userid group by email  order by count desc",
    (error, result) => {
      if (error) console.log(error);
      res.send(result).status(200);
    }
  );
});

app.put("/passupdate",async (req, res)=>{
  const salt = await bcrypt.genSalt();
  const newHashedPass = await bcrypt.hash(req.body.newPass, salt);

  base.query("update users set _password =? where email=?",[newHashedPass,req.body.email],(err,result)=>{
    if(err) console.log(err)
    else res.json({result,message:"succes"})
  })
})

app.get("/myquestions", (req,res)=>{
  base.query("select * from questions where userid =?",id,(err,result)=>{
    if (err){ console.log(err)}
    res.send({result})
  })
})




app.listen(5000, () => console.log("server up!!!"));