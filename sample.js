const {Pool,Client} = require('pg')
const connectionString = 'postgressql://postgres:222852@localhost:5432/postgres'

const client = new Client({
	connectionString:connectionString
})

client.connect()

client.query('SELECT * FROM ticket', (err,res)=>{
	console.log(err,res)
	client.end()
})