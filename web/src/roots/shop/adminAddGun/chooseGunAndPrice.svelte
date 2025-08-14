<script lang="ts">
 import { WeaponModel } from "../weapons";
 const gunNames = Object.keys(WeaponModel).filter((key) => isNaN(Number(key)));
 let {price = $bindable() , gunName = $bindable()} : {price:number , gunName:string} = $props();
 gunName = 'weapon_advancedrifle';
 let imgUrl:string = $derived('/web/src/static/weaponImg/'+ gunName + '.png');
</script>
<style>
    #chooseGunDiv{
        grid-column: 2;
        grid-row: 3;
        width: 60vh;
        height: 10vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
     #selectPriceAndGun{
        grid-column: 2;
        grid-row: 4;
    }
    img{
        object-fit: contain;
        width: 100%;
        height: 100%;
    }
    select{    
        appearance: base-select;
        color: #f0f0f0;
        background-color: #222;
        width: 180px;
        box-sizing: border-box;
        padding: 0.5rem 0.75rem;
        border: none;
        border-radius: calc(0.5rem - 2px);
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        cursor: pointer;
    }
    #priceOfTheGun{
        appearance: base-select;
        color: #f0f0f0;
        background-color: #222;
        width: 180px;
        box-sizing: border-box;
        padding: 0.5rem 0.75rem;
        border: none;
        border-radius: calc(0.5rem - 2px);
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        cursor: pointer;
    }
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
</style>
<div id="chooseGunDiv">
    <img src="{imgUrl}" alt="{gunName}">
</div>
<div id="selectPriceAndGun">    
    <select id="guns" bind:value={gunName}>
        {#each gunNames as gunValue}
            <option value="{gunValue}">{gunValue}</option>
        {/each}
    </select>
    <input type="number" id="priceOfTheGun" bind:value={price} placeholder="Choose price" min="0">
</div>