<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
	import AddGunButton from "./adminAddGun/addGunButton.svelte";
     let { arrayOfGuns = $bindable()} = $props();
     let isAdmin = $state();
     fetchNui('checkprivileges').then((data:any) => {
        isAdmin = data;
        console.log(isAdmin)
    });
</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap');
    #header{
        display: grid;
        grid-template-columns: 10vh 1fr 8vh;
        width: 100%;
        grid-column: 2;
        grid-row: 1;
        border-bottom: 1px solid #555555;
        justify-self: center;
        align-self: center;
        font-family: "Google Sans Code", monospace;
        font-optical-sizing: auto;
        font-weight: 500;
        font-style: normal;
        font-size: 3vh;
    }
</style>
<div id="header">
    <div id="headerName">Shop</div>
    {#if isAdmin}
    <AddGunButton bind:arrayOfGuns />
    {/if}
</div>