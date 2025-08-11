<script lang="ts">
	import GunContainer from "./gunContainer.svelte";
	import { WeaponModel } from "./weapons";
    
   
    let {arrayOfGuns=$bindable()}= $props();
</script>
<style>
    #body{
        grid-row: 2;
        grid-column: 2;
        height: 100%;
        width: 100%;
        display:grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-row: 1fr 1fr 1fr;
        gap: 1vh;
        align-items: center;
        justify-items: center;
    }
</style>
<div id="body">
    {#each arrayOfGuns as gun}
        <GunContainer {gun}/>
    {/each}
</div>