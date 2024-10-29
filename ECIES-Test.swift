import Foundation
import CommonCrypto

let privateKey: SecKey = //...
let publicKey: SecKey = //...

let plainText = "Hello, World!"

let plainTextData = plainText.data(using: .utf8)!
let cipherTextData = SecKeyCreateEncryptedData(publicKey, .eciesEncryptionCofactorX963SHA256AESGCM, plainTextData as CFData, nil)! as Data

let decryptedData = SecKeyCreateDecryptedData(privateKey, .eciesEncryptionCofactorX963SHA256AESGCM, cipherTextData as CFData, nil)! as Data
let decryptedText = String(data: decryptedData, encoding: .utf8)
