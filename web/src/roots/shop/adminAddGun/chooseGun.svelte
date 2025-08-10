<script lang="ts">
 import { WeaponModel } from "../weapons";
 const gunNames = Object.keys(WeaponModel).filter((key) => isNaN(Number(key)));
 let gun:string = $state('');
</script>
<style>
    #chooseGunDiv{
        grid-column: 2;
        grid-row: 3;
        width: 100%;
        height: 100%;
    }
</style>
<div id="chooseGunDiv">
    <div>
        <img src="C:\Users\dimit\Desktop\Test server\txData\FiveMBasicServerCFXDefault_7E5221.base\resources\Gun-Salesman-Fivem\web\src\static\weaponImg\{gun}.png" alt="{gun}">
    </div>
    <select id="guns" bind:value={gun}>
        {#each gunNames as gunValue}
            <option value="{gunValue}">{gunValue}</option>
        {/each}
    </select>
</div>