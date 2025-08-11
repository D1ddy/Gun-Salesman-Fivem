<script lang="ts">
	import ChooseGunAndPrice from "./chooseGunAndPrice.svelte";
	import ConfirmGun from "./confirmGun.svelte";
    let price:number = $state(0);
    let gunName:string = $state('');
    let { arrayOfGuns = $bindable() ,addGunVisible = $bindable() } = $props();
</script>
<style>
    #addGunMain{
        width: 68vh;
        height: 50vh;
        position: absolute;
        top: 10%;
        left: 1%;
        background-color: black;
        display:grid;
        grid-template-columns: 2vh 1fr 2vh;
        grid-template-rows: 2vh 10vh 1fr 1fr 1fr 2vh;
    }
    #title{
        grid-column: 2;
        grid-row: 2;
        align-self: center;
        justify-self: center;
        font-size: 5vh;
        color: whitesmoke;
    }
</style>
<div id="addGunMain">
    <div id="title"> Choose Gun </div>
    <ChooseGunAndPrice bind:price bind:gunName />
    <ConfirmGun {price} {gunName} bind:arrayOfGuns bind:addGunVisible={addGunVisible}/>
</div>