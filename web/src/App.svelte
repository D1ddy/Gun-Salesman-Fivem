<script lang="ts">
    import { visible } from "./store";
    import { visible2 } from "./store";
    import PopUp from "./roots/popUp.svelte";
	import { useNuiEvent } from "$lib/utils/useNuiEvent";
	import DialogBox from "./roots/dialogBox.svelte";

    let isVisibleDialog:boolean = $state(false);
    let isVisiblePopUp:boolean = $state(false);
    visible.subscribe((value) => {
        isVisibleDialog = value;
    })
    visible2.subscribe((value) => {
        isVisiblePopUp = value;
    })
    useNuiEvent('openPopUp',(data:boolean) => {
        visible2.set(data);
    })
    useNuiEvent('close',(data:boolean) => {
        visible2.set(data);
    })
    useNuiEvent('openDialog', (data:boolean) => {
        visible.set(data);
        //visible2.set(!data);
    })
</script>
<style>
    main{
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.562);
    }
</style>
<main>
    {#if isVisiblePopUp}
        <PopUp />
    {/if}
    {#if isVisibleDialog}
        <DialogBox />
    {/if}
</main>
