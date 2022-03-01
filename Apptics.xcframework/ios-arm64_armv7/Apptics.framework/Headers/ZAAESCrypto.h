//
//  ZAAESCrypto.h
//  ZAnalytics
//
//  Copyright © 2018 zoho. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface ZAAESCrypto : NSObject

@property (nonatomic, readonly, nonnull) NSString *password;
@property (nonatomic, readonly, nonnull) NSData *salt;
@property (nonatomic, readonly, nonnull) NSData *iv;

+(ZAAESCrypto* _Nonnull) sharedManager;

- (instancetype _Nonnull)initWithPassword:(NSString *_Nonnull)password salt:(NSData *_Nonnull)salt iv:(NSData *_Nonnull)iv;
// Convenient shorthand. Will randomly generate salt and iv.
- (instancetype _Nonnull)initWithPassword:(NSString *_Nonnull)password;

+ (NSData *_Nonnull)randomDataOfLength:(size_t)length;
- (NSData *_Nonnull)encrypt:(NSData *_Nullable)data;
- (NSData *_Nullable)decrypt:(NSData *_Nonnull)data;
- (NSString* _Nullable)getBase64StringFor:(NSString* _Nonnull) string;
@end


@interface RSA : NSObject

// return base64 encoded string
+ (NSString *_Nullable)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
// return raw data
+ (NSData *_Nullable)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
// return base64 encoded string
+ (NSString *_Nullable)encryptString:(NSString *)str privateKey:(NSString *)privKey;
// return raw data
+ (NSData *_Nullable)encryptData:(NSData *)data privateKey:(NSString *)privKey;

// decrypt base64 encoded string, convert result to string(not base64 encoded)
+ (NSString *_Nullable)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *_Nullable)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *_Nullable)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *_Nullable)decryptData:(NSData *)data privateKey:(NSString *)privKey;

@end

NS_ASSUME_NONNULL_END
