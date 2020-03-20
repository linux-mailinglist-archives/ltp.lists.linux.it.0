Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1518C676
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:27:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4FF23C548E
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:27:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 992A33C0428
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:27:29 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6D62210014D7
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:27:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,283,1580745600"; d="scan'208";a="86647864"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 12:27:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0047E406AB15
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 12:17:17 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 12:27:23 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1584523008-27044-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5E71F152.5010909@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <604acf72-5cda-0eee-b4ab-ef083a6b4d2b@cn.fujitsu.com>
Date: Fri, 20 Mar 2020 12:27:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5E71F152.5010909@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0047E406AB15.A7DA2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] openposix/twoptimers.c: Use other signal instead
 of SIGALRM
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

SGkgWGlhbwoKPiBPbiAyMDIwLzMvMTggMTc6MTYsIFlhbmcgWHUgd3JvdGU6Cj4+IEN1cnJlbnRs
eSwgcnVuIHRoaXMgY2FzZSBmYWlsZWQgYXMgYmVsb3c6Cj4+Cj4+IEdvdCBpdCHCoCBDaGlsZAo+
PiBBbGFybSBjbG9jawo+Pgo+PiBQYXJlbnQgcHJvY2VzcyBkb2Vzbid0IGdldCBTSUdBTFJNIHNp
Z2FubCBieSB1c2luZyBzaWd3YWl0LiBJdAo+PiBzZWVtcyBTSUdBTFJNIHNpZ2FubCBpcyBoYW5k
bGVkIGJ5IHN5c3RlbSBidXQgbm90IHVzZXIuCj4+Cj4+PiBGcm9tIHRpbWVyX2NyZWF0ZSBtYW4t
cGFnZSwgaXQgc2FpZCAiCj4+IFNwZWNpZnlpbmfCoCBzZXZwIGFzIE5VTEwgaXMgZXF1aXZhbGVu
dCB0byBzcGVjaWZ5aW5nIGEgcG9pbnRlciB0bwo+PiBhIHNpZ2V2ZW50IHN0cnVjdHVyZSBpbiB3
aGljaCBzaWdldl9ub3RpZnkgaXMgU0lHRVZfU0lHTkFMLCBzaWdldl9zaWdubwo+PiBpcyBTSUdB
TFJNLCBhbmQgc2lnZXZfdmFsdWUuc2l2YWxfaW50IGlzIHRoZSB0aW1lciBJRCIuCj4+Cj4+IEkg
dGhpbmsgdGhpcyBpcyB0aGUgcmVhc29uLiBTbyB1c2UgU0lHSUxMIHNpZ25hbCB0byBhdm9pZCBz
eXN0ZW0gY2F1Z2h0Lgo+IEhpIFh1LAo+IAo+IEkgZG9uJ3QgbGlrZSB0aGUgZml4LsKgIFlvdSBk
b24ndCBmaWd1cmUgb3V0IHRoZSByb290IGNhdXNlIG9mIGlzc3VlIGFuZCAKPiBqdXN0IGJ5cGFz
cyBpdC4oVXNlciBjYW4gY2F0Y2ggU0lHQUxSTSBieSBkZWZhdWx0IHVzdWFsbHkpLgpTb3JyeSBm
b3IgdGhpcy4KWWVzLiBCdXQgdXNlciB1c3VhbGx5IHdpbGwgaW5zdGFsbCBjdXN0b21pemVkIHNp
bmdhbCBoYW5kbGVyIGZvciBTSUdBTFJNIApieSB1c2luZyBzaWdhY3Rpb24gZnVuY3Rpb24uIE9u
IG11bHRpIHRocmVhZHMgcHJvZ3JhbSwgdXNlciB3aWxsIHNldCAKU0lHQUxSTSBzaWduYWwgaW50
byBzaWduYWwgbWFzayBieSB1c2luZyBzaWdwcm9jbWFzaywgc28gaXQgY2FuIGVuc3VyZSAKY3Vy
cmVudCB0aHJlYWQgY2FuIGdldCB0aGlzIHNpZ25hbCBmcm9tIHBlbmRpbmcgbGlzdC4KClNvIEkg
cGxhbiB0byBmaXggdGhpcyBidWcgYXMgYmVsb3c6CgotLS0gYS90ZXN0Y2FzZXMvb3Blbl9wb3Np
eF90ZXN0c3VpdGUvZnVuY3Rpb25hbC90aW1lcnMvdGltZXJzL3R3b3B0aW1lcnMuYworKysgYi90
ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvZnVuY3Rpb25hbC90aW1lcnMvdGltZXJzL3R3
b3B0aW1lcnMuYwpAQCAtNTAsNyArNTAsMTAgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKICAgICAgICAgICAgICAgICAgICAgICAgIHBlcnJvcigic2lnYWRkc2V0KCkgZmFpbGVk
XG4iKTsKICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFNfVU5SRVNPTFZFRDsKICAg
ICAgICAgICAgICAgICB9Ci0KKyAgICAgICAgICAgICAgIGlmIChzaWdwcm9jbWFzayhTSUdfQkxP
Q0ssICZzZXQsIE5VTEwpID09IC0xKSB7CisgICAgICAgICAgICAgICAgICAgICAgIHBlcnJvcigi
c2lncHJvY21hc2soKSBmYWlsZWRcbiIpOworICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
UFRTX1VOUkVTT0xWRUQ7CisgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgZXYuc2ln
ZXZfbm90aWZ5ID0gU0lHRVZfU0lHTkFMOwogICAgICAgICAgICAgICAgIGV2LnNpZ2V2X3NpZ25v
ID0gU0lHQUJSVDsKICAgICAgICAgICAgICAgICBpZiAodGltZXJfY3JlYXRlKENMT0NLX1JFQUxU
SU1FLCAmZXYsICZ0aWQpICE9IDApIHsKQEAgLTczLDggKzc2LDEwIEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCiAgICAgICAgICAgICAgICAgICAgICAgICBwZXJyb3IoInNpZ3dh
aXQoKSBmYWlsZWRcbiIpOwogICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUU19VTlJF
U09MVkVEOwogICAgICAgICAgICAgICAgIH0KLSAgICAgICAgICAgICAgIHByaW50ZigiR290IGl0
ISAgQ2hpbGRcbiIpOwotCisgICAgICAgICAgICAgICBpZiAoc2lnID09IFNJR0FCUlQpCisgICAg
ICAgICAgICAgICAgICAgICAgIHByaW50ZigiR290IGl0ISAgQ2hpbGRcbiIpOworICAgICAgICAg
ICAgICAgZWxzZQorICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIkdvdCBhbm90aGVyIHNp
Z25hbCEgQ2hpbGRcbiIpOwogICAgICAgICAgICAgICAgIHNsZWVwKExPTkdUSU1FKTsKICAgICAg
ICAgICAgICAgICByZXR1cm4gQ0hJTERQQVNTOwogICAgICAgICB9IGVsc2UgewpAQCAtOTYsNiAr
MTAxLDEwIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgICAgICAgICAg
ICAgICAgICAgICBwZXJyb3IoInNpZ2FkZHNldCgpIGZhaWxlZFxuIik7CiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gUFRTX1VOUkVTT0xWRUQ7CiAgICAgICAgICAgICAgICAgfQorICAg
ICAgICAgICAgICAgaWYgKHNpZ3Byb2NtYXNrKFNJR19CTE9DSywgJnNldCwgTlVMTCkgPT0gLTEp
IHsKKyAgICAgICAgICAgICAgICAgICAgICAgcGVycm9yKCJzaWdwcm9jbWFzaygpIGZhaWxlZFxu
Iik7CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFNfVU5SRVNPTFZFRDsKKyAgICAg
ICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgIGV2LnNpZ2V2X25vdGlmeSA9IFNJR0VWX1NJ
R05BTDsKICAgICAgICAgICAgICAgICBldi5zaWdldl9zaWdubyA9IFNJR0FMUk07CkBAIC0xMTks
OCArMTI4LDEwIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgICAgICAg
ICAgICAgICAgICAgICBwZXJyb3IoInNpZ3dhaXQoKSBmYWlsZWRcbiIpOwogICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIFBUU19VTlJFU09MVkVEOwogICAgICAgICAgICAgICAgIH0KLSAg
ICAgICAgICAgICAgIHByaW50ZigiR290IGl0ISAgUGFyZW50XG4iKTsKLQorICAgICAgICAgICAg
ICAgaWYgKHNpZyA9PSBTSUdBTFJNKQorICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIkdv
dCBpdCEgIFBhcmVudFxuIik7CisgICAgICAgICAgICAgICBlbHNlCisgICAgICAgICAgICAgICAg
ICAgICAgIHByaW50ZigiR290IGFub3RoZXIgc2lnbmFsISBQYXJlbnRcbiIpOwoKSG93IGFib3V0
IHRoaXM/CgpCZXN0IFJlZ2FyZHMKWWFuZyBYdQo+IAo+IFBlcmhhcHMsIHlvdSBuZWVkIHRvIHJl
c2V0IHRoZSBiZWhhdmlvciBvZiBTSUdBTFJNIHRvIGRlZmF1bHQgaWYgaXQgaXMgCj4gbm90IGRl
ZmF1bHQuLgo+IAo+IFRoYW5rcywKPiBYaWFvIFlhbmcKPj4gU2lnbmVkLW9mZi1ieTogWWFuZyBY
dTx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+PiAtLS0KPj4gwqAgLi4uL2Z1bmN0aW9u
YWwvdGltZXJzL3RpbWVycy90d29wdGltZXJzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgNCArKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgCj4+IGEvdGVzdGNhc2VzL29wZW5f
cG9zaXhfdGVzdHN1aXRlL2Z1bmN0aW9uYWwvdGltZXJzL3RpbWVycy90d29wdGltZXJzLmMgCj4+
IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2Z1bmN0aW9uYWwvdGltZXJzL3RpbWVy
cy90d29wdGltZXJzLmMKPj4gaW5kZXggODRiZWEzZjBhLi43ZTE2NDhkNWIgMTAwNjQ0Cj4+IC0t
LSAKPj4gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvZnVuY3Rpb25hbC90aW1lcnMv
dGltZXJzL3R3b3B0aW1lcnMuYwo+PiArKysgCj4+IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVz
dHN1aXRlL2Z1bmN0aW9uYWwvdGltZXJzL3RpbWVycy90d29wdGltZXJzLmMKPj4gQEAgLTkyLDEz
ICs5MiwxMyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRTX1VOUkVTT0xWRUQ7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoc2lnYWRkc2V0KCZzZXQsIFNJR0FMUk0p
ID09IC0xKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoc2lnYWRkc2V0KCZzZXQsIFNJR0lMTCkg
PT0gLTEpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGVycm9yKCJzaWdhZGRzZXQo
KSBmYWlsZWRcbiIpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRTX1VO
UkVTT0xWRUQ7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBldi5zaWdldl9ub3RpZnkgPSBTSUdFVl9TSUdOQUw7Cj4+IC3CoMKgwqDCoMKgwqDCoCBldi5z
aWdldl9zaWdubyA9IFNJR0FMUk07Cj4+ICvCoMKgwqDCoMKgwqDCoCBldi5zaWdldl9zaWdubyA9
IFNJR0lMTDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0aW1lcl9jcmVhdGUoQ0xPQ0tfUkVB
TFRJTUUsJmV2LCZ0aWQpICE9IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGVy
cm9yKCJ0aW1lcl9jcmVhdGUoKSBkaWQgbm90IHJldHVybiBzdWNjZXNzXG4iKTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUU19VTlJFU09MVkVEOwo+IAoKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
