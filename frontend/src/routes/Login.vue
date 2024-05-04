<script setup>

</script>

<template>
  <div>
    <div>
        <div class="container w-[460px] h-[500px] p-[16px] bg-[#333] ml-auto mr-auto mt-[50px]">
          <div class="text-[24px] text-center">Log in or sign up for Cactus</div>
          <form class="flex flex-col items-center w-[90%] mt-8 ml-auto mr-auto">
            <div class="w-full box-border pl-10"><label for="uname" class=""><b>Username</b></label></div>
            <input type="text" placeholder="Enter Username" name="uname" >

            <div class="w-full box-border pl-10"><label for="psw" class=""><b>Password</b></label></div>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <button type="submit" class="btn">Login</button>
          </form>
          <h1 class="font-bold text-center mt-9">Or your can sign in with:</h1>
          <div class="ml-auto mr-auto flex mt-[20px] justify-around w-[70%]">
            <div id="google" class="w-[40px] h-[40px]"><img src="/social.png" alt="google"></div>
            <div class="w-[40px] h-[40px] ml-9"><img src="/github.png" alt="github"></div>
          </div>
      </div>

      <footer>

      </footer>
    </div>
  </div>
</template>

<style scoped>

.container {
  border: 1px solid black;
  border-radius: 4px;
}

.container input {
  width: 80%;
  border-radius: 5px;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;

  border: none;
  background: #f1f1f1;
}
.container input:focus {
  background-color: #ddd;
  outline: none;
}
.btn {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 80%;
  opacity: 0.9;
}
.btn:hover {
  opacity:1;
}
</style>