Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05C3EAE9E
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 04:34:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 291563C6FE8
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 04:34:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 142483C6C12
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 04:34:38 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 635E41A008AA
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 04:34:32 +0200 (CEST)
X-QQ-mid: bizesmtp41t1628822066tubepssc
Received: from [10.4.23.179] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 10:34:25 +0800 (CST)
X-QQ-SSF: 0040000000200020B000B00A0000000
X-QQ-FEAT: pDrqMl8+oMHAUGVqnzxmj9tUby5N3KPz9h1Pw/BYbqTRtdMb1In9L3WvqeCkl
 b31zmMPxlxF3llPHpFrjfntpa021UDpTleqw7yj3MsRqWn0apID67an8AS0VexPOzfQEzUS
 vaErzMmab9FaH0i13AkT52TvF3F9m9mkH0VNk5vIBuxyXvq4uaHIVnhAvayH2TKsPVFgw78
 j/fehU+PNPKov0I2E2Vs4wonTM1Pht4SXRi9D30yBZUwzXhqzRPCLgMdsLpNZbhy7fmwqGA
 LhrSeFggq5J0ihgYfnj9Ug6Z+bY35K4FZXLbw5CGzmABeXKeT21pYyXx3rqO0wV1KIYXEmW
 nZJUAP5
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210811122235.1627-1-sujiaxun@uniontech.com>
 <YRUaxQjWFSw9Y4J1@yuki>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <763339a3-f4ca-f316-572f-db633fb6f7c9@uniontech.com>+FC4C7902D91DBA65
Date: Fri, 13 Aug 2021 10:34:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YRUaxQjWFSw9Y4J1@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,
 5/6] syscalls/sysfs: Convert sysfs05 to the new API
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T2theSB0aGFuayB5b3UuIEkgd2lsbCBjYXJlZnVsbHkgbW9kaWZ5IGFuZCByZXN1Ym1pdC4KCtTa
IDIwMjEvOC8xMiDPws7nODo1NywgQ3lyaWwgSHJ1YmlzINC0tcA6Cj4gSGkhCj4+IC1jaGFyICpU
Q0lEID0gInN5c2ZzMDUiOwo+PiAtc3RhdGljIGludCBvcHRpb25bM10gPSB7IDEsIDQsIDEgfTsJ
LyogdmFsaWQgYW5kIGludmFsaWQgb3B0aW9uICovCj4+IC1zdGF0aWMgY2hhciAqZnNuYW1lW10g
PSB7ICJleHQwIiwgIiBleHQyIiwgKGNoYXIgKiktMSB9Owo+PiAtCj4+IC1zdGF0aWMgc3RydWN0
IHRlc3RfY2FzZV90IHsKPj4gLQljaGFyICplcnJfZGVzYzsJCS8qZXJyb3IgZGVzY3JpcHRpb24g
Ki8KPj4gLQlpbnQgZXhwX2Vycm5vOwkJLyogZXhwZWN0ZWQgZXJyb3IgbnVtYmVyICovCj4+IC0J
Y2hhciAqZXhwX2VycnZhbDsJLypFeHBlY3RlZCBlcnJvcnZhbHVlIHN0cmluZyAqLwo+PiAtfSB0
ZXN0Y2FzZVtdID0gewo+PiAtCXsKPj4gLQkiSW52YWxpZCBvcHRpb24iLCBFSU5WQUwsICJFSU5W
QUwifSwgewo+PiAtCSJJbnZhbGlkIGZpbGVzeXN0ZW0gbmFtZSIsIEVJTlZBTCwgIkVJTlZBTCAi
fSwgewo+PiAtCSJBZGRyZXNzIGlzIG91dCBvZiB5b3VyIGFkZHJlc3Mgc3BhY2UiLCBFRkFVTFQs
ICJFRkFVTFQgIn0KPj4gKwo+PiArY2hhciAqYmFkX2FkZHI7Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1
Y3QgdGVzdF9jYXNlIHsKPj4gKwlpbnQgb3B0aW9uOwo+PiArCWNoYXIgKmZzbmFtZTsKPj4gKwlp
bnQgZnNpbmRleDsKPj4gKwljaGFyICplcnJfZGVzYzsKPj4gKwlpbnQgZXhwX2Vycm5vOwo+PiAr
fSB0Y2FzZXNbXSA9IHsKPj4gKwl7MSwgImV4dDAiLCAwLCAiSW52YWxpZCBmaWxlc3lzdGVtIG5h
bWUiLCBFSU5WQUx9LAo+PiArCXs0LCAiZXh0NCIsIDAsICJJbnZhbGlkIG9wdGlvbiIsIEVJTlZB
TH0sCj4+ICsJezEsIChjaGFyICopLTEsIDAsICJBZGRyZXNzIGlzIG91dCBvZiB5b3VyIGFkZHJl
c3Mgc3BhY2UiLCBFRkFVTFR9LAo+PiArCXsyLCBOVUxMLCAxMDAwLCAiZnNfaW5kZXggaXMgb3V0
IG9mIGJvdW5kcyIsIEVJTlZBTH0KPj4gICB9Owo+Pgo+PiAtaW50IFRTVF9UT1RBTCA9IEFSUkFZ
X1NJWkUodGVzdGNhc2UpOwo+PiAtCj4+IC1pbnQgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKPj4g
K3N0YXRpYyB2b2lkIHZlcmlmeV9zeXNmczA1KHVuc2lnbmVkIGludCBucikKPj4gICB7Cj4+IC0J
aW50IGxjLCBpOwo+PiAtCj4+IC0JdHN0X3BhcnNlX29wdHMoYWMsIGF2LCBOVUxMLCBOVUxMKTsK
Pj4gLQo+PiAtCXNldHVwKCk7Cj4+IC0KPj4gLQlmb3IgKGxjID0gMDsgVEVTVF9MT09QSU5HKGxj
KTsgbGMrKykgewo+PiAtCj4+IC0JCWZvciAoaSA9IDA7IGkgPCBUU1RfVE9UQUw7IGkrKykgewo+
PiAtCj4+IC0JCQl0c3RfY291bnQgPSAwOwo+PiAtCQkJVEVTVChsdHBfc3lzY2FsbChfX05SX3N5
c2ZzLCBvcHRpb25baV0sIGZzbmFtZVtpXSkpOwo+PiArCj4+ICsJaWYgKG5yIDwgMykKPj4gKwkJ
VFNUX0VYUF9GQUlMKHRzdF9zeXNjYWxsKF9fTlJfc3lzZnMsIHRjYXNlc1tucl0ub3B0aW9uLCB0
Y2FzZXNbbnJdLmZzbmFtZSksCj4+ICsJCQkJCXRjYXNlc1tucl0uZXhwX2Vycm5vLCAiJXMiLCB0
Y2FzZXNbbnJdLmVycl9kZXNjKTsKPj4gKwllbHNlCj4+ICsJCVRTVF9FWFBfRkFJTCh0c3Rfc3lz
Y2FsbChfX05SX3N5c2ZzLCB0Y2FzZXNbbnJdLm9wdGlvbiwgdGNhc2VzW25yXS5mc2luZGV4LCBi
YWRfYWRkciksCj4+ICsJCQkJCXRjYXNlc1tucl0uZXhwX2Vycm5vLCAiJXMiLCB0Y2FzZXNbbnJd
LmVycl9kZXNjKTsKPiAKPiBEZXBlbmRpbmcgb24gdGhlIGluZGV4IGhlcmUgaXMgdWdseSBoYWNr
IGFuZCB0aGVyZSBpcyBhYnNvbHV0ZWxseSBubwo+IHJlYXNvbiB0byBkbyBzby4gV2UgY2FuIHN3
aXRjaCBvbiB0aGUgb3B0aW9uIGVhc2lseSBpbnN0ZWFkIHdpdGg6Cj4gCj4gCWlmICh0Y2FzZXNb
bnJdLm9wdGlvbiA9PSAxKSB7Cj4gCQkvKiBjYWxsIHdpdGggZnNuYW1lICovCj4gCX0gZWxzZSB7
Cj4gCQkvKiBjYWxsIHdpdGggZnMgaW5kZXggKi8KPiAJfQo+IAo+IAo+IEFsc28gdGVzdHMgdXN1
YWxseSBzdG9yZSBhIHBvaW50ZXIgdG8gdGhlIGN1cnJlbnQgdGVzdGNhc2VzIGF0IHRoZSBzdGFy
dAo+IG9mIHRoZSB2ZXJpZnkgZnVuY3Rpb24gdG8gbWFrZSB0aGUgY29kZSBzbGlnaHRseSBzaG9y
dGVyIGFzOgo+IAo+IHN0YXRpYyB2b2lkIHZlcmlmeV9mb28odW5zaWduZWQgaW50IG4pCj4gewo+
IAlzdHJ1Y3QgdGNhc2UgKnRjID0gJnRjYXNlc1tuXTsKPiAKPiAJaWYgKHRjLT5vcHRpb24gPT0g
MSkgewo+IAo+IC4uLgo+IAo+IH0KPiAKPj4gLQkJCS8qIGNoZWNrIHJldHVybiBjb2RlICovCj4+
IC0JCQlpZiAoKFRFU1RfUkVUVVJOID09IC0xKQo+PiAtCQkJICAgICYmIChURVNUX0VSUk5PID09
IHRlc3RjYXNlW2ldLmV4cF9lcnJubykpIHsKPj4gLQkJCQl0c3RfcmVzbShUUEFTUywKPj4gLQkJ
CQkJICJzeXNmcygyKSBleHBlY3RlZCBmYWlsdXJlOyIKPj4gLQkJCQkJICIgR290IGVycm5vIC0g
JXMgOiAlcyIsCj4+IC0JCQkJCSB0ZXN0Y2FzZVtpXS5leHBfZXJydmFsLAo+PiAtCQkJCQkgdGVz
dGNhc2VbaV0uZXJyX2Rlc2MpOwo+PiAtCQkJfSBlbHNlIHsKPj4gLQkJCQl0c3RfcmVzbShURkFJ
TCwgInN5c2ZzKDIpIGZhaWxlZCB0byBwcm9kdWNlIgo+PiAtCQkJCQkgIiBleHBlY3RlZCBlcnJv
cjsgJWQsIGVycm5vIgo+PiAtCQkJCQkgIjogJXMgYW5kIGdvdCAlZCIsCj4+IC0JCQkJCSB0ZXN0
Y2FzZVtpXS5leHBfZXJybm8sCj4+IC0JCQkJCSB0ZXN0Y2FzZVtpXS5leHBfZXJydmFsLCBURVNU
X0VSUk5PKTsKPj4gLQkJCX0KPj4gLQo+PiAtCQl9CQkvKkVuZCBvZiBURVNUIExPT1BTICovCj4+
IC0JfQo+PiAtCj4+IC0JLypDbGVhbiB1cCBhbmQgZXhpdCAqLwo+PiAtCWNsZWFudXAoKTsKPj4g
LQo+PiAtCXRzdF9leGl0KCk7Cj4+IC19CQkJCS8qRW5kIG9mIG1haW4gKi8KPj4gK30KPj4KPj4g
LS8qIHNldHVwKCkgLSBwZXJmb3JtcyBhbGwgT05FIFRJTUUgc2V0dXAgZm9yIHRoaXMgdGVzdCAq
Lwo+PiAgIHZvaWQgc2V0dXAodm9pZCkKPiAKPiBtaXNzaW5nIHN0YXRpYwo+IAo+PiAgIHsKPj4g
LQo+PiAtCXRzdF9zaWcoTk9GT1JLLCBERUZfSEFORExFUiwgY2xlYW51cCk7Cj4+IC0KPj4gLQlU
RVNUX1BBVVNFOwo+PiArCWJhZF9hZGRyID0gdHN0X2dldF9iYWRfYWRkcihOVUxMKTsKPiAKPiBJ
c24ndCB0aGUgYmFkIGFkZHJlc3MgdW51c2VkIGhlcmU/Cj4gCj4gV2hhdCB3ZSBzaG91bGQgZG8g
aW5zdGVhZCBpcyB0byBsb29wIG92ZXIgdGhlIHRjYXNlcyBhcnJheSBoZXJlIGFuZCBzZXQKPiB0
aGUgZnNuYW1lIHRvIHRoZSBiYWQgYWRkcmVzcyB3aGVuIGV4cF9lcnJubyBpcyBzZXQgdG8gRUZB
VUxULgo+IAo+PiAgIH0KPj4KPj4gLS8qCj4+IC0qIGNsZWFudXAoKSAtIFBlcmZvcm1zIG9uZSB0
aW1lIGNsZWFudXAgZm9yIHRoaXMgdGVzdCBhdAo+PiAtKiBjb21wbGV0aW9uIG9yIHByZW1hdHVy
ZSBleGl0Cj4+IC0qLwo+PiAtdm9pZCBjbGVhbnVwKHZvaWQpCj4+IC17Cj4+ICtzdGF0aWMgc3Ry
dWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4+ICsJLnNldHVwID0gc2V0dXAsCj4+ICsJLnRjbnQgPSBB
UlJBWV9TSVpFKHRjYXNlcyksCj4+ICsJLnRlc3QgPSB2ZXJpZnlfc3lzZnMwNSwKPj4gK307Cj4+
Cj4+IC19Cj4+IC0tCj4+IDIuMjAuMQo+Pgo+Pgo+Pgo+Pgo+PiAtLSAKPj4gTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4gCgotLSAKS2luZCBy
ZWdhcmRzLAoKc3VqaWF4dW4KCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
