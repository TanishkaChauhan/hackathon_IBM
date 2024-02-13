<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!Doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Tracker.io</title>
</head>

<!-- CSS -->
<style>
    body{
        margin: 0;
        font-family: 'Prompt', sans-serif;
        color: white;
        background: #202731;
        overflow-x: hidden;
        font-family: 'Roboto mono', monospace;
        font-size: 15px;
    }

    section{
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 400px;
        padding: 100px 20vw;
    }

    /* sedhasdgasjfa */
    .navigationHeader{
        top: 0;
        left: 0;
        width: 100%;
        padding: 15px;
        margin-top: 5px;
        position: fixed;
        background-color: #202731;
        z-index: 100;
    }
    .navbar a{
        margin: 0 10px;
        color: #fff;
        font-family: 'Roboto mono', monospace;
        text-transform: uppercase;
        text-decoration:none;
        position: relative;

        left: 80%;

    }

    /* Creates the style of what should appear when hovered over*/
    .navbar a::after{
        content: '';
        height: 3px;
        width: 0;
        background-color: #FFBE0B;
        position: absolute;
        left: 0;
        bottom: -10px;
        transition: 0.5s;
    }

    /* Extends the previous style for everyone to see*/
    .navbar a:hover::after{
        width: 100%;
    }

    /* Main Page*/
    .container{

        display: flex;
        align-items: center;
        justify-content: center;
        height: 85vh;
        margin-top: 75px;
    }

    /* Left container contents*/
    .left-container{
        height: 100%;
        width: 50%;
    }

    #intialInvestment {
        font-size: 16px;
        margin-top: -80px;
    }

    .card-left .financialWaste{
        font-size: 16px;
    }

    .card-left .negative-money{
        font-family: "Poppins", sans-serif;
        align-content: center;
        width: 90%;
        background: #eeeee6;
        border-radius: 5px;
        padding: 25px 25px;
        font-size: 65px;
        margin-top: -3px;
        color: black;
    }

    .card-left, .card-right{
        width: 90%;
        max-width: 470px;
        background: #202731;
        color: #fff;
        margin: 100px auto 0;
        border-radius: 20px;
        padding: 40px 35px;
        text-align: center;
    }

    .card-left h1, .card-right{
        padding-bottom: 10px;
    }

    .card-left input, button, select, .card-right input, button, select {
        width: 100%;
        height: 40px;

        padding-left: 10px;
        margin-bottom: 20px;

        background: #282B30;
        font-family: Montserrat;
        font-weight: 500;
        color: #fff;
        font-size: 12px;
        border: solid transparent;

        border-color: #FFBE0B;

    }

    .negative-money button{
        margin-left: 5px;
    }

    .negative-money button:hover{
        transition: 300ms;
        background-color: #3A3E43;
    }

    .negative-money button:active{
        background-color: #1C1D20;
    }

    .negative-money:hover{
        transition: 300ms;
        background-color: #ef3d3d;
        border-radius: 10px;
    }

    button:active{
        background-color: #1C1D20   ;
    }

    .negative-money a, .card-right a{
        color: white;
        text-decoration: none;

    }

    label{
        margin-top: 5px;
    }

    #itemLabel{
        font-size: 12px;
        margin-top: -45px;
    }

    .itemBackground{
        margin-top: -1px;

        width: 75%;
        background: #0d142c;
        left: 4%;
        overflow: hidden;
        padding: 15px 60px;
        display: flex;
        align-items: center;
        border-radius: 5px;
        box-shadow: 0 0 20px rgba(5, 14, 59, 0.25);
    }

    .listItems{
        color: black;
        font-size: 18px;
    }


    /* Right container contents*/
    .right-container{
        height: 100%;
        width: 50%;
        margin-left: -50px;
    }

    #attendanceBtn{

        margin-bottom:-10px ;
    }

    #lecture-percentage{
        font-size: 16px;
        margin-top: -80px;
        margin-bottom: 15px;
    }

    .circular-progress{
        position: relative;
        height: 450px;
        width: 450px;
        border-radius: 50%;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        align-items: center;

    }

    .circular-progress:before {
        content: "";
        position: absolute;
        height: 94%;
        width: 94%;
        background-color: #ffffff;
        border-radius: 50%;
    }

    .circular-progress-inner{
        content: "";
        position: absolute;
        height: 84%;
        width: 84%;
        background-color: #202731;
        border-radius: 50%;


    }
    .value-container {
        position: relative;
        font-family: "Poppins", sans-serif;
        font-size: 55px;
        color: #eeeee6;
    }
</style>

<!-- HTML -->
<body>

<!-- Navigation bar -->
<header class="navigationHeader">
    <div>
        <nav class="navbar">
            <a href="homePage">Home</a>
            <a href="profilePage">Profile</a>
            <a href="loginPage">Log Out</a>
        </nav>
    </div>
    <div class="border"></div>
</header>

<div class="container">
    <div class="left-container">

        <div class="card-left">
            <c:forEach items="${user}" var="u">
                <p id="intialInvestment">Initial Investment (Tuition Fee): ${u.initialInvestment}</p>
                <div class="whiteBackground">
                    <p class="financialWaste" id="wastedMoney">money lost:</p>
                    <p class="negative-money">-${u.moneyLost} </p>
                </div>
            </c:forEach>
            <p id="itemLabel">So far, this amount of money could buy...</p>
            <div class="itemBackground">
                <div class="listItems" id="thingsYouCanBuy"></div>
            </div>
        </div>
    </div>

    <div class="right-container">
        <div class="card-right">
            <p id="lecture-percentage">Lecture Attendance Percentage:</p>
            <div class="whiteBackground">
                <div class="circular-progress">
                    <div class="circular-progress-inner"></div>
                    <div class="value-container">
                        <c:forEach items="${lecture}" var="l">
                        <p id="lecturePercentage">${l.lecturePercentage}%</p>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <c:forEach items="${lecture}" var="l">
                <p id="missedCourse">Missed Lectures: ${l.missedCourse}</p>
                <p id="totalCourse">Total Lectures: ${l.totalCourse}</p>
            </c:forEach>
        </div>
        <button onclick="updateAttendance()" id="attendanceBtn">Update Attendance</button>

    </div>


</div>

<!-- JAVASCRIPT -->
<script>
    /* Code that runs when document is loaded */
    document.addEventListener("DOMContentLoaded", async () => {

        /* Progress bar code*/
        let progressBar = document.querySelector(".circular-progress");
        /*let valueContainer = document.querySelector(".value-container"); */
        /* the percentage change will happen in the sql */
        console.log(progressBar)

        /* FOR BACKEND DEVELOPERS */
        let progressValue = 0; /* Start value */
        let progressEndValue = 75; /* End value */
        let speed = 10; /* Speed at which progress bar moves */

        /* IGNORE IF YOURE NICOLETTE OR TANNI OR BEN */
        let progress = setInterval( () => {
            progressValue++;
            console.log(progressValue);
            valueContainer.textContent = `${progressValue}%`;

            progressBar.style.background = `conic-gradient(
                    #FFBE0B ${progressValue * 3.6}deg,
                    #cadcff ${progressValue * 3.6}deg
                )`
            /*  Unneeded code */
            if(progressValue == progressEndValue){
                clearInterval(progress);
            }
        }, speed)


        /* Code related to API */
        const apiUrl = "https://j4uiijcmmh.execute-api.eu-north-1.amazonaws.com/get-items?catagory=Generic";
        let cost = Number(window.localStorage.getItem("cost"));

        try {
            const response = await fetch(apiUrl + `&cost=${cost + 1000}`, {
                method: "GET",
            });

            if (response.ok) {
                const data = await response.json();
                console.log(data);
                const leftover = data.leftover;
                for (let i = 0; i < data.items.length; i++) {
                    const itemData = data.items[i];
                    const itemCount = itemData.count;
                    const itemCost = itemData.cost;
                    const itemName = itemData.label;
                    const itemImageURL = itemData.image;

                    /* Front end */
                    document.getElementById("thingsYouCanBuy").innerHTML +=
                        `
                            <div class=itemCard>
                                <div class="productCard" >
                                    <img class="productImage"src="${itemImageURL}" width=100% height=100%>

                                    <h2>${itemName}</h2>
                                    <div class="price">$${itemCost}</div>
                                </div>
                            </div>
                            `;

                    console.log(itemName);
                }
            } else {
                throw new Error('Network response was not ok.');
            }
        } catch (err) {
            alert("Encountered an error: " + err.message);
        }


    });

    /* user prompt to check for attendance */
    function updateAttendance() {
        var classesAttended = prompt("Enter the number of classes attended:");
        if (classesAttended !== null && classesAttended !== "") {
            // Send the value to the server
            window.location.href = "/updateAttendance?classesAttended=" + classesAttended;
        }
    }

</script>

</body>
</html>