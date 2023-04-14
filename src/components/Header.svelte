<script>
    import {
    Nav,
    NavItem,
    NavLink
  } from 'sveltestrap';
</script>

<!--https://www.w3schools.com/howto/howto_css_searchbar.asp-->
<header>
    <div class="topheader">
        <a href="/">
            <h1>MIE</h1>
        </a>
        <Nav pills class="navpills"> <!--kan man få den 'korrekte' tab til at være farvet?--> <!--https://sveltestrap.js.org/?path=/story/components--nav-->
            <NavItem>
                <NavLink href="/">Home</NavLink>
            </NavItem>
            <NavItem>
                <NavLink href="/needs">Needs</NavLink>
            </NavItem>
        </Nav>
        <input type="text" placeholder="Search needs">
    </div>
</header>

    

<style>
    header{
        background: #ffffff;
        padding: 20px;
        margin-top: auto;
        margin-bottom: auto;
    }
    .topheader h1{
        float: left;
        color: black;
        text-align: center;
        font-weight: bold;
        font-size: 60px;
        
    }
    .topheader input[type=text]{
        /*float: right;
        padding: 6px;
        border: none;
        margin-right: 16px;
        font-size: 15px;*/
        width: 200px;
    }

    .topheader{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /*hvordan kan jeg rykke home og needs til at være i højre side ved siden af søgebaren?*/
</style>