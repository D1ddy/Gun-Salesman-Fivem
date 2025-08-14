<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
    import { WeaponModel } from "./weapons";
    let { gun } = $props();

</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap');
    div{
        width: 15vh;
        height: 15vh;
        background-color: #555555b6;
        border-radius: 5px;
        font-family: "Google Sans Code", monospace;
        font-optical-sizing: auto;
        font-weight: 500;
        font-style: normal;
        font-size: 2vh;
    }
    div:hover{
        background-color: #636363b6;
    }
    img{
        object-fit: contain;
        width: 90%;
        height: 100%;
        
    }
</style>
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div onclick="{() => {
      fetchNui('getGun',[WeaponModel[gun.gunName],gun.price]);
}}">
   <img src='/web/src/static/weaponImg/{gun.gunName}.png' alt="{gun.gunName}">
   {gun.price} 
</div>