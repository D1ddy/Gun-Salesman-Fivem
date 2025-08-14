<script lang="ts">
	import ChooseGunAndPrice from "./chooseGunAndPrice.svelte";
	import ConfirmGun from "./confirmGun.svelte";
    let price:number = $state(0);
    let gunName:string = $state('');
    let { arrayOfGuns = $bindable() ,addGunVisible = $bindable() } = $props();
</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap');
    #addGunMain{
        width: 68vh;
        height: 50vh;
        position: absolute;
        top: 10%;
        left: 1%;
        background-color: #2B2D42;
        display:grid;
        grid-template-columns: 2vh 1fr 2vh;
        grid-template-rows: 2vh 10vh 1fr 1fr 1fr 2vh;
        border: none;
        border-radius: calc(0.5rem - 2px);
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
    }
    #title{
        font-family: "Google Sans Code", monospace;
        font-optical-sizing: auto;
        font-weight: 500;
        font-style: normal;
        font-size: 3vh;
        grid-column: 2;
        grid-row: 2;
        align-self: center;
        justify-self: center;
        color: #f0f0f0;
    }
</style>
<div id="addGunMain">
    <div id="title"> Choose Gun </div>
    <ChooseGunAndPrice bind:price bind:gunName />
    <ConfirmGun {price} {gunName} bind:arrayOfGuns bind:addGunVisible={addGunVisible}/>
</div>