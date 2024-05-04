<template>
<div class="w-full min-h-[80vh] flex justify-center">

    <div class="w-[96%] flex flex-wrap flex-row justify-between">

    <div class="flex-grow mt-[10px] w-[40%] bg-[#333333] max-w-[700px] ml-[40px] rounded-[9px] p-[20px]">
        <div id="title-container" class="border-b-2 w-full h-[50px] flex justify-center items-center text-[24px]"><h1>{{ problemTitle == "" ? "Problem not found" : problemTitle }}</h1></div>
        <div id="explaining" class="mt-5 ">{{ problemContent }}</div>
    
        <h2 class="mt-9 font-bold ">Input</h2>
        <div id="input-container" class="break-all">{{ problemInput }}</div>
    
        <h2 class="mt-9 font-bold ">Output</h2>
        <div id="output-container">{{ problemOutput }}</div>
    </div>
    

    <div class="flex-grow min-h-[80vh] min-w-[500px] w-[50%] ml-[20px] sticky top-[70px] rounded-[12px] overflow-hidden mt-[10px] h-2 bg-white mr-[40px]">
    
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
        ></MonacoEditor>
    </div>

    </div>

</div>


</template>



<script>
import MonacoEditor from 'monaco-editor-vue3';
import axios from 'axios';


export default {
    props: {
        contest: {
            type: Object,
            required: true
        }
    },
    components: {
        MonacoEditor,
    },

    data() {
        return {
            problemTitle: "",
            problemContent: "",
            problemInput: "",
            problemOutput: "",

            jsonData: {
                fileName: "Example",
                language: localStorage.getItem("extensionName") || "py",
                id: "1",
                code: "use std::io;fn main(){let mut a=String::new();io::stdin().read_line(&mut a).expect(\"Failed to read line\");let a=a.trim().parse::<usize>().expect(\"Invalid input\");let mut b=String::new();io::stdin().read_line(&mut b).expect(\"Failed to read line\");for _ in 0..a{print!(\"{}\",b);}}"
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



    methods: {
        openOptions() {
            this.visibility = this.visibility == "visibility" ? "hhh" : "visibility"
            this.$nextTick(() => { console.log("entered code: " + this.enteredCode) })
        },

        setOption(event) {
            this.selected_option = event.target.dataset.value;
            this.jsonData.language = event.target.dataset.extension;

            this.visibility = this.visibility == "visibility" ? "hhh" : "visibility"

            localStorage.setItem("selectedLanguage", this.selected_option);
            localStorage.setItem("extensionName", this.jsonData.language);
        },

        setDatas() {
            let filteredUrlPath = this.$route.params.cont;
            let datas = this.contest.questions;

            console.log(datas)

            for (let i in datas) {
                console.log(datas[i].title)
                console.log(filteredUrlPath)

                if (datas[i].title == filteredUrlPath) {
                    this.problemContent = datas[i].content;
                    this.problemTitle = datas[i].title;
                    this.problemInput = datas[i].input;
                    this.problemOutput = datas[i].output;
                    this.jsonData.id = datas[i].id;
                }
            }


        },

        submit () {
            const fetchSettings = { method: 'POST', body: JSON.stringify(this.jsonData)};
            console.log(fetchSettings);
            fetch('http://192.168.50.88:8080/codecraft/api/run', fetchSettings)
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    },


    watch: {
        enteredCode() {
            localStorage.setItem("enteredCode", this.enteredCode)
        }


    },
    mounted() {
        this.jsonData.code = this.enteredCode;

                // axios.get('http://localhost:8080/codecraft/api/contest/get', {roomId: localStorage.getItem("roomID")}).then(res => {
        
        axios.get('http://localhost:3233/').then(res => {
            this.setDatas();
        }).catch(err => {
        console.log(err);
        })
    },

}
</script>

<style scoped>

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
</style>