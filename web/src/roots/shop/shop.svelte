<script lang="ts">
	import Body from "./body.svelte";
	import Header from "./header.svelte";
    let arrayOfGuns:Array<any> = $state([]);
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