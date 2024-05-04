<script>
import MonacoEditor from 'monaco-editor-vue3';
import axios from 'axios';


export default {
    components: {
        MonacoEditor,
    },

    data() {
        return {
            responded_data: "",
            sorted_data: {},
            javafileName: localStorage.getItem("userName"),

          all_completed: false,


            passed: 'editor',

              problemTitle: "",
              problemContent: "",
              problemInput: "",
              problemOutput: "",
              problemInputFormat: "",
              problemOutputFormat: "",


                jsonData: {
                    fileName: localStorage.getItem("userName"),
                    language: localStorage.getItem("extensionName") || "py",
                    id: "3",
                    code: ""
                },

            options: {
                colorDecorators: true,
                lineHeight: 24,
                tabSize: 2,
                automaticLayout: true,
            },


            visibility: "visibility",
            enteredCode: localStorage.getItem("enteredCode") || "",
            selected_option: localStorage.getItem("selectedLanguage") || "Python",
        }
    },


    created() {
        axios.get('http://localhost:8000/api/questions').then(res => {
        // axios.get('http://localhost:3233/').then(res => {
            // this.responded_data = JSON.stringify(res.data)
            this.responded_data = res.data
            console.log(this.responded_data)
        }).catch(err => {
            console.log(err)
        }).then(() => {
          this.sortData();

            this.setDatas();
            // this.sortData();
            }
        )
    },


    methods: {
      sortData() {
        console.log(this.responded_data);
        this.sorted_data = this.responded_data.slice().sort((a, b) => a.id - b.id);
      },
        openOptions() {
            this.visibility = this.visibility === "visibility" ? "hhh" : "visibility"
            this.$nextTick(() => { console.log("entered code: " + this.enteredCode) })
        },

        setOption(event) {
            this.selected_option = event.target.dataset.value;
            this.jsonData.language = event.target.dataset.extension;

            this.visibility = this.visibility === "visibility" ? "hhh" : "visibility";

            localStorage.setItem("selectedLanguage", this.selected_option);
            localStorage.setItem("extensionName", this.jsonData.language);
        },

        setDatas() {
            let filteredUrlPath = this.$route.params.prob;
            let datas = this.sorted_data;
            console.log("filteredurl:   " + filteredUrlPath)
            for (let i in datas) {
                if (datas[i].id == filteredUrlPath) {


                    this.problemContent = datas[i].content;
                    this.problemTitle = datas[i].title;
                    this.problemInput = datas[i].input;
                    this.problemOutput = datas[i].output;
                    this.jsonData.id = datas[i].id;
                  this.problemOutputFormat = datas[i].output_format;
                  this.problemInputFormat = datas[i].input_format;
                    console.log("id:   " + datas[i].id)

                }
            }

        },

        submit () {
            this.jsonData.code = this.enteredCode;
            const fetchSettings = { method: 'POST', body: JSON.stringify(this.jsonData)};
            console.log(fetchSettings);
          // this.passed = true;
            fetch('http://localhost:8080/codecraft/api/run', fetchSettings)
            .then(response => response.json())
            .then(data => {
                this.passed = data.passed;
                console.log(data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        },

        goBack() {
          this.passed = 'editor'
        },

        nextQuest() {
        let tor = false;
          for (let i of this.sorted_data) {
            if(tor) {
              this.$router.push({path: `${i.id}`, params: {title: "hi", userName: "Almas"}})
              setTimeout(() => {
                window.location.reload();
              }, 100);
              break;
            }

            console.log(i)

            if(this.jsonData.id === this.sorted_data[this.sorted_data.length - 1]){
              this.all_completed = true;
            }

            if (this.problemTitle === i.title){
              tor = true;
            }



          }

        }
    },


    watch: {
        enteredCode() {
            localStorage.setItem("enteredCode", this.enteredCode)
        }
    },


    mounted() {
        this.jsonData.code = this.enteredCode;
    }
}
</script>




<template>

    <div class="min-h-[80vh] relative z-1 flex justify-center" id="main-problem-view">
        <div class="w-[90%] relative ">

            <div class="mt-[50px] w-[600px]  bg-[#333333] max-w-[700px] absolute left-0 rounded-[9px] p-[20px]">
                <div id="title-container" class="border-b-2 w-full h-[50px] flex justify-center items-center text-[24px]"><h1>{{ problemTitle === "" ? "Problem not found" : problemTitle }}</h1></div>
                <div id="explaining" class="mt-5 ">{{ problemContent }}</div>

              <h2 class="mt-9 font-bold ">Input Format</h2>
              <div id="input-container" class="break-all">{{ problemInputFormat }}</div>

              <h2 class="mt-9 font-bold ">Output Format</h2>
              <div id="input-container" class="break-all">{{ problemOutputFormat }}</div>

              <h2 class="mt-9 font-bold ">Sample Input</h2>
              <div id="input-container" class="break-all">{{ problemInput }}</div>

                <h2 class="mt-9 font-bold ">Sample Output</h2>
                <div id="output-container">{{ problemOutput }}</div>
            </div>


                <div class=" min-h-[84vh] min-w-[500px] w-[50%] ml-[20px] absolute top-[0px] right-[0] rounded-[12px] overflow-hidden mt-[50px] h-2 bg-white mr-[40px]">
                    <div class="w-full flex justify-between items-center h-[40px] bg-[#333]">
                        <button id="open_options" class="w-[120px] ml-5 border-[1px] rounded-[4px]" @click="openOptions">{{selected_option}}</button>
                        <div id="options" v-bind:class="visibility" class="w-[200px] z-50 h-[auto] rounded-[20px] bg-[#1a1717] absolute top-[41px] left-3">
                            <div @click="setOption" data-value="Python" data-extension="py">Python</div>
                            <div @click="setOption" data-value="Java" data-extension="java">Java</div>
                            <div @click="setOption" data-value="Javascript" data-extension="js">JavaScript</div>
                            <div @click="setOption" data-value="Cpp" data-extension="cpp">C++</div>
                            <div @click="setOption" data-value="Go" data-extension="go">Go</div>
                            <div @click="setOption" data-value="Rust" data-extension="rs">Rust</div>
                          <div @click="setOption" data-value="PHP" data-extension="php">PHP</div>
                          <div @click="setOption" data-value="Swift" data-extension="swift">Swift</div>
                        </div>

                        <div v-if="selected_option === 'Java'">
                          <div class="rounded-[5px] px-[10px] text-[red]" >The name of your Java class should be '{{ javafileName }}' !</div>
                        </div>

                        <button class="mr-12 w-[80px] h-70% bg-[#38b138] rounded-full text-center hover:cursor-pointer hover:bg-[#2ea13d]" @click="submit">Submit</button>
                    </div>


                    <MonacoEditor id="editor" ref="monaco"
                    theme="vs-dark"
                    :options="options"
                    :language="selected_option.toLocaleLowerCase()"
                    :width="'100%'"
                    :height="'100%'"
                    v-model:value="enteredCode"
                    v-if="passed === 'editor'"
                    ></MonacoEditor>


                  <div class="wrapper" v-if="passed === true">
                    <svg class="animated-check" viewBox="0 0 24 24">
                      <path d="M4.1 12.7L9 17.6 20.3 6.3" fill="none" /> </svg>

                    <div id="next-quest" @click="nextQuest" v-if="all_completed === false">
                      <div>
                        Next question
                      </div>
                    </div>

                    <div id="last-quest" v-if="all_completed === true">
                      <div>
                        It is the last problem
                      </div>
                    </div>

                  </div>

                  <div class="wrapper" v-if="passed === false">

                    <div id="goBack" @click="goBack">
                      <div>
                        Tests are not passed. Try again!
                         <div>Click to go back</div>
                      </div>
                    </div>


                  </div>

                </div>


    </div>
    </div>

</template>

<style scoped>

#goBack {
  width: 300px;
  display: flex;
  padding: 20px;
  text-align: center;
  justify-content: center;
  align-items: center;
  background-color: red;
  border-radius: 20px;
  user-select: none;
}

#last-quest {
  width: 200px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #7ac142;
  border-radius: 20px;
  user-select: none;
}

#next-quest {
  width: 140px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #7ac142;
  border-radius: 20px;
  user-select: none;
}

#next-quest:hover {
  background-color: #4CAF50;
  color: #fff;
  cursor: pointer;
}

.wrapper {
  display: flex;
  height: 100%;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #1e1e1e;
}

.animated-check {
  height: 10em;
  width: 10em
}

.animated-check path {
  fill: none;
  stroke: #7ac142;
  stroke-width: 4;
  stroke-dasharray: 23;
  stroke-dashoffset: 23;
  animation: draw 1s linear forwards;
  stroke-linecap: round;
  stroke-linejoin: round
}

@keyframes draw {
  to {
    stroke-dashoffset: 0
  }
}


    .visibility {
        display: none;
    }

    #options > * {
        width: 100%;
        height: 30px;
        line-height: 30px;
        text-align: center;
    }

    #options > *:hover {
        background-color: #333;
        cursor: pointer;
    }


    #main-problem-view {
        width: 100%;
    }

</style>
