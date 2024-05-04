<script>
    console.log("Hello world");
</script>

<template>

            <div id="home-container" class="w-full flex flex-col items-center mt-20">
<!--                <table id="company-table">-->
<!--                    <tr>-->
<!--                        <th>COMPANY</th>-->
<!--                        <th>PROGRAMMERS</th>-->
<!--                    </tr>-->
<!--                    <tr>-->
<!--                        <td><img class="w-[80px] h-[80px] rounded-full" src="/cactus.jpeg" alt="company image"></td>-->
<!--                        <td class="font-semibold text-[20px] flex flex-col"><p>Senior Full-stack Developer Zhakanov Almas</p> <p> Senior Full-stack Developer Tolymbek Nurtai</p> <p> Junior Developer Zhunisbek Ualikhan</p>-->
<!--                        </td>-->
<!--                    </tr>-->
<!--                </table>-->

              <div class="w-full bg-[#333]">
                <div class="flex th w-full">
                  <div class="company-container w-[30%]">COMPANY</div>
                  <div class="company-container w-[70%]">DESCRIPTION</div>
                </div>

                <div class="flex w-full td">
                  <div class="company-container w-[30%]"><img src="/cactus.jpeg" alt="company image" class="w-[80px] h-[80px] rounded-full"></div>
                  <div class="company-container text-[22px] w-[70%]">Team of software engineers from IITU in Almaty.</div>
                </div>
              </div>


              <div class="w-full mt-[100px] bg-[#333]">
                <div class="team-container px-20 py-20 bg-[#343257] ">
                  <div class="company-container w-[30%]">TEAM</div>
                  <div class="company-container w-[70%]">POSITION</div>
                </div>

                <div class="team-container td">
                  <div class="company-container w-[30%]">Zhakanov Almas</div>
                  <div class="company-container w-[70%]">Senior Software Engineer</div>
                </div>

                <div class="team-container td">
                  <div class="company-container w-[30%]">Tolymbek Nurtai</div>
                  <div class="company-container w-[70%]">Senior Software Engineer</div>
                </div>

                <div class="team-container td">
                  <div class="company-container w-[30%]">Zhunisbek Ualikhan</div>
                  <div class="company-container w-[70%]">Junior Software Engineer</div>
                </div>
              </div>

              <div class="w-full   bg-[#333]">
                <div class="team-container px-20 py-20 bg-[#343257] ">
                  <div class="company-container w-[50%]">Email</div>
                  <div class="company-container w-[70%]">Phone Number</div>
                  <div class="company-container w-[70%]">Instagram</div>

                </div>

                <div class="team-container td">
                  <div class="company-container w-[50%]">almas.zh22@gmail.com</div>
                  <div class="company-container w-[70%]">+7 747 994 3560</div>
                  <div class="company-container w-[70%]">almaszh22</div>
                </div>

                <div class="team-container td">
                  <div class="company-container w-[50%]">nurtai@gmail.com</div>
                  <div class="company-container w-[70%]">+7 705 250 5839</div>
                  <div class="company-container w-[70%]">justnuka</div>
                </div>

                <div class="team-container td">
                  <div class="company-container w-[50%]">ualikhan@gmail.com</div>
                  <div class="company-container w-[70%]">+7 777 756 4507</div>
                  <div class="company-container w-[70%]">uali</div>
                </div>
                <div></div>
              </div>

            </div>

</template>


<style>

.th {
    padding: 10px;
    background-color: #343257;
    text-align: start;
}

.td {
    padding: 50px;
    background-color: #4d5a77;
    padding: 20px;
    align-items: center;
}

#company-table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
}

#home-container > * {
    margin-top: 40px;
    width: 80%;
    border-radius: 9px;
    overflow: hidden;
}


.company-container {
  display: flex;
  justify-content: center;
}

.team-container {
  display: flex;
  width: 100%;
  padding: 12px;
  font-size: 20px;
}

footer {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
  position: fixed;
  bottom: 0;
  width: 100%;
}



</style>