Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18143459B
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Oct 2021 08:59:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3DAB3C4E33
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Oct 2021 08:59:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8140C3C14F3
 for <ltp@lists.linux.it>; Wed, 20 Oct 2021 08:59:38 +0200 (CEST)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5607120108A
 for <ltp@lists.linux.it>; Wed, 20 Oct 2021 08:59:34 +0200 (CEST)
HMM_SOURCE_IP: 172.18.0.48:43930.1302731224
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 764102800A1;
 Wed, 20 Oct 2021 14:59:21 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 951f4f79ba2a4d55a38cd87d4e08198e for
 krzysztof.kozlowski@canonical.com; Wed, 20 Oct 2021 14:59:28 CST
X-Transaction-ID: 951f4f79ba2a4d55a38cd87d4e08198e
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
Date: Wed, 20 Oct 2021 14:59:17 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, 
 ltp <ltp@lists.linux.it>
References: <20211020063220.5885-1-krzysztof.kozlowski@canonical.com>
X-Priority: 3
X-GUID: F1DE4BC2-F558-41EB-AE93-5CBE40645895
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.258[cn]
Mime-Version: 1.0
Message-ID: <202110201459177524146@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: memutils: respect minimum memory
 watermark when polluting memory
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksIApXaHkgbm90IHRvIGRpcmVjdGx5IHJlYWQgbWluaW11bSBtZW1vcnkgd2F0ZXJtYXJrIGZy
b20gL3Byb2Mvc3lzL3ZtL21pbl9mcmVlX2tieXRlcz8KCi0tLS0tCgpUaGFua3PvvIEKCgoKCgpG
cm9tOsKgS3J6eXN6dG9mIEtvemxvd3NraQoKCgpEYXRlOsKgMjAyMS0xMC0yMMKgMTQ6MzIKCgoK
VG86wqBsdHAKCgoKU3ViamVjdDrCoFtMVFBdIFtQQVRDSCB2Ml0gbGliOiBtZW11dGlsczogcmVz
cGVjdCBtaW5pbXVtIG1lbW9yeSB3YXRlcm1hcmsgd2hlbiBwb2xsdXRpbmcgbWVtb3J5CgoKClBy
ZXZpb3VzIGZpeCBmb3IgYW4gb3V0LW9mLW1lbW9yeSBraWxsZXIga2lsbGluZyBpb2N0bF9zZzAx
IHByb2Nlc3MKCgoKaW4gY29tbWl0IDRkMmUzZDQ0ZmFkNSAoImxpYjogbWVtdXRpbHM6IGRvbid0
IHBvbGx1dGUKCgoKZW50aXJlIHN5c3RlbSBtZW1vcnkgdG8gYXZvaWQgT29NIikgd2FzIG5vdCBm
dWxseSBlZmZlY3RpdmUuwqAgV2hpbGUgaXQKCgoKY292ZXJzIG1vc3Qgb2YgdGhlIGNhc2VzLCBh
biBBUk02NCBtYWNoaW5lIHdpdGggMTI4IEdCIG9mIG1lbW9yeSwgNjQga0IKCgoKcGFnZSBzaXpl
IGFuZCB2NS4xMSBrZXJuZWwgaGl0IGl0IGFnYWluLsKgIFBvbGx1dGluZyB0aGUgbWVtb3J5IGZh
aWxzCgoKCndpdGggT29NOgoKCgrCoAoKCgrCoCBMVFA6IHN0YXJ0aW5nIGlvY3RsX3NnMDEKCgoK
wqAgaW9jdGxfc2cwMSBpbnZva2VkIG9vbS1raWxsZXI6IGdmcF9tYXNrPTB4MTAwZGNhKEdGUF9I
SUdIVVNFUl9NT1ZBQkxFfF9fR0ZQX1pFUk8pLCBvcmRlcj0wLCBvb21fc2NvcmVfYWRqPTAKCgoK
wqAgLi4uCgoKCsKgIE1lbS1JbmZvOgoKCgrCoCBhY3RpdmVfYW5vbjozMDkgaW5hY3RpdmVfYW5v
bjoxOTY0NzgxIGlzb2xhdGVkX2Fub246MAoKCgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGFjdGl2ZV9maWxlOjk0IGluYWN0aXZlX2ZpbGU6MCBpc29sYXRlZF9maWxlOjAKCgoK
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bmV2aWN0YWJsZTozMDUgZGlydHk6
MCB3cml0ZWJhY2s6MAoKCgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNsYWJf
cmVjbGFpbWFibGU6MTUxMCBzbGFiX3VucmVjbGFpbWFibGU6NTAxMgoKCgrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcHBlZDoxMTUgc2htZW06MzM5IHBhZ2V0YWJsZXM6NDYz
IGJvdW5jZTowCgoKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZToxMTIw
NDMgZnJlZV9wY3A6MSBmcmVlX2NtYTozMTU5CgoKCsKgIE5vZGUgMCBhY3RpdmVfYW5vbjoxOTc3
NmtCIGluYWN0aXZlX2Fub246MTI1NzQ1OTg0a0IgYWN0aXZlX2ZpbGU6NjAxNmtCIGluYWN0aXZl
X2ZpbGU6MGtCIHVuZXZpY3RhYmxlOjE5NTIwa0IgLi4uCgoKCsKgIE5vZGUgMCBETUEgZnJlZTo3
MTA2NTZrQiBtaW46MjA1MTIwa0IgbG93OjI1NjM4NGtCIGhpZ2g6MzA3NjQ4a0IgcmVzZXJ2ZWRf
aGlnaGF0b21pYzowS0IgYWN0aXZlX2Fub246MGtCIGluYWN0aXZlX2Fub246MzMzMjAzMmtCIC4u
LgoKCgrCoCBsb3dtZW1fcmVzZXJ2ZVtdOiAwIDAgNzkwOCA3OTA4IDc5MDgKCgoKwqAgTm9kZSAw
IE5vcm1hbCBmcmVlOjY0NjAwOTZrQiBtaW46NjQ2MzE2OGtCIGxvdzo4MDc4OTEya0IgaGlnaDo5
Njk0NjU2a0IgcmVzZXJ2ZWRfaGlnaGF0b21pYzowS0IgYWN0aXZlX2Fub246MTk3NzZrQiBpbmFj
dGl2ZV9hbm9uOjEyMjQxMzk1MmtCIC4uLgoKCgrCoCBsb3dtZW1fcmVzZXJ2ZVtdOiAwIDAgMCAw
IDAKCgoKwqAKCgoKVGhlIGltcG9ydGFudCBwYXJ0IGFyZSBkZXRhaWxzIG9mIG1lbW9yeSBvbiBO
b2RlIDAgaW4gTm9ybWFsIHpvbmU6CgoKCjEuIGZyZWUgbWVtb3J5OiA2NDYwMDk2IGtCCgoKCjIu
IG1pbiAobWluaW11bSB3YXRlcm1hcmspOiA2NDYzMTY4IGtCCgoKCsKgCgoKClBhcnNlIHRoZSAv
cHJvYy96b25laW5mbyBhbmQgaW5jbHVkZSB0aGUgIm1pbiIgZGF0YSB3aGVuIGNvdW50aW5nIHNh
ZmV0eQoKCgooZnJlZSBtZW1vcnkgd2hpY2ggc2hvdWxkIG5vdCBiZSBwb2xsdXRlZCkuwqAgVGhp
cyB3YXkgd2UgYWxzbyBpbmNsdWRlCgoKCm1pbmltdW0gbWVtb3J5IGZvciBETUEgem9uZXMgYW5k
IGFsbCBub2Rlcy4KCgoKwqAKCgoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPgoKCgpSZXZpZXdlZC1ieTogTGkgV2Fu
ZyA8bGl3YW5nQHJlZGhhdC5jb20+CgoKClJldmlld2VkLWJ5OiBMaXUgWGlucGVuZyA8bGl1eHAx
MUBjaGluYXRlbGVjb20uY24+CgoKCsKgCgoKCi0tLQoKCgrCoAoKCgpDaGFuZ2VzIHNpbmNlIHYx
OgoKCgoxLiBBZGQgc3RhdGljIGFuZCByZW5hbWUgdG8gY291bnRfbWluX3BhZ2VzKCkuCgoKCi0t
LQoKCgpsaWIvdHN0X21lbXV0aWxzLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tCgoKCjEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
CgrCoAoKCgpkaWZmIC0tZ2l0IGEvbGliL3RzdF9tZW11dGlscy5jIGIvbGliL3RzdF9tZW11dGls
cy5jCgoKCmluZGV4IGFmMTMyYmNjNmMyNC4uOTdmM2I4Mjc1YTQyIDEwMDY0NAoKCgotLS0gYS9s
aWIvdHN0X21lbXV0aWxzLmMKCgoKKysrIGIvbGliL3RzdF9tZW11dGlscy5jCgoKCkBAIC02LDIy
ICs2LDQ5IEBACgoKCiNpbmNsdWRlIDx1bmlzdGQuaD4KCgoKI2luY2x1ZGUgPGxpbWl0cy5oPgoK
CgojaW5jbHVkZSA8c3lzL3N5c2luZm8uaD4KCgoKKyNpbmNsdWRlIDxzdGRpby5oPgoKCgojaW5j
bHVkZSA8c3RkbGliLmg+CgoKCiNkZWZpbmUgVFNUX05PX0RFRkFVTFRfTUFJTgoKCgojaW5jbHVk
ZSAidHN0X3Rlc3QuaCIKCgoKKyNpbmNsdWRlICJ0c3Rfc2FmZV9zdGRpby5oIgoKCgojZGVmaW5l
IEJMT0NLU0laRSAoMTYgKiAxMDI0ICogMTAyNCkKCgoKK3N0YXRpYyB1bnNpZ25lZCBsb25nIGNv
dW50X21pbl9wYWdlcyh2b2lkKQoKCgorewoKCgorIEZJTEUgKmZwOwoKCgorIGludCByZXQ7CgoK
CisgdW5zaWduZWQgbG9uZyB0b3RhbF9wYWdlcyA9IDA7CgoKCisgdW5zaWduZWQgbG9uZyBwYWdl
czsKCgoKKyBjaGFyIGxpbmVbQlVGU0laXTsKCgoKKwoKCgorIGZwID0gU0FGRV9GT1BFTigiL3By
b2Mvem9uZWluZm8iLCAiciIpOwoKCgorCgoKCisgd2hpbGUgKGZnZXRzKGxpbmUsIEJVRlNJWiwg
ZnApICE9IE5VTEwpIHsKCgoKKyByZXQgPSBzc2NhbmYobGluZSwgIiBtaW4gJWx1IiwgJnBhZ2Vz
KTsKCgoKKyBpZiAocmV0ID09IDEpCgoKCisgdG90YWxfcGFnZXMgKz0gcGFnZXM7CgoKCisgfQoK
CgorCgoKCisgU0FGRV9GQ0xPU0UoZnApOwoKCgorCgoKCisgLyogQXBwbHkgYSBtYXJnaW4gYmVj
YXVzZSB3ZSBjYW5ub3QgZ2V0IGJlbG93ICJtaW4iIHdhdGVybWFyayAqLwoKCgorIHRvdGFsX3Bh
Z2VzICs9ICh0b3RhbF9wYWdlcyAvIDEwKTsKCgoKKwoKCgorIHJldHVybiB0b3RhbF9wYWdlczsK
CgoKK30KCgoKKwoKCgp2b2lkIHRzdF9wb2xsdXRlX21lbW9yeShzaXplX3QgbWF4c2l6ZSwgaW50
IGZpbGxjaGFyKQoKCgp7CgoKCnNpemVfdCBpLCBtYXBfY291bnQgPSAwLCBzYWZldHkgPSAwLCBi
bG9ja3NpemUgPSBCTE9DS1NJWkU7CgoKCisgbG9uZyBwYWdlc2l6ZSA9IFNBRkVfU1lTQ09ORihf
U0NfUEFHRVNJWkUpOwoKCgp2b2lkICoqbWFwX2Jsb2NrczsKCgoKc3RydWN0IHN5c2luZm8gaW5m
bzsKCgoKU0FGRV9TWVNJTkZPKCZpbmZvKTsKCgoKLSBzYWZldHkgPSBNQVgoNDA5NiAqIFNBRkVf
U1lTQ09ORihfU0NfUEFHRVNJWkUpLCAxMjggKiAxMDI0ICogMTAyNCk7CgoKCi0gc2FmZXR5ID0g
TUFYKHNhZmV0eSwgKGluZm8uZnJlZXJhbSAvIDY0KSk7CgoKCisgc2FmZXR5ID0gTUFYKDQwOTYg
KiBwYWdlc2l6ZSwgMTI4ICogMTAyNCAqIDEwMjQpOwoKCgorIHNhZmV0eSA9IE1BWChzYWZldHks
IGNvdW50X21pbl9wYWdlcygpICogcGFnZXNpemUpOwoKCgpzYWZldHkgLz0gaW5mby5tZW1fdW5p
dDsKCgoKaWYgKGluZm8uZnJlZXN3YXAgPiBzYWZldHkpCgoKCi0tCgoKCjIuMzAuMgoKCgrCoAoK
CgrCoAoKCgotLQoKCgpNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
