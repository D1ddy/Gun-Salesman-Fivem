<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
	import { useNuiEvent } from "$lib/utils/useNuiEvent";
    import Shop from "./shop/shop.svelte";
    import { visible } from "src/store";
    let shopVisible:boolean = $state(false);
    let dialogArray:Array<string> = ['Want to buy something?','Hello?','What do you want?','Looking for something?','Keep walking buddy.'];
    let dialogText:string = dialogArray[Math.floor(Math.random() * dialogArray.length)];
    visible.subscribe(()=>{});
    function handleKeydown(event:any) {
        visible.set(false)
		fetchNui('close');
        fetchNui('closeDialog');
	}
</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap');
    #dialogBox{
        width: 60vh;
        height: 40vh;
        background-color: #2d2d2d;
        position: absolute;
        top: 35%;
        left: 55%;
        display: grid;
        grid-template-columns: 2vh 1fr 2vh;
        grid-template-rows: 2vh 1fr 1fr 1fr 2vh;
        font-family: "Google Sans Code", monospace;
        font-optical-sizing: auto;
        font-weight: 500;
        font-style: normal;
        border-radius: 10px;
    }
    #dialogNpc{
        border-radius: 10px;
        grid-row: 2;
        grid-column: 2;
        justify-self: center;
        align-self: center;
        font-size: 2.7vh;
        height: 100%;
        width: 100%;
        background-color: #404040;
        border-bottom: #555555;
        display: flex;
        justify-content: center;
    }
    .buttons{
        width: 80%;
        height: 5vh;
        appearance: none;
        border-radius: 5px;
        background-color: #5E5E5E;
        border: 1px solid #454545;
        box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
        font-family: "Google Sans Code", monospace;
        font-optical-sizing: auto;
        font-weight: 500;
        font-style: normal;
    }
    .buttons:hover{
        background-color: #707070;
    }
    #openShop{
        grid-row: 3;
        grid-column: 2;
        justify-self: center;
        align-self: center;
    }
    #closeShop{
        grid-row: 4;
        grid-column: 2;
        justify-self: center;
        align-self: start;
    }
</style>
 <svelte:window onkeydown={handleKeydown} />
 {#if !shopVisible}
<div id = 'dialogBox'>
    <div id='dialogNpc'>
        <p>{dialogText}</p>
    </div>
    <button id="openShop" class="buttons" onclick="{() => {
        shopVisible = true;
    }}">Open shop</button>
    <button id="closeShop" class="buttons" onclick="{() => {
        visible.set(false);
        fetchNui('closeDialog');
    }}">Nope</button>
</div>
{:else}
    <Shop />
{/if}
