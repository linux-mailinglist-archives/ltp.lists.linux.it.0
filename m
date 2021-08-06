Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E03E22FB
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 07:42:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BED63C7AF8
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 07:42:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A66CA3C0926
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:42:35 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2D03C10006C2
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:42:31 +0200 (CEST)
X-QQ-mid: bizesmtp44t1628228543tdyqq3n8
Received: from [192.168.31.178] (unknown [180.110.162.144])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 13:42:22 +0800 (CST)
X-QQ-SSF: 0040000000200030B000000C0000000
X-QQ-FEAT: PAtBXkQ2bGDFbvdumqouH8oHQaOP4oq6EUP/PNsujWaR0/YS4X110BZHRVjZr
 A4NLZ1Rm5FaOZAwUOCzui+LtD1y0AwsqVRr7pOGeGSSIzKfZ05DTcrNAvT+y0BF7wWvtzj7
 lyWD7Cy3eMhMIDqJGLxmIg/owGVn/3A7z/Lcu4GAyYl8mPlP90uAiI5jvjfWxF5v5hMy9LB
 V5Ccin4nv7jJFmeKZyvjLFeJ11JsB8rHUnDE2fmVbANxQzL4U3yfXA8txmeKwW55FsYxPDG
 jGY8x1h7OOCJWSwyRzm0ZbXFzjXPGMTxS6LecXldG3N98diFEyEo4NVrYt1bPG3VBrTIs5P
 OlFH8yZ
X-QQ-GoodBg: 2
To: Joerg Vehlow <lkml@jv-coder.de>, ltp@lists.linux.it
References: <20210806032131.25721-1-zhanglianjie@uniontech.com>
 <b208d879-0d31-ff16-4ef0-d363e9a65c51@jv-coder.de>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <d550840f-f0dc-0e9d-aa2a-54970ca7619e@uniontech.com>+661201FF716C5BBC
Date: Fri, 6 Aug 2021 13:42:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b208d879-0d31-ff16-4ef0-d363e9a65c51@jv-coder.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_tmpdir: tst_get_tmpdir() add error handing
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4gT24gOC82LzIwMjEgNToyMSBBTSwgemhhbmdsaWFuamllIHdyb3RlOgo+PiBTaWduZWQt
b2ZmLWJ5OiB6aGFuZ2xpYW5qaWUgPHpoYW5nbGlhbmppZUB1bmlvbnRlY2guY29tPgo+Pgo+PiBk
aWZmIC0tZ2l0IGEvbGliL3RzdF90bXBkaXIuYyBiL2xpYi90c3RfdG1wZGlyLmMKPj4gaW5kZXgg
MGMzOWViODlmLi5mMDA2ZTQ4OTMgMTAwNjQ0Cj4+IC0tLSBhL2xpYi90c3RfdG1wZGlyLmMKPj4g
KysrIGIvbGliL3RzdF90bXBkaXIuYwo+PiBAQCAtMTA4LDEyICsxMDgsMTggQEAgaW50IHRzdF90
bXBkaXJfY3JlYXRlZCh2b2lkKQo+Pgo+PiDCoCBjaGFyICp0c3RfZ2V0X3RtcGRpcih2b2lkKQo+
PiDCoCB7Cj4+ICvCoMKgwqAgY2hhciAqcmV0ID0gTlVMTDsKPj4gKwo+PiDCoMKgwqDCoMKgIGlm
IChURVNURElSID09IE5VTEwpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9icmttKFRCUk9L
LCBOVUxMLCAieW91IG11c3QgY2FsbCB0c3RfdG1wZGlyKCkgZmlyc3QiKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBOVUxMOwo+PiDCoMKgwqDCoMKgIH0KPj4KPj4gLcKgwqDCoCByZXR1
cm4gc3RyZHVwKFRFU1RESVIpOwo+PiArwqDCoMKgIHJldCA9IHN0cmR1cChURVNURElSKTsKPiBJ
cyBhIGZhaWxpbmcgc3RyZHVwIGhlcmUgcmVhbGx5IGEgdGhpbmc/IFRoZSBvbmx5IHJlYXNvbiBz
dHJkdXAgc2hvdWxkIAo+IGJlIGFibGUgdG8gZmFpbCBpcyB3aXRoIEVOT01FTS4KPiBUaGUgb25s
eSB3YXkgdHN0X2Jya20gd2lsbCB3b3JrLCBpZiBzdHJkdXAgZmFpbHMgaGVyZSBpcywgaWYgVEVT
VERJUiBpcyAKPiBhbiBleHRyZW1lbHkgaHVnZSBzdHJpbmcgKHRoZSBOVUxMIGNhc2UgaXMgYWxy
ZWFkeSBoYW5kbGVkIGFib3ZlKS4KSWYgZG9u4oCZdCBjb25zaWRlciBhIHZlcnkgaHVnZSBzdHJp
bmcsIHlvdSBkb27igJl0IG5lZWQgdG8gbW9kaWZ5IGl0IGhlcmUuIApUaGlzIGlzIGEgaGFiaXR1
YWwganVkZ21lbnQuClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCj4+ICvCoMKgwqAgaWYgKCFy
ZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCB0c3RfYnJrbShUQlJPSywgTlVMTCwgInN0cmR1cCgpIGZh
aWxlZCIpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqAgfQo+Pgo+PiDCoCBjb25z
dCBjaGFyICp0c3RfZ2V0X3N0YXJ0d2Qodm9pZCkKPj4gLS0gCj4+IDIuMjAuMQo+Pgo+Pgo+IEpv
ZXJnCj4gCgotLSAKUmVnYXJkcywKWmhhbmcgTGlhbmppZQoKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
