<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tracker.io</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/kute.js@2.1.2/dist/kute.min.js"></script>
</head>

<body>
<style>
    /* BAYANI: hi can you make the pink background a little shorter. so when they scroll they won't have a full empty pink screen */
    /* Can you center middle the text and buttons too */

    /* MAIN CSS*/
    body{
        margin: 0;
        font-family: 'Prompt', sans-serif;
        color: white;
        background: #202731;
        overflow-x: hidden;
        font-family: 'Roboto mono', monospace;
    }

    section{
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 400px;
        padding: 100px 20vw;

    }

    /* BACKGROUND CURVES BACK GROUND CURVES */
    .pink{
        margin-top: 50px;
        background: #ff0066;
        overflow: hidden;
    }

    .dark{
        background: #0f0f10;
    }


    /* Implenting curves using PURE CSS woooo*/
    .curve{
        position: absolute;
        height: 225px;
        width: 100%;
        bottom: 0;
    }

    .curve::before{
        content: "";
        display: block;
        position: absolute;
        border-radius: 100% 50%;
        width: 55%;
        height: 100%;
        background-color: #202731;
        transform: translate(85%, 60%);
    }

    .curve::after{
        content: "";
        display: block;
        position: absolute;
        border-radius: 100% 50%;
        width: 55%;
        height: 100%;
        background-color: #3c31dd;
        transform: translate(-4%, 40%);
        z-index: -1;
    }

    /* Implenting BUBBLES using PURE CSS woooo*/

    .bubble::after{
        content:'';
        border-top-left-radius: 50% 100%;
        border-top-right-radius: 50% 100%;
        position: absolute;
        bottom: 0;
        height: 85%;
        width: 100%;
        background-color: #0f0f10;
        z-index: -1;
    }

    /* Implementing waves using SVG */

    .waves {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        overflow: hidden;
        line-height: 0;
    }

    .waves svg {
        position: relative;
        display: block;
        width: calc(100% + 1.3px);
        height: 149px;
    }

    .waves .shape-fill {
        fill: #0f0f10;
    }

    .spacer{
        aspect-ratio: 960/300;
        width: 100%;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        background-color: #ff0066;
    }

    .layer1{
        background-image: url(./layer1.svg);
    }

    .layer2{
        background-image: url(./layer2.svg);
    }

    .flip {
        transform: rotate(180deg);
    }

    .blob-motion {
        position: absolute;
        transform: translateY(-20%);
        z-index: 0;
    }

    .blob-content {
        z-index: 1;
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 400px;
        padding: 100px ;

    }

    .blob-content h1{
        font-size: 100px;
        font-family: 'Roboto mono', monospace;
    }

    #tagLine{
        display: flex;
        margin-top: 20px;
        font-size: 12px;
        align-content: center;
        justify-content: center;
    }

    .specialButton{
        margin-top: 80px;
        padding: 10px;
    }


    .blobs {
        width: 100%;
       /* background: url('./blobs.svg') no-repeat bottom / cover; */
        /* BAYANI: I can't find this file on github lol */
    }


    /* Navigation bar */
    .navigationHeader{
        top: 0; left: 0;
        width: 100%;
        padding: 15px 0px 15px 0px;
        position: fixed;
        background-color: #202731;
        z-index: 100;

    }

    .navbar a{
        margin: 0 20px;
        color: #fff;
        font-family: 'Roboto mono', monospace;
        text-transform: uppercase;
        text-decoration:none;
        position: relative;

        left: 80%;

    }


</style>
<header class="navigationHeader">
    <div>
        <!-- Istantiates the navigation bar-->
        <nav class="navbar">
            <a href="loginPage">Login</a>
            <a href="signUp">Sign up</a>

        </nav>
    </div>
</header>

<section class="pink">
    <div class="blob-content">
        <div class="content">
            <h1>Tracker.io</h1>
            <h3 id="tagLine">Make The Most Out Of Your Education!</h3>
        </div>
        <div >
            <a href="loginPage"><button type="button" class="specialButton">Get Started</button></a>
        </div>
    </div>

    <!-- IGNORE -->
    <svg class="blob-motion" id="visual" viewBox="0 0 960 540" width="960" height="540"
         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
        <g transform="translate(450.7256843113689 283.4942824330989)">
            <path id="blob1"
                  d="M148.7 -134.9C193.7 -103.7 231.9 -51.9 232.4 0.6C233 53 196.1 106.1 151.1 128.6C106.1 151.1 53 143 -4.4 147.4C-61.8 151.8 -123.5 168.5 -151.2 146C-178.8 123.5 -172.4 61.8 -172.8 -0.4C-173.1 -62.5 -180.3 -124.9 -152.6 -156.1C-124.9 -187.3 -62.5 -187.1 -5.3 -181.8C51.9 -176.5 103.7 -166 148.7 -134.9"
                  fill="#BB004B"></path>
        </g>
        <g transform="translate(509.54377535978017 281.49390864595887)" style="visibility: hidden">
            <path id="blob2"
                  d="M115.4 -137.9C137.9 -92.9 136.4 -46.4 133.6 -2.8C130.8 40.8 126.6 81.6 104.1 118.4C81.6 155.2 40.8 188.1 -8.4 196.5C-57.5 204.8 -115 188.7 -151 151.9C-187 115 -201.5 57.5 -190.8 10.7C-180.1 -36.1 -144.1 -72.1 -108.1 -117.1C-72.1 -162.1 -36.1 -216.1 5.2 -221.2C46.4 -226.4 92.9 -182.9 115.4 -137.9"
                  fill="#BB004B"></path>
        </g>
    </svg>

    <script>
        const tween = KUTE.fromTo(
            '#blob1',
            { path: '#blob1' },
            { path: '#blob2' },
            { repeat: 999, duration: 3000, yoyo: true }
        ).start();
    </script>
</section>



<div class="spacer layer2 "></div>

<section>
    <h1>You found this! Here's a fun fact about us...</h1>
    <p>Tracker.io is a pioneering application aiming to help students understand the financial cost of missed lectures. We
        specialize in tracking, quantifying and visualising the monetary losses incurred when a student skips a class. Our
        mission is simple: it is to provide users with insight into the financial consequences of
        absenteeism, empowering them to make informed decisions about their educational and financial priorities. With
        Tracker.io, we aim to revolutionize how people perceive the cost of skipping lectures and inspire a newfound
        appreciation for the value of regular attendance in academic pursuits.</p>

    <p> for the application we used spring boot mvc frameworks, APIs and AWS with a focus on java, SQL, JavaScript, and rust.</p>
</section>
</body>
</html>