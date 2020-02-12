Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624015A0DD
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:53:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 260693C25DE
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:53:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7226A3C25D5
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:53:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 20115140013B
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:53:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83189314"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 13:53:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5D9BC50A9978
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 13:43:44 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 13:53:15 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1581484093-13127-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5E438D72.4020203@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <45385664-ba72-dec2-7a86-47d2a3602e04@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 13:53:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5E438D72.4020203@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5D9BC50A9978.AD22D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] aio02: Use mounted filesystem instead of temp
 directory
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

b24gMjAyMC8wMi8xMiAxMzozMCwgWGlhbyBZYW5nIHdyb3RlOgo+IE9uIDIwMjAvMi8xMiAxMzow
OCwgWWFuZyBYdSB3cm90ZToKPj4gdG1wZnMgZG9lc24ndCBzdXBwb3J0IE9fRElSRUNUIGZsYWcs
IG9wZW4gZmlsZSB3aXRoIHRoaXMgZmxhZyBvbgo+PiB0bXBmcyB3aWxsIHJlcG9ydCBFSU5WQUwg
ZXJyb3IuIEkgdGhpbiB3ZSBzaG91bGQgdGVzdCB0aGlzIGNhc2Ugb24KPj4gZXh0MiBmaWxlc3lz
dGVtIGluc3RlYWQgb2YgdGVtcCBkaXJlY3RvcnkuCj4gSGkgWHUsCj4gCj4gVGhhbmtzIGZvciB5
b3VyIHF1aWNrIGZpeC4gOi0pCj4gCj4gSSBkb24ndCB3YW50IHRvIHVzZSB0aGUgZml4ZWQgZmls
ZSBzeXN0ZW0gdG8gcnVuIGFpbzAyLgo+IEkgcGVyZmVyIHRvIGp1c3QgZHJvcCBPX0RJUkVDVCBm
bGFnIGZvciB0bXBmcywgYXMgYmVsb3c6Cj4gMSkgRHJvcCBPX0RJUkVDVCBmbGFnIGZvciB0bXBm
cy4KPiAyKSBLZWVwIE9fRElSRUNUIGZsYWcgZm9yIG90aGVyIGZpbGVzeXN0ZW0uCj4gSW4gdGhp
cyBjYXNlLCB1c2VyIHN0aWxsIGNhbiBydW4gYWlvMDIgd2l0aCBkaWZmZXJlbnQgZmlsZXN5c3Rl
bSBieSAKPiBtb3VudGluZyBzcGVjaWZpZWQgZmlsZXN5c3RlbSBvbiAkVE1QRElSLgo+IApTb3Vu
ZCByZWFzb25hYmxlIHRvIG1lLCBJIHdpbGwgZmlsdGVyIE9fRElSRUNUIGZsYWcgZm9yIHRtcGZz
Lgo+IEJlc3QgUmVnYXJkcywKPiBYaWFvIFlhbmcKPj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdTx4
dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+PiAtLS0KPj4gwqAgdGVzdGNhc2VzL2tlcm5l
bC9pby9haW8vYWlvMDIuYyB8IDkgKysrKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL2lvL2Fpby9haW8wMi5jIAo+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8vYWlvL2FpbzAy
LmMKPj4gaW5kZXggZTI4M2FmYmE5Li4yMDVkMWIwODggMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvaW8vYWlvL2FpbzAyLmMKPj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9haW8v
YWlvMDIuYwo+PiBAQCAtMTcsNyArMTcsOCBAQAo+Pgo+PiDCoCAjZGVmaW5lIEFJT19NQVhJTyAz
Mgo+PiDCoCAjZGVmaW5lIEFJT19CTEtTSVpFICg2NCoxMDI0KQo+PiAtCj4+ICsjZGVmaW5lIE1O
VFBPSU5UwqDCoCAibW50X3BvaW50Igo+PiArI2RlZmluZSBGSUxFX1RFU1QgTU5UUE9JTlQiL2Zp
bGUiCj4+IMKgIHN0YXRpYyBpbnQgd2FpdF9jb3VudCA9IDA7Cj4+Cj4+IMKgICNkZWZpbmUgREVT
Q19GTEFHU19PUFIoeCwgeSkgLmRlc2MgPSAoeCA9PSBJT19DTURfUFdSSVRFID8gIldSSVRFOiAi
IAo+PiAjeTogIlJFQUQgOiAiICN5KSwgXAo+PiBAQCAtMjA2LDcgKzIwNyw3IEBAIHN0YXRpYyB2
b2lkIHRlc3RfaW8odW5zaWduZWQgaW50IG4pCj4+IMKgwqDCoMKgwqAgaW50IHN0YXR1czsKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgdGVzdGNhc2UgKnRjID0gdGVzdGNhc2VzICsgbjsKPj4KPj4gLcKg
wqDCoCBzdGF0dXMgPSBpb190aW8oImZpbGUiLCB0Yy0+ZmxhZ3MsIHRjLT5vcGVyYXRpb24pOwo+
PiArwqDCoMKgIHN0YXR1cyA9IGlvX3RpbyhGSUxFX1RFU1QsIHRjLT5mbGFncywgdGMtPm9wZXJh
dGlvbik7Cj4+IMKgwqDCoMKgwqAgaWYgKHN0YXR1cykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRz
dF9yZXMoVEZBSUwsICIlcywgc3RhdHVzID0gJWQiLCB0Yy0+ZGVzYywgc3RhdHVzKTsKPj4gwqDC
oMKgwqDCoCBlbHNlCj4+IEBAIC0yMTQsNyArMjE1LDkgQEAgc3RhdGljIHZvaWQgdGVzdF9pbyh1
bnNpZ25lZCBpbnQgbikKPj4gwqAgfQo+Pgo+PiDCoCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRl
c3QgPSB7Cj4+IC3CoMKgwqAgLm5lZWRzX3RtcGRpciA9IDEsCj4+ICvCoMKgwqAgLm1vdW50X2Rl
dmljZSA9IDEsCj4+ICvCoMKgwqAgLm1udHBvaW50ID0gTU5UUE9JTlQsCj4+ICvCoMKgwqAgLm5l
ZWRzX3Jvb3QgPSAxLAo+PiDCoMKgwqDCoMKgIC50ZXN0ID0gdGVzdF9pbywKPj4gwqDCoMKgwqDC
oCAudGNudCA9IEFSUkFZX1NJWkUodGVzdGNhc2VzKSwKPj4gwqAgfTsKPiAKCgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
