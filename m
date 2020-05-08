Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B71CA71B
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 11:24:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 624943C56E7
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 11:24:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E05393C56D4
 for <ltp@lists.linux.it>; Fri,  8 May 2020 11:24:16 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 40BE510000C3
 for <ltp@lists.linux.it>; Fri,  8 May 2020 11:24:13 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,366,1583164800"; d="scan'208";a="91687990"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 May 2020 17:24:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DA4154BCC8A9
 for <ltp@lists.linux.it>; Fri,  8 May 2020 17:24:02 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 May 2020 17:24:02 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1588918535-4682-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5EB51F9D.6080404@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <207ce727-a0a4-2c2a-19f7-87aef956ffb5@cn.fujitsu.com>
Date: Fri, 8 May 2020 17:23:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5EB51F9D.6080404@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DA4154BCC8A9.A23D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

SGkgWGlhbwoKCj4gT24gMjAyMC81LzggMTQ6MTUsIFlhbmcgWHUgd3JvdGU6Cj4+IEN1cnJlbnRs
eSwgd2UgdXNlIHJldHVybiBpbnN0ZWFkIG9mIHplcm9fb2Zmc2V0LiBJIGRlYnVnIHRoaXMgY29k
ZQo+PiAoZWFybHkgcmV0dXJuLCBleHQ0IGZpbGVzeXN0ZW0pYXMgYmVsb3c6Cj4+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBURVNUKGlvY3RsKGRldl9mZCwgTE9P
UF9TRVRfRElSRUNUX0lPLCAxKSk7Cj4+IGlmIChUU1RfUkVUID09IDApIHsKPj4gwqDCoMKgwqB0
c3RfcmVzKFRQQVNTLCAiTE9PUF9TRVRfRElSRUNUX0lPIHN1Y2NlZWRlZCB1bmV4cGVjdGVkbHki
KTsKPj4gwqDCoMKgwqDCoMKgwqDCoCBTQUZFX0lPQ1RMKGRldl9mZCwgTE9PUF9TRVRfRElSRUNU
X0lPLCAwKTsKPj4gfQo+PiByZXR1cm47Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+PiB0aGlzIGNhc2Ugd2lsbCBicm9rZSB3aGVuIHVzaW5nIGkgcGFyYW1ldGVy
LAo+PiBpb2N0bF9sb29wMDUuYzo2MjogQlJPSzogaW9jdGwoMyxMT09QX1NFVF9ESVJFQ1RfSU8s
Li4uKSBmYWlsZWQ6IAo+PiBFSU5WQUwgKDIyKQo+Pgo+PiBJdCBzZWVtcyB0aGUgbGFzdCB0ZXN0
IGFmZmVjdGVkIHRoaXMgdGVzdCwgc28gSSB0aGluayB3ZSBzaG91bGQgdXNlCj4+IGdvdG8gaW5z
dGVhZCBvZiByZXR1cm4uIEFsc28gaW5jbHVkaW5nIGEgdHlwbywgdXBkYXRhLT51cGRhdGUuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHU8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4K
Pj4gLS0tCj4+IMKgIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1
LmMgfCA1ICsrKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lv
Y3RsL2lvY3RsX2xvb3AwNS5jIAo+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwv
aW9jdGxfbG9vcDA1LmMKPj4gaW5kZXggNmNmNzAxZjQ3Li5hMTAzYWFhOTQgMTAwNjQ0Cj4+IC0t
LSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMKPj4gKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+PiBAQCAt
NSw3ICs1LDcgQEAKPj4gwqDCoCAqCj4+IMKgwqAgKiBUaGlzIGlzIGEgYmFzaWMgaW9jdGwgdGVz
dCBhYm91dCBsb29wZGV2aWNlLgo+PiDCoMKgICoKPj4gLSAqIEl0IGlzIGRlc2lnbmVkIHRvIHRl
c3QgTE9PUF9TRVRfRElSRUNUX0lPIGNhbiB1cGRhdGEgYSBsaXZlCj4+ICsgKiBJdCBpcyBkZXNp
Z25lZCB0byB0ZXN0IExPT1BfU0VUX0RJUkVDVF9JTyBjYW4gdXBkYXRlIGEgbGl2ZQo+IEhpIFh1
LAo+IAo+IFdoYXQgZG9lcyB0aGUgbGluZSBjaGFuZ2VzPwpqdXN0IGEgdHlwbywgdXBkYXRhLT51
cGRhdGUKPiAKPj4gwqDCoCAqIGxvb3AgZGV2aWNlIGRpbyBtb2RlLiBJdCBuZWVkcyB0aGUgYmFj
a2luZyBmaWxlIGFsc28gc3VwcG9ydHMKPj4gwqDCoCAqIGRpbyBtb2RlIGFuZCB0aGUgbG9fb2Zm
c2V0IGlzIGFsaWduZWQgd2l0aCB0aGUgbG9naWNhbCBibG9jayBzaXplLgo+PiDCoMKgICoKPj4g
QEAgLTg1LDEzICs4NSwxNCBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfaW9jdGxfbG9vcCh2b2lkKQo+
PiDCoMKgwqDCoMKgIGlmIChUU1RfUkVUID09IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRz
dF9yZXMoVFBBU1MsICJMT09QX1NFVF9ESVJFQ1RfSU8gc3VjY2VlZGVkIik7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBTQUZFX0lPQ1RMKGRldl9mZCwgTE9PUF9TRVRfRElSRUNUX0lPLCAwKTsKPj4g
LcKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gemVyb19vZmZz
ZXQ7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIGlmIChUU1RfRVJSID09IEVJTlZBTCkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLCAiTE9PUF9TRVRf
RElSRUNUX0lPIGZhaWxlZCBhcyAKPj4gZXhwZWN0ZWQiKTsKPj4gwqDCoMKgwqDCoCBlbHNlCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCB0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgIkxPT1BfU0VUX0RJ
UkVDVF9JTyBmYWlsZWQgZXhwZWN0ZWQgCj4+IEVJTlZBTCBnb3QiKTsKPj4KPj4gK3plcm9fb2Zm
c2V0Ogo+PiDCoMKgwqDCoMKgIGxvb3BpbmZvLmxvX29mZnNldCA9IDA7Cj4+IMKgwqDCoMKgwqAg
VFNUX1JFVFJZX0ZVTkMoaW9jdGwoZGV2X2ZkLCBMT09QX1NFVF9TVEFUVVMsJmxvb3BpbmZvKSwg
Cj4+IFRTVF9SRVRWQUxfRVEwKTsKPiAKPiBZb3UgaGF2ZSBjbGVhcmVkIHRoZSBzdHJ1Y3QgbG9v
cGluZm8gYXQgdGhlIGJlZ2lubmluZyBvZiAKPiB2ZXJpZnlfaW9jdGxfbG9vcCgpLCBzbyBjb3Vs
ZCB3ZSBqdXN0IGRyb3AgbG9vcGluZm8ubG9fb2Zmc2V0ID0gMCBhbmQgCj4gbW92ZSAnVFNUX1JF
VFJZX0ZVTkMoaW9jdGwoZGV2X2ZkLCBMT09QX1NFVF9TVEFUVVMsJmxvb3BpbmZvKSwgCj4gVFNU
X1JFVFZBTF9FUTApOycgdG8gdGhlIGJlZ2lubmluZz8KWWVzLiBJTU8sIGF0IHRoZSBiZWdpbm5p
bmcgb3IgZW5kLCB0aGV5IGFsbCB3b3JrIHdlbGwuCj4gCj4gVGhhbmtzLAo+IFhpYW8gWWFuZwo+
PiDCoCB9Cj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
