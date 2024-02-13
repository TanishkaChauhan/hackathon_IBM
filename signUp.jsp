<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up</title>
</head>
<style>
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
        background: #bd4f79;
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
        background-color: #562b3a;
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



    .blobs {
        width: 100%;
        /* background: url('./blobs.svg') no-repeat bottom / cover; */
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


    .navbar a:hover::after{
        width: 100%;
    }

    /* Card system (login / signup) */
    .card{
        width: 100%;
        max-width: 470px;
        background: #202731;
        color: #fff;
        margin: 200px auto 0;
        border-radius: 20px;
        padding: 40px 35px;
        text-align: center;
    }

    .card h1{
        padding-bottom: 10px;
    }

    .card input, button{
        width: 100%;
        height: 40px;

        padding-left: 10px;
        margin-bottom: 20px;

        background: #282B30;
        font-family: 'Roboto mono', monospace;
        font-weight: 500;
        color: #fff;
        font-size: 12px;

        border: solid transparent;
        border-color: #FFBE0B;
        align-items: center;

    }

    .card button{
        width: 104%
    }


    .card button:hover{
        transition: 300ms;
        background-color: #3A3E43;
    }

    .card button:active {
        background-color: #1C1D20   ;
    }

    button:hover{
        transition: 300ms;
        background-color: #F000FF;
    }

    button:active {
        background-color: #1C1D20   ;
    }


    .card a{
        color: white;
        text-decoration: none;
    }

    .newBody{
        background-color: #1a1c26
    ;
    }

    label{
        margin-top: 5px;
    }

</style>
<body class="newBody">
<header class="navigationHeader">
    <div>
        <!-- Istantiates the navigation bar-->
        <nav class="navbar">
            <a href="index.html">Home</a>
            <a href="login.html">Login</a>
            <a href="signup.html">Sign up</a>

        </nav>
    </div>
</header>

<div class="card">
    <h1>Sign Up</h1>
    <input type="text" name="" placeholder="Username" id="username">
    <input type="email" name="" placeholder="Email" id="email">
    <input type="password" name="" placeholder="Password" id="password">
    <button type="submit" id="signup" name="signup_submit" value="Sign Up">Sign up</button>
    <a href="loginPage">Already have an account? Log in here</a>
</div>
</body>
<script type="module">

    signup.addEventListener('click', (e) => {
        alert("User created!")
    })

</script>
</html>