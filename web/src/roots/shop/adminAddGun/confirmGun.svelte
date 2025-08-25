<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";

    let {price,gunName,arrayOfGuns = $bindable(),addGunVisible = $bindable()}:{price:number, gunName:string,arrayOfGuns:Array<any>,addGunVisible:boolean} = $props();

</script>
<style>
    #confirmButton{
        grid-column: 2;
        grid-row: 5;
        background-color: #222;
        color: #f0f0f0;
    }
</style>
<button id="confirmButton" onclick="{()=>{
    arrayOfGuns.push({price:price,gunName:gunName});
    addGunVisible = false;
    fetchNui('addGunToInventory',gunName)
}}">Confirm</button>