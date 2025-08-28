<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
	import { useNuiEvent } from "$lib/utils/useNuiEvent";
	import Body from "./body.svelte";
	import Header from "./header.svelte";
    let arrayOfGuns:Array<any> = $state([]);

    fetchNui<any[]>('loadInventoryNames').then((data:any) => {
        data = data.split(",");
        for(let i = 1; i < data.length; i++){
            let gun = {
                gunName : data[i],
                price : 0
            }
            arrayOfGuns.push(gun);
        }

     
    });
    
    fetchNui<any[]>('loadInventoryPrice').then((data:any) => {
        data = data.split(",");
        for(let i = 1; i < data.length; i++){
            arrayOfGuns[i-1].price = data[i];
            console.log(arrayOfGuns[i-1].price);
        }
       
    });

    // TODO FIGURE THIS SHIT FROM LINE 9 TO 23 IM TWEAKING THE FUCK OUT 
</script>
<style>
    div{
        display: grid;
        grid-template-columns: 2vh 1fr 2vh;
        grid-template-rows: 5vh 1fr;
        width: 70vh;
        height: 60vh;
        background-color: #2d2d2d;
        position: absolute;
        top: 20%;
        left: 55%;
    }
</style>
<div>
    <Header bind:arrayOfGuns/>
    <Body bind:arrayOfGuns/>
</div>