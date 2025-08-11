<script lang="ts">
	import AddGunContainer from "./addGunContainer.svelte";
  let addGunVisible:boolean = $state(false);
  let { arrayOfGuns = $bindable()} = $props();
</script>
<!-- svelte-ignore a11y_no_static_element_interactions -->
<style>
    svg{
        grid-column: 3; 
    }
</style>
<!-- svelte-ignore a11y_consider_explicit_label -->
  <!-- svelte-ignore a11y_click_events_have_key_events -->
  <svg xmlns="http://www.w3.org/2000/svg" width="4vh" height="4vh" fill="rgb(228, 61, 61)" class="bi bi-plus-circle-fill" viewBox="0 0 16 16" onclick="{() =>{
    addGunVisible = true
  }}">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
   </svg>
   {#if addGunVisible}
        <AddGunContainer bind:arrayOfGuns bind:addGunVisible={addGunVisible}/>
   {/if}