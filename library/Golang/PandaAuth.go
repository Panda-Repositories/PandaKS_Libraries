package PandaAuth

import (
	"crypto/sha256" // Secure your IP
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

func getip() string {
	resp, err := http.Get("https://api.ipify.org") // Getting your IP
	if err != nil {
		fmt.Println("ERROR IN HTTP GET:", err)
		return "BAD_REQUEST"
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("ERROR IN READ:", err)
		return "BAD_READ"
	}

	return string(body)
}

func HashSHA256(data string) string {
	hash := sha256.Sum256([]byte(data))
	return fmt.Sprintf("%x", hash)
}

func GetKey(service string) string {

	ip := HashSHA256(getip()) // Secure your IP with sha256 good luck using brute force
	getkey := string("https://pandadevelopment.net/getkey?service=" + service + "&hwid=" + ip)

	return getkey
}

func ValidateKey(key string, service string) bool {
	resp, err := http.Get("https://pandadevelopment.net/v2_validation?key=" + key + "&service=" + service + "&hwid=" + HashSHA256(getip()))
	if err != nil {
		fmt.Println("ERROR IN HTTP GET:", err)
		return false
	}
	defer resp.Body.Close()

	var info map[string]interface{}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("ERROR READING RESPONSE BODY:", err)
		return false
	}

	err2 := json.Unmarshal(body, &info)
	if err2 != nil {
		fmt.Println("ERROR UNMARSHALING JSON:", err2)
		return false
	}

	success, ok := info["V2_Authentication"].(string)
	if !ok {
		fmt.Println("ERROR: 'success' field is missing or not a boolean")
		return false
	}

	return success == "success"
}

func ValidatePremiumKey(key string, service string) bool {
	url := "https://pandadevelopment.net/v2_validation?key=" + key + "&service=" + service + "&hwid=" + HashSHA256(getip())
	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("ERROR IN HTTP GET:", err)
		return false
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("ERROR READING RESPONSE BODY:", err)
		return false
	}

	// fmt.Println("Response Body:", string(body))

	var info map[string]interface{}
	err2 := json.Unmarshal(body, &info)
	if err2 != nil {
		fmt.Println("ERROR UNMARSHALING JSON:", err2)
		return false
	}

	if keyInfo, ok := info["Key_Information"]; ok {
		if keyMap, ok := keyInfo.(map[string]interface{}); ok {
			premiumMode, ok := keyMap["Premium_Mode"].(bool)
			if !ok {
				fmt.Println("ERROR: 'Premium_Mode' field is missing or not a boolean")
				return false
			}
			return premiumMode
		} else {
			fmt.Println("ERROR: 'Key_Information' is not a map")
		}
	} else {
		fmt.Println("ERROR: 'Key_Information' field is missing")
	}
	return false
}
