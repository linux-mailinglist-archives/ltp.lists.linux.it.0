Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E858C1F5471
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 14:20:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92BF33C2E23
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 14:20:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 05BA43C25FE
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 14:20:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 854EE200DD6
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 14:20:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; d="scan'208";a="94244573"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 20:20:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3122D4CE26D3;
 Wed, 10 Jun 2020 20:19:56 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 20:19:56 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Jan Stancek <jstancek@redhat.com>
References: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
 <1591767427-29383-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1904123764.15455071.1591784009893.JavaMail.zimbra@redhat.com>
 <787d0f86-269b-1e23-2631-2c420d6dd884@cn.fujitsu.com>
Message-ID: <3cdd6be2-c27a-e9dc-2559-c6577239a1bc@cn.fujitsu.com>
Date: Wed, 10 Jun 2020 20:19:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <787d0f86-269b-1e23-2631-2c420d6dd884@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3122D4CE26D3.AD039
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSmFuCgoKPiBIaSBKYW4KPiAKPiAKPj4KPj4KPj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAt
LS0tLQo+Pj4KPj4+IFVzaW5nIGRmIGNtZCAoZGYgLVQgL3RtcC94eHh4eC90ZXN0LmltZyl0byBn
ZXQgdGhlIGNvcnJlY3QgYmxvY2sgZGV2Lgo+Pgo+PiBXaGF0IEkgaGFkIGluIG1pbmQgd2FzIHRv
IHRha2UgImRmIC1UIiBhcyBpbnNwaXJhdGlvbiwgbm90IGNhbGwgaXQgCj4+IGRpcmVjdGx5LAo+
PiBidXQgdGhhdCBjb3VsZCB3b3JrIHRvby4gU2VlIG5vdGVzIGJlbG93Lgo+Pgo+Pj4gK3N0YXRp
YyB2b2lkIGZpbmRfYmFja2luZ19iZHBhdGgoY2hhciAqYnVmKQo+Pj4gK3sKPj4+ICvCoMKgwqAg
Y2hhciBsaW5lW1BBVEhfTUFYXTsKPj4+ICvCoMKgwqAgRklMRSAqZmlsZTsKPj4+ICsKPj4+ICvC
oMKgwqAgZmlsZSA9IFNBRkVfRk9QRU4oIjEudHh0IiwgInIiKTsKPj4+ICsKPj4+ICvCoMKgwqAg
d2hpbGUgKGZnZXRzKGxpbmUsIHNpemVvZihsaW5lKSwgZmlsZSkgIT0gTlVMTCkKPj4+ICvCoMKg
wqDCoMKgwqDCoCBzc2NhbmYobGluZSwgIiVzIiwgYnVmKTsKPj4KPj4gVGhpcyB3aWxsIHRha2Ug
dGhlIGxhc3QgbGluZSBvZiBvdXRwdXQsIHdoaWNoIGNhbiBiZSBhIHByb2JsZW0gYXMgc29tZQo+
PiB2ZXJzaW9uIGFsaWduIG91dHB1dCBkaWZmZXJlbnRseS4gRm9yIGV4YW1wbGU6Cj4+Cj4+ICMg
ZGYgLVQgLgo+PiBGaWxlc3lzdGVtwqDCoMKgwqDCoMKgwqDCoMKgwqAgVHlwZSAxSy1ibG9ja3PC
oMKgwqAgVXNlZCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4+IC9kZXYvbWFwcGVyL3ZnX2Ro
Y3AxMzU3OS1sdl9yb290Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBleHQ0wqAgNDY5NjcxNjAgMzEwMjIzMsKgIDQxNDcyNDU2wqDCoCA3JSAvCj4+Cj4+IGNh
biBicmVhayBvdXRwdXQgaW50byB0d28gbGluZXMuCj4gWWVzLgo+Pgo+Pj4gK8KgwqDCoCBTQUZF
X0ZDTE9TRShmaWxlKTsKPj4+ICt9Cj4+PiArCj4+PiDCoCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQo+Pj4gwqAgewo+Pj4gLcKgwqDCoCBpbnQgZmQ7Cj4+PiAtwqDCoMKgIHN0cnVjdCBzdGF0IGJ1
ZjsKPj4+ICvCoMKgwqAgY2hhciBidWZbMTAwXTsKPj4+ICvCoMKgwqAgY29uc3QgY2hhciAqY29u
c3QgZGZfY21kW10gPSB7ImRmIiwgIi1UIiwgIi4iLCBOVUxMfTsKPj4+IMKgwqDCoMKgwqAgaWYg
KHRzdF9mc190eXBlKCIuIikgPT0gVFNUX1RNUEZTX01BR0lDKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHRzdF9icmsoVENPTkYsICJ0bXBmZCBkb2Vzbid0IHN1cHBvcnQgT19ESVJFQ1QgZmxhZyIp
Owo+Pj4gQEAgLTEwOSwxMyArMTIyLDYgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPj4+IMKg
wqDCoMKgwqAgc3ByaW50ZihzeXNfbG9vcF9kaW9wYXRoLCAiL3N5cy9ibG9jay9sb29wJWQvbG9v
cC9kaW8iLCBkZXZfbnVtKTsKPj4+IMKgwqDCoMKgwqAgdHN0X2ZpbGxfZmlsZSgidGVzdC5pbWci
LCAwLCAxMDI0LCAxMDI0KTsKPj4+IC3CoMKgwqAgZmQgPSBTQUZFX09QRU4oInRlc3QuaW1nIiwg
T19SRE9OTFkpOwo+Pj4gLcKgwqDCoCBTQUZFX0ZTVEFUKGZkLCAmYnVmKTsKPj4+IC3CoMKgwqAg
U0FGRV9DTE9TRShmZCk7Cj4+PiAtCj4+PiAtwqDCoMKgIGxvZ2ljYWxfYmxvY2tfc2l6ZSA9IGJ1
Zi5zdF9ibGtzaXplOwo+Pj4gLcKgwqDCoCB0c3RfcmVzKFRJTkZPLCAiYmFja2luZyBkZXYgbG9n
aWNhbF9ibG9ja19zaXplIGlzICVkIiwgCj4+PiBsb2dpY2FsX2Jsb2NrX3NpemUpOwo+Pj4gLQo+
Pj4gwqDCoMKgwqDCoCB0c3RfYXR0YWNoX2RldmljZShkZXZfcGF0aCwgInRlc3QuaW1nIik7Cj4+
PiDCoMKgwqDCoMKgIGF0dGFjaF9mbGFnID0gMTsKPj4+IMKgwqDCoMKgwqAgZGV2X2ZkID0gU0FG
RV9PUEVOKGRldl9wYXRoLCBPX1JEV1IpOwo+Pj4gQEAgLTEzMCwxMyArMTM2LDI0IEBAIHN0YXRp
YyB2b2lkIHNldHVwKHZvaWQpCj4+PiDCoMKgwqDCoMKgwqAgKsKgwqAgc2l6ZSBvZiBsb29wIGlz
IGJpZ2dlciB0aGFuIHRoZSBiYWNraW5nIGRldmljZSdzIGFuZCB0aGUgbG9vcAo+Pj4gwqDCoMKg
wqDCoMKgICrCoMKgIG5lZWRuJ3QgdHJhbnNmb3JtIHRyYW5zZmVyLgo+Pj4gwqDCoMKgwqDCoMKg
ICovCj4+PiAtwqDCoMKgIFRTVF9SRVRSWV9GVU5DKGlvY3RsKGRldl9mZCwgTE9PUF9TRVRfQkxP
Q0tfU0laRSwgCj4+PiBsb2dpY2FsX2Jsb2NrX3NpemUpLAo+Pj4gVFNUX1JFVFZBTF9FUTApOwo+
Pj4gK8KgwqDCoCBTQUZFX0NNRChkZl9jbWQsICIxLnR4dCIsIE5VTEwpOwo+Pgo+PiBUaGlzIGNv
dWxkIGJlIHBhcnQgb2YgZmluZF9iYWNraW5nX2JkcGF0aCgpIGZ1bmN0aW9uLgo+IFllcy4KPj4K
Pj4gV2hhdCBJIGhhZCBpbiBtaW5kIHdoZW4gSSByZWZlcnJlZCB0byBkZiB3YXMgc29tZXRoaW5n
IGxpa2U6Cj4+IMKgwqAgc3RhdCgidGVzdC5pbWciLCAmc3RhdGJ1Zik7Cj4+IMKgwqAgU0FGRV9N
S05PRCgiYmxrZGV2IiwgU19JRkJMSyB8IFNfSVJXWFUsIHN0YXRidWYuc3RfZGV2KTsKPj4gwqDC
oCBibG9ja19kZXZmZCA9IFNBRkVfT1BFTigiYmxrZGV2IiwgT19SRFdSKTsKPj4gV2hhdCBkbyB5
b3UgdGhpbms/Cj4+Ckl0IHdvcmtzIHdlbGwgb24gZXh0NCBvciB4ZnMgZmlsZXN5c3RlbSh1c2Vy
IG1heSBtb3VudCB3YW50ZWQgZmlsZXN5c3RlbSAKb24gdG1wZGlyKS4gQnV0IGlmIHdlIHVzZSBi
dHJmcywgdGhpcwpCTEtTU1pHRVQgd2lsbCBmYWlsIGJlY2F1c2UgbWFqb3IgZGV2IG51bWVyIGlz
IDAuIFdoZW4gd2UgbWVldCB0aGlzIApzaXR1YXRpb24sIHdlIGRvbid0IG5lZWQgdG8gY2FsbCB0
aGlzIGlvY3RsIGFuZCB3ZSBjYW4gZGlyZWN0bHkgdGVzdCAKYmVjdWFzZSBpdCBkb2VzbicgdCBo
YXZlIGJhY2tpbmcgZmlsZSBibG9jayBkZXZpY2UgYWxpZ24gbGltaXQuCldoYXQgZG8geW91IHRo
aW4gYWJvdXQgaXQ/CgoKCj4gT2gsIHllcywgaXQgaXMgbW9yZSBlYXNpZXIgKEkgaGF2ZSB0cmll
ZCB0aGlzKS4gSSB3aWxsIHNlbmQgYSB2MyBmb3IgdGhpcy4KPiAKPiBwczogSSB0aGluayBJIGNh
biB1c2UgdGhpcyBpbiBteSBvdGhlciBsb29wIHBhdGNoZXMgZm9yIGxvb3BfY29uZmlndXJlIAo+
IGlvY3RsLgo+Pgo+Pgo+IAo+IAo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
