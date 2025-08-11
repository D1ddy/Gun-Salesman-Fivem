<script lang="ts">
 import { WeaponModel } from "../weapons";
 const gunNames = Object.keys(WeaponModel).filter((key) => isNaN(Number(key)));
 let {price = $bindable() , gunName = $bindable()} : {price:number , gunName:string} = $props();
 gunName = 'weapon_advancedrifle';
 let imgUrl:string = $state('/web/src/static/weaponImg/'+ gunName + '.png');
</script>
<style>
    #chooseGunDiv{
        grid-column: 2;
        grid-row: 3;
        width: 100%;
        height: 100%;
    }
    #pic{
        width: 100%; /* image width */
        background-size: cover;
        background-image: url('');
        background-position: center;
        height: 100%; /* image height */
        display: inline-block; /* so that it behaves like the img element */
    }
     #priceOfTheGun{
        grid-column: 2;
        grid-row: 4;
    }
</style>
<div id="chooseGunDiv">
    <!-- FIXME: GUN PIC DOSENT CHANGE -->
    <div id="pic" style='background-image: url({imgUrl})'></div>
    
    <select id="guns" bind:value={gunName}>
        {#each gunNames as gunValue}
            <option value="{gunValue}">{gunValue}</option>
        {/each}
    </select>
    <input type="number" id="priceOfTheGun" bind:value={price}>
</div>