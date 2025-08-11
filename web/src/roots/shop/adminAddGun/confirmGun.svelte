<script lang="ts">
    let {price,gunName,arrayOfGuns = $bindable(),addGunVisible = $bindable()}:{price:number, gunName:string,arrayOfGuns:Array<any>,addGunVisible:boolean} = $props();

</script>
<style>
    #confirmButton{
        grid-column: 2;
        grid-row: 5;
    }
</style>
<button id="confirmButton" onclick="{()=>{
    arrayOfGuns.push({price:price,gunName:gunName});
    addGunVisible = false;
}}">Confirm</button>