Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400B1CEB4B
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 05:22:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E94B13C5610
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 05:22:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 167323C5605
 for <ltp@lists.linux.it>; Tue, 12 May 2020 05:22:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 736701A0068C
 for <ltp@lists.linux.it>; Tue, 12 May 2020 05:22:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,381,1583164800"; d="scan'208";a="91933741"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 May 2020 11:22:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id AB9174BCC89D
 for <ltp@lists.linux.it>; Tue, 12 May 2020 11:22:27 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 11:22:26 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1588918535-4682-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5EB51F9D.6080404@cn.fujitsu.com>
 <207ce727-a0a4-2c2a-19f7-87aef956ffb5@cn.fujitsu.com>
 <5EB904E5.8020109@cn.fujitsu.com>
 <74d96248-f1fd-1040-8ac9-a5fbe7600247@cn.fujitsu.com>
 <5EBA0D63.50500@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <4e32e0f9-ebcf-3dc9-1cef-9222125c35a9@cn.fujitsu.com>
Date: Tue, 12 May 2020 11:22:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5EBA0D63.50500@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AB9174BCC89D.AFE6D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Ensure do zero offset in
 kernel always
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

SGkgWGlhbwoKCj4gT24gMjAyMC81LzEyIDk6NDEsIFlhbmcgWHUgd3JvdGU6Cj4+IEhpIFhpYW8K
Pj4KPj4KPj4+IE9uIDIwMjAvNS84IDE3OjIzLCBZYW5nIFh1IHdyb3RlOgo+Pj4+IEhpIFhpYW8K
Pj4+Pgo+Pj4+Cj4+Pj4+IE9uIDIwMjAvNS84IDE0OjE1LCBZYW5nIFh1IHdyb3RlOgo+Pj4+Pj4g
Q3VycmVudGx5LCB3ZSB1c2UgcmV0dXJuIGluc3RlYWQgb2YgemVyb19vZmZzZXQuIEkgZGVidWcg
dGhpcyBjb2RlCj4+Pj4+PiAoZWFybHkgcmV0dXJuLCBleHQ0IGZpbGVzeXN0ZW0pYXMgYmVsb3c6
Cj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+IFRF
U1QoaW9jdGwoZGV2X2ZkLCBMT09QX1NFVF9ESVJFQ1RfSU8sIDEpKTsKPj4+Pj4+IGlmIChUU1Rf
UkVUID09IDApIHsKPj4+Pj4+IMKgwqDCoCB0c3RfcmVzKFRQQVNTLCAiTE9PUF9TRVRfRElSRUNU
X0lPIHN1Y2NlZWRlZCB1bmV4cGVjdGVkbHkiKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgU0FG
RV9JT0NUTChkZXZfZmQsIExPT1BfU0VUX0RJUkVDVF9JTywgMCk7Cj4+Pj4+PiB9Cj4+Pj4+PiBy
ZXR1cm47Cj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+
Pj4+IHRoaXMgY2FzZSB3aWxsIGJyb2tlIHdoZW4gdXNpbmcgaSBwYXJhbWV0ZXIsCj4+Pj4+PiBp
b2N0bF9sb29wMDUuYzo2MjogQlJPSzogaW9jdGwoMyxMT09QX1NFVF9ESVJFQ1RfSU8sLi4uKSBm
YWlsZWQ6Cj4+Pj4+PiBFSU5WQUwgKDIyKQo+Pj4gSGkgWHUsCj4+Pgo+Pj4gU29ycnkgZm9yIHRo
ZSBsYXRlIHJlcGx5Lgo+Pj4KPj4+IFdpdGhvdXQgbW9kaWZ5aW5nIGNvZGUsIHdlIGNhbiBhbHNv
IGZhbGwgaW50byB0aGlzIGJyYW5jaCBieSBydW5uaW5nCj4+PiBpb2N0bF9sb29wMDUgdW5kZXIg
YnRyZnMsIHNvIGNvdWxkIHdlIHNpbXBsZSB0aGUgZGVzY3JpcHRpb24gb2YgaXNzdWU/Cj4gSGkg
WHUsCj4gCj4gU29ycnkgZm9yIHRoZSB3cm9uZyBjb21tZW50Lgo+IFRoZSBkZWJ1ZyBjb2RlIGlz
IG5lZWRlZCwgcnVubmluZyBpb2N0bF9sb29wMDUgdW5kZXIgYnRyZnMgY2FuIGZhbGwgaW50byAK
PiB0aGlzIGJyYW5jaCBidXQgZG9lc24ndCBicmVhayBiZWNhdXNlIGJ0cmZzIGlnbm9yZXMgdGhl
IG9mZnNldC4KPiAKPj4gIm1ha2Ugc3VyZSB6ZXJvIG9mZnNldCBpbiBrZXJuZWwgYXQgdGhlIGJl
Z2dpbm5pbmcgb2YgdGhlIHRlc3QgdG8gYXZvaWQKPj4gdW5rbm93biBlcnJvciB3aGVuIHVzaW5n
IC1pIHBhcmFtZXRlciIuIEhvdyBhYm91dCB0aGlzPwo+IElzICJpbiBrZXJuZWwiIG5lY2Vzc2Fy
eT/CoCBPdGhlciB0aGFuIHRoYXQgdGhlIGRlc2NyaXB0aW9uIGxvb2tzIGdvb2QuCkkgdGhpbmsg
aXQgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgaXQgd2FudHMgdG8gc2V0IHplcm8gc3RhdHVzIGluIGtl
cm5lbCAKbG9vcCBpbmZvIHN0cnVjdCBidXQgbm90IHVzZXJzcGFjZSBsb29waW5mbyBzdHJ1Y3Qo
SW4gdXNlcnNwYWNlLCB3ZSBoYXZlIAp6ZXJvIGxvb3BpbmZvIHN0cnVjdCkuIHNvICJpbiBrZXJu
ZWwiIGlzIG1vcmUgY2xlYXIuCiJtYWtlIHN1cmUgc2V0IHplcm8gb2Zmc2V0IGluIGtlcm5lbCBs
b29waW5mbyBzdHJ1Y3QgYXQgdGhlIGJlZ2lubmluZyBvZiAKdGhlIHRlc3QgdG8gYXZvaWQgdW5r
bm93biBlcnJvciB3aGVuIHVzaW5nIC1pIHBhcmFtZXRlciAiCgpCZXN0IFJlZ2FyZHMKWWFuZyBY
dQo+IAo+IFRoYW5rcywKPiBYaWFvIFlhbmcKPj4+Cj4+Pj4+Pgo+Pj4+Pj4gSXQgc2VlbXMgdGhl
IGxhc3QgdGVzdCBhZmZlY3RlZCB0aGlzIHRlc3QsIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIHVzZQo+
Pj4+Pj4gZ290byBpbnN0ZWFkIG9mIHJldHVybi4gQWxzbyBpbmNsdWRpbmcgYSB0eXBvLCB1cGRh
dGEtPnVwZGF0ZS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1PHh1eWFuZzIw
MTguanlAY24uZnVqaXRzdS5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMgfCA1ICsrKy0tCj4+Pj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+
IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX2xvb3Aw
NS5jCj4+Pj4+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1
LmMKPj4+Pj4+IGluZGV4IDZjZjcwMWY0Ny4uYTEwM2FhYTk0IDEwMDY0NAo+Pj4+Pj4gLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+Pj4+Pj4gKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+Pj4+Pj4g
QEAgLTUsNyArNSw3IEBACj4+Pj4+PiDCoMKgICoKPj4+Pj4+IMKgwqAgKiBUaGlzIGlzIGEgYmFz
aWMgaW9jdGwgdGVzdCBhYm91dCBsb29wZGV2aWNlLgo+Pj4+Pj4gwqDCoCAqCj4+Pj4+PiAtICog
SXQgaXMgZGVzaWduZWQgdG8gdGVzdCBMT09QX1NFVF9ESVJFQ1RfSU8gY2FuIHVwZGF0YSBhIGxp
dmUKPj4+Pj4+ICsgKiBJdCBpcyBkZXNpZ25lZCB0byB0ZXN0IExPT1BfU0VUX0RJUkVDVF9JTyBj
YW4gdXBkYXRlIGEgbGl2ZQo+Pj4+PiBIaSBYdSwKPj4+Pj4KPj4+Pj4gV2hhdCBkb2VzIHRoZSBs
aW5lIGNoYW5nZXM/Cj4+Pj4ganVzdCBhIHR5cG8sIHVwZGF0YS0+dXBkYXRlCj4+Pgo+Pj4gU29y
cnkgZm9yIG1pc3NpbmcgdGhlIHR5cG8uCj4+Pgo+Pj4+Pgo+Pj4+Pj4gwqDCoCAqIGxvb3AgZGV2
aWNlIGRpbyBtb2RlLiBJdCBuZWVkcyB0aGUgYmFja2luZyBmaWxlIGFsc28gc3VwcG9ydHMKPj4+
Pj4+IMKgwqAgKiBkaW8gbW9kZSBhbmQgdGhlIGxvX29mZnNldCBpcyBhbGlnbmVkIHdpdGggdGhl
IGxvZ2ljYWwgYmxvY2sKPj4+Pj4+IHNpemUuCj4+Pj4+PiDCoMKgICoKPj4+Pj4+IEBAIC04NSwx
MyArODUsMTQgQEAgc3RhdGljIHZvaWQgdmVyaWZ5X2lvY3RsX2xvb3Aodm9pZCkKPj4+Pj4+IMKg
wqDCoMKgwqAgaWYgKFRTVF9SRVQgPT0gMCkgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRz
dF9yZXMoVFBBU1MsICJMT09QX1NFVF9ESVJFQ1RfSU8gc3VjY2VlZGVkIik7Cj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgU0FGRV9JT0NUTChkZXZfZmQsIExPT1BfU0VUX0RJUkVDVF9JTywgMCk7
Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdv
dG8gemVyb19vZmZzZXQ7Cj4+Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4+IMKgwqDCoMKgwqAgaWYg
KFRTVF9FUlIgPT0gRUlOVkFMKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBB
U1MgfCBUVEVSUk5PLCAiTE9PUF9TRVRfRElSRUNUX0lPIGZhaWxlZCBhcwo+Pj4+Pj4gZXhwZWN0
ZWQiKTsKPj4+Pj4+IMKgwqDCoMKgwqAgZWxzZQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRz
dF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAiTE9PUF9TRVRfRElSRUNUX0lPIGZhaWxlZAo+Pj4+Pj4g
ZXhwZWN0ZWQgRUlOVkFMIGdvdCIpOwo+Pj4+Pj4KPj4+Pj4+ICt6ZXJvX29mZnNldDoKPj4+Pj4+
IMKgwqDCoMKgwqAgbG9vcGluZm8ubG9fb2Zmc2V0ID0gMDsKPj4+Pj4+IMKgwqDCoMKgwqAgVFNU
X1JFVFJZX0ZVTkMoaW9jdGwoZGV2X2ZkLCBMT09QX1NFVF9TVEFUVVMsJmxvb3BpbmZvKSwKPj4+
Pj4+IFRTVF9SRVRWQUxfRVEwKTsKPj4+Pj4KPj4+Pj4gWW91IGhhdmUgY2xlYXJlZCB0aGUgc3Ry
dWN0IGxvb3BpbmZvIGF0IHRoZSBiZWdpbm5pbmcgb2YKPj4+Pj4gdmVyaWZ5X2lvY3RsX2xvb3Ao
KSwgc28gY291bGQgd2UganVzdCBkcm9wIGxvb3BpbmZvLmxvX29mZnNldCA9IDAgYW5kCj4+Pj4+
IG1vdmUgJ1RTVF9SRVRSWV9GVU5DKGlvY3RsKGRldl9mZCwgTE9PUF9TRVRfU1RBVFVTLCZsb29w
aW5mbyksCj4+Pj4+IFRTVF9SRVRWQUxfRVEwKTsnIHRvIHRoZSBiZWdpbm5pbmc/Cj4+Pj4gWWVz
LiBJTU8sIGF0IHRoZSBiZWdpbm5pbmcgb3IgZW5kLCB0aGV5IGFsbCB3b3JrIHdlbGwuCj4+Pgo+
Pj4gQWdyZWVkLCBidXQgaXQgc2VlbXMgc2ltcGxlciB0byBjbGVhciByZXNvdWNlIGF0IHRoZSBi
ZWdpbm5pbmcgb2YKPj4+IHZlcmlmeV9pb2N0bF9sb29wKCksIGxpa2UgdGhpczoKPj4+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+Pj4gYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX2xvb3AwNS5jCj4+PiBpbmRleCA2Y2Y3MDFmNDcuLjZj
OWVhMjgwMiAxMDA2NDQKPj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwv
aW9jdGxfbG9vcDA1LmMKPj4+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwv
aW9jdGxfbG9vcDA1LmMKPj4+IC4uLgo+Pj4gQEAgLTU3LDYgKzU3LDcgQEAgc3RhdGljIHZvaWQg
dmVyaWZ5X2lvY3RsX2xvb3Aodm9pZCkKPj4+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsb29wX2lu
Zm8gbG9vcGluZm87Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqAgbWVtc2V0KCZsb29waW5mbywgMCwg
c2l6ZW9mKGxvb3BpbmZvKSk7Cj4+PiArwqDCoMKgwqDCoMKgIFRTVF9SRVRSWV9GVU5DKGlvY3Rs
KGRldl9mZCwgTE9PUF9TRVRfU1RBVFVTLCAmbG9vcGluZm8pLAo+Pj4gVFNUX1JFVFZBTF9FUTAp
Owo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVElORk8sICJXaXRob3V0IHNldHRpbmcg
bG9fb2Zmc2V0IG9yIHNpemVsaW1pdCIpOwo+Pj4gwqDCoMKgwqDCoMKgwqAgU0FGRV9JT0NUTChk
ZXZfZmQsIExPT1BfU0VUX0RJUkVDVF9JTywgMSk7Cj4+PiBAQCAtOTEsOSArOTIsNiBAQCBzdGF0
aWMgdm9pZCB2ZXJpZnlfaW9jdGxfbG9vcCh2b2lkKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLCAiTE9PUF9TRVRfRElSRUNUX0lPIGZh
aWxlZCBhcwo+Pj4gZXhwZWN0ZWQiKTsKPj4+IMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgIkxPT1Bf
U0VUX0RJUkVDVF9JTyBmYWlsZWQKPj4+IGV4cGVjdGVkIEVJTlZBTCBnb3QiKTsKPj4+IC0KPj4+
IC3CoMKgwqDCoMKgwqAgbG9vcGluZm8ubG9fb2Zmc2V0ID0gMDsKPj4+IC3CoMKgwqDCoMKgwqAg
VFNUX1JFVFJZX0ZVTkMoaW9jdGwoZGV2X2ZkLCBMT09QX1NFVF9TVEFUVVMsICZsb29waW5mbyks
Cj4+PiBUU1RfUkVUVkFMX0VRMCk7Cj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+PiBZZXMuCj4+Pgo+Pj4gQmVzdCBSZWdhcmRzLAo+Pj4gWGlhbyBZYW5nCj4+Pj4+Cj4+
Pj4+IFRoYW5rcywKPj4+Pj4gWGlhbyBZYW5nCj4+Pj4+PiDCoCB9Cj4+Pj4+Cj4+Pj4gLgo+Pj4+
Cj4+Pgo+PiAuCj4+Cj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
