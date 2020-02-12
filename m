Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6815A55D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 10:53:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02C513C260D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 10:53:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3BC8F3C2350
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 10:53:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BE71D14001F5
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 10:53:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83205472"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 17:53:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8F79649DF129
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 17:44:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 17:53:46 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <5E438D72.4020203@cn.fujitsu.com>
 <1581492715-15110-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5E43C87B.60800@cn.fujitsu.com> <5E43C9A1.8090807@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <873c8a67-a8ff-a0cf-3750-232044a447a1@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 17:53:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5E43C9A1.8090807@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8F79649DF129.ADB4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] aio02: Drop O_DIRECT flag for tmpfs
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

Cm9uIDIwMjAvMDIvMTIgMTc6NDcsIFhpYW8gWWFuZyB3cm90ZToKPiBPbiAyMDIwLzIvMTIgMTc6
NDIsIFhpYW8gWWFuZyB3cm90ZToKPj4gT24gMjAyMC8yLzEyIDE1OjMxLCBZYW5nIFh1IHdyb3Rl
Ogo+Pj4gdG1wZnMgZG9lc24ndCBzdXBwb3J0IE9fRElSRUNUIGZsYWcsIGRyb3AgaXQuIHVzZXJl
ciBzdGlsbCBjYW4gcnVuIGFpbzAyCj4+PiB3aXRoIGRpZmZlcmVudCBmaWxlc3lzdGVtIGJ5IG1v
dW50aW5nIHNwZWNpZmllZCBmaWxlc3lzdGVtIG9uICRUTVBESVIuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFuZyBYdTx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+Pj4gLS0tCj4+PiDC
oCB0ZXN0Y2FzZXMva2VybmVsL2lvL2Fpby9haW8wMi5jIHwgMTUgKysrKysrKysrKysrKystCj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2lvL2Fpby9haW8wMi5jIAo+Pj4gYi90
ZXN0Y2FzZXMva2VybmVsL2lvL2Fpby9haW8wMi5jCj4+PiBpbmRleCBlMjgzYWZiYTkuLjNiYjg5
YzQ1ZiAxMDA2NDQKPj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vYWlvL2FpbzAyLmMKPj4+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8vYWlvL2FpbzAyLmMKPj4+IEBAIC0xOCw3ICsxOCw4
IEBACj4+PiDCoCAjZGVmaW5lIEFJT19NQVhJTyAzMgo+Pj4gwqAgI2RlZmluZSBBSU9fQkxLU0la
RSAoNjQqMTAyNCkKPj4+Cj4+PiAtc3RhdGljIGludCB3YWl0X2NvdW50ID0gMDsKPj4+ICtzdGF0
aWMgaW50IHdhaXRfY291bnQ7Cj4+IEhpLAo+Pgo+PiBXaHkgZG8geW91IHNldCB3YWl0X2NvdW50
IHRvIDA/Cj4+IElzbid0IGl0IGRlZmF1bHQgYmVoYXZpb3I/Cj4gUGxlYXNlIGlnbm9yZSB0aGUg
Y29tbWVudC7CoCBTb3JyeSwgSSBtaXN1bmRlcnN0YW5kIHRoZSBjaGFuZ2UuCj4+PiArc3RhdGlj
IHVuc2lnbmVkIGludCB1c2VfdG1wZnM7Cj4+Pgo+Pj4gwqAgI2RlZmluZSBERVNDX0ZMQUdTX09Q
Uih4LCB5KSAuZGVzYyA9ICh4ID09IElPX0NNRF9QV1JJVEUgPyAiV1JJVEU6IAo+Pj4gIiAjeTog
IlJFQUQgOiAiICN5KSwgXAo+Pj4gwqDCoMKgwqDCoCAuZmxhZ3MgPSB5LCAub3BlcmF0aW9uID0g
eAo+Pj4gQEAgLTIwNiw2ICsyMDcsMTEgQEAgc3RhdGljIHZvaWQgdGVzdF9pbyh1bnNpZ25lZCBp
bnQgbikKPj4+IMKgwqDCoMKgwqAgaW50IHN0YXR1czsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IHRl
c3RjYXNlICp0YyA9IHRlc3RjYXNlcyArIG47Cj4+Pgo+Pj4gK8KgwqDCoCBpZiAodXNlX3RtcGZz
JibCoCAodGMtPmZsYWdzJsKgIE9fRElSRUNUKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIHRzdF9y
ZXMoVElORk8sICJEcm9wIE9fRElSRUNUIGZsYWcgZm9yIHRtcGZzIik7Cj4+PiArwqDCoMKgwqDC
oMKgwqAgdGMtPmZsYWdzJj0gKH5PX0RJUkVDVCk7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+IMKg
wqDCoMKgwqAgc3RhdHVzID0gaW9fdGlvKCJmaWxlIiwgdGMtPmZsYWdzLCB0Yy0+b3BlcmF0aW9u
KTsKPj4+IMKgwqDCoMKgwqAgaWYgKHN0YXR1cykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0c3Rf
cmVzKFRGQUlMLCAiJXMsIHN0YXR1cyA9ICVkIiwgdGMtPmRlc2MsIHN0YXR1cyk7Cj4+PiBAQCAt
MjEzLDcgKzIxOSwxNCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2lvKHVuc2lnbmVkIGludCBuKQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MsICIlcyIsIHRjLT5kZXNjKTsKPj4+IMKg
IH0KPj4+Cj4+PiArc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPj4+ICt7Cj4+PiArwqDCoMKgIGlm
ICh0c3RfZnNfdHlwZSgiLiIpID09IFRTVF9UTVBGU19NQUdJQykKPj4+ICvCoMKgwqDCoMKgwqDC
oCB1c2VfdG1wZnMgPSAxOwo+PiBDb3VsZCB5b3Ugc2ltcGxlIHRoZSBmaXggYnkgbW92aW5nICd0
c3RfZnNfdHlwZSgiLiIpID09IFRTVF9UTVBGU19NQUdJQwo+PiAnIGludG8gdGVzdF9pbygpLgo+
PiAoaS5lLiBEcm9wIHVudXNlZCBzZXR1cCgpIGFuZCB1c2VfdG1wZnMuKQpIaSBYaWFvCgpPZiBj
b3Vyc2UsIEkgcHV0IHRoaXMgaW4gc2V0dXAgYmVjdWFzZSBpdCBvbmx5IHJ1biBhIHRpbWUuIEJ1
dCAKdHN0X2ZzX3R5cGUgZnVuY3Rpb24gaXMgc2ltcGxlIGFuZCBtb3ZlIGl0IGludG8gdGVzdF9p
byBpcyBhbHNvIG9rLgpJIHdpbGwgYWNjZXB0IHlvdXIgYWR2aXNlLgoKQmVzdCBSZWdhcmRzCllh
bmcgWHUKPj4KPj4gVGhhbmtzLAo+PiBYaWFvIFlhbmcKPj4+ICt9Cj4+PiArCj4+PiDCoCBzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4+PiArwqDCoMKgIC5zZXR1cCA9IHNldHVwLAo+
Pj4gwqDCoMKgwqDCoCAubmVlZHNfdG1wZGlyID0gMSwKPj4+IMKgwqDCoMKgwqAgLnRlc3QgPSB0
ZXN0X2lvLAo+Pj4gwqDCoMKgwqDCoCAudGNudCA9IEFSUkFZX1NJWkUodGVzdGNhc2VzKSwKPj4K
Pj4KPj4KPiAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
