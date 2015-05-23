#尋找幸福 AdoptTaipei

第一屆臺北市政府開放資料黑客松 
Keynote：https://goo.gl/3QmMXW
GitHub：https://goo.gl/Nzf8aO
Youtube：https://www.youtube.com/watch?v=r4o0y5qzEf0

##認養動物 f4a75ba9-7721-4363-884d-c3820b0b917c
http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire
&rid=f4a75ba9-7721-4363-884d-c3820b0b917c


## 收容
- 通報去抓
- 棄養送過去
- 撿到

## 撲殺原則 - 一個籠子 3-5, 籠子滿了就會排安樂
- 有攻擊性
- 沒辦法治癒的病(10%)會傳染給別的狗
- 太久沒被領養的

成犬區/ 幼犬

提供民眾捐款
	狗媽媽 - 私營

## 目前領養流程
1. 公布寵物領養日期
2. 時間內排隊簽到
3. 簽到的人數抽一位


## Issue
1. 惡意的領養者 - 有的人會領養後又棄養, 一個身分證可以認養20支狗, 追蹤認養的人, 看是不是好人
2. 流程誤會造成雙方困擾 - 資料不夠即時, 會造成領養的人撲空
3. 電影/電視造成某種動物流行(忠犬小八) - 領養跟棄養的都多


## 解決方案
- 幫助動物找到主人
- 增進領養流程 (領養流程增進可以領養代替購買)

```
動物 {
	followedNumber,
	領養number
}
動態 - 領養日期預告, 被領養了


User {
	已領養動物[],
	following[],
}
```

1. 瀏覽動物
	- 隨機 
	- 過濾 (做在個人設定裡) 
2. 對動物的動作
	- Like 動物 (follow 動物 動向推撥 1. 領養時間點 2. 被領養了說再見
	- 領養(需註冊) 
3. 目前領養的動物

## 其他
* 領養須知 - 在要領養動物的動作之前, 自我評估 http://animal-adoption.coa.gov.tw/estimate
* 電話認證註冊 - 或Fb login
* 領養系統改進
