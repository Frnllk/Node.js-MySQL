window.addEventListener('DOMContentLoaded', () => {

    const tab = document.getElementById('Button'),
        CheckConnection = document.getElementById('vote_status'),
        Presence = document.getElementById('Presence'),
        Received = document.getElementById('received');

    const data = {
        login: "",
        password: "",
    };

    if (tab) {
        tab.addEventListener('click', (event) => {
            event.preventDefault();
            data.login = document.getElementsByTagName("input")[0].value;
            data.password = document.getElementsByTagName("input")[1].value;
            if (data.login != "" && data.password != "") {
                send();
            }
        });
    }

    function ExtractValue(data, key) {
        let rx;
        if (key == `"task_id"` || key == `"time"`) {
            rx = new RegExp(key + ":(.*?),");
        } else {
            rx = new RegExp(key + `:"(.*?)"`);
        }
        let values = rx.exec(data);
        return values && values[1];
    }

    function send() {
        var httpRequest;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
            httpRequest = new XMLHttpRequest();
        } else if (window.ActiveXObject) { // IE
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
        }

        httpRequest.onreadystatechange = function () {
            if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.responseText != " Deny") {
                let OutputData = " ";
                OutputData += `
                <div id="received">
                <table class="table table-hover">
                <thead class="thead-inverse">
                    <tr>
                    <th>#ID</th>
                    <th>Description</th>
                    <th>Time</th>
                    <th>Date_start</th>
                    <th>Date_finish</th>
                    </tr>
                </thead>
                <tbody>
                `;

                let substringArray = httpRequest.responseText.split("}");
                for (let i = 0; i < substringArray.length - 1; i++) {
                    OutputData += `
                    <tr>
                    <tD>${ExtractValue(substringArray[i], `"task_id"`)}</tD>,
                    <td>${ExtractValue(substringArray[i], `"description"`)}</td>
                    <td>${ExtractValue(substringArray[i], `"time"`)}</td>
                    <td>${ExtractValue(substringArray[i], `"date_start"`)}</td>
                    <td>${ExtractValue(substringArray[i], `"date_finish"`)}</td>
                    </tr>`;
                }

                OutputData += `
                    </tbody>
                    </table>
                    </div>
                `;

                Received.innerHTML = '';
                Received.innerHTML = OutputData.replace(/\,(?:\n|$)/g, "\n");

            } else {
                Received.innerHTML = '';
                Received.innerHTML = `
                    <div id="received">
                    <table  class="table table-hover">Тут будут ваши данные </table>
                    </div>`;
            }
        };

        httpRequest.open('POST', 'http://127.0.0.1:8081', true);
        httpRequest.send(JSON.stringify(data));

        httpRequest.onload = function () {
            if (httpRequest.responseText == " Deny") {
                CheckConnection.innerHTML = '';
                CheckConnection.innerHTML += `
                             <p id ="vote_status">
                                    Database connection status:
                                    <span class="text-warning h3">${httpRequest.responseText} </span>
                             </p>
                `; // responseText -- текст ответа..text-warning
                Presence.innerHTML = '';
                Presence.innerHTML += `
                             <p id ="Presence">
                                            Presence of errors:
                                            <span class="text-danger h3">Error code:${httpRequest.status}</span>
                             </p>
                `; // responseText -- текст ответа..text-warning
            } else {
                CheckConnection.innerHTML = '';
                CheckConnection.innerHTML += `
                             <p id ="vote_status">
                                    Database connection status:
                                    <span class="text-success h3"> Sucsecc </span>
                             </p>
                `; // responseText -- текст ответа..text-warning
                Presence.innerHTML = '';
                Presence.innerHTML += `
                             <p id ="Presence">
                                            Presence of errors:
                                            <span class="text-success h3">None </span>
                             </p>
                `; // responseText -- текст ответа..text-warning
                // console.log(httpRequest.responseText);
            }
        };

    }

});