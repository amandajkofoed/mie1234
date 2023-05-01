<script>
    import Header from "../components/Header.svelte";
    import Footer from "../components/Footer.svelte";
</script>

<header>
    <Header />
</header>

<body>
    <div class="background">
        <main>
            <slot />
        </main>
    </div>
</body>

<footer>
    <Footer />
</footer>
<style>
    body{
        margin: 0px;
        /*background-color: blue;*/
        border-radius: 20px;
    }
    .background{
        background-image: url("/src/Pictures/MacBook Air - 10.jpg"); 
        background-size: cover;
        background-repeat: repeat;
        min-height: 100vh;
        box-sizing: border-box;
        padding: 20px;
    }
    main{
        /*max-width: 960px; /* modsiger det app.html?*/
        color: white;
        
        margin-left: 200px;
        margin-right: 200px;
    }
    
</style>

