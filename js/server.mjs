import {
    createServer
} from "http";
import {
    createConnection
} from "mysql2";
var server = createServer();

function ExtractValue(data, key) {
    let rx = new RegExp(key + `:"(.*?)"`);
    let values = rx.exec(data);
    return values && values[1];
}

server.on('request', function (request, response) {

    const InputData = {
        login: "",
        password: ""
    };

    response.writeHead(200, {
        'Access-Control-Allow-Origin': '*',
        // 'Access-Control-Allow-Credentials': true 
    });

    let data = '';
    request.on('data', function (chunk) {
        data += chunk.toString();
    });

    request.on('end', function () {
        InputData.login = ExtractValue(data, `"login"`);
        InputData.password = ExtractValue(data, `"password"`);
        console.log("Полуенные данные :" + data);

        const connection = createConnection({
            host: "localhost",
            user: InputData.login,
            database: "data_for_test",
            password: InputData.password
        });

        connection.connect(function (err) {
            if (err) {
                response.write(" Deny");
                response.end();
                return console.error("Ошибка: " + err.message);
            } else {
                console.log("Подключение к серверу MySQL успешно установлено");

            }
        });

        connection.query("SELECT * FROM tasks",
            function (err, results, fields) {
                if (!err) {
                    response.write(JSON.stringify(results));
                    response.end();
                }

            }
        );

        connection.end();
    });

});
server.listen(8081);