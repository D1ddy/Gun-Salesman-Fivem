<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
    let { gun } = $props();

</script>
<style>
    div{
        width: 15vh;
        height: 15vh;
        background-color: #555555b6;
        border-radius: 5px;
    }
</style>
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div onclick="{() => {
    fetchNui('getGun',gun)
}}">
<!-- FIXME: INSTEAD OF GUN HASH IT SHOULD SAY THE GUNS MODEL -->
   {gun} 
</div>