<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
	import { useNuiEvent } from "$lib/utils/useNuiEvent";
    import Shop from "./shop.svelte";
    import { visible } from "src/store";
    visible.subscribe(()=>{});
    function handleKeydown(event:any) {
        visible.set(false)
		fetchNui('close');
        fetchNui('closeDialog');
	}
</script>
<style>
    div{
        width: 100%;
        height: 40vh;
        background-color: rgba(0, 0, 0, 0.774);
    }
</style>
 <svelte:window onkeydown={handleKeydown} />
<div>
    You looking to buy?
    <button>Open shop</button>
    <button onclick="{() => {
        visible.set(false);
        fetchNui('closeDialog');
    }}">Nope</button>
</div>