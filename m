Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4211B0154
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 08:08:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38C1A3C2A1C
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 08:08:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DE7FB3C2A0A
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 08:08:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 556D4200CFE
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 08:08:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,405,1580745600"; d="scan'208";a="89261029"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 14:08:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D7E7449DF12B;
 Mon, 20 Apr 2020 13:57:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 14:08:14 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200417151050.GA2491@yuki.lan>
 <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
Message-ID: <48142e6b-8169-2934-e8b2-f71927cd62b0@cn.fujitsu.com>
Date: Mon, 20 Apr 2020 14:08:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D7E7449DF12B.AFF8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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

SGkgQ3lyaWwKCgo+IEhpIEN5cmlsCj4gCj4gCj4+IEhpIQo+Pj4gKy8qCj4+PiArICogQ29weXJp
Z2h0IChjKSAyMDIwIEZVSklUU1UgTElNSVRFRC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4+ICsg
KiBBdXRob3I6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+Cj4+PiArICov
Cj4+PiArI2RlZmluZSBUU1RfTk9fREVGQVVMVF9NQUlOCj4+PiArI2luY2x1ZGUgImlvY3RsX2xv
b3Bfc3VwcG9ydC5oIgo+Pj4gKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+Pj4gKwo+Pj4gK3ZvaWQg
Y2hlY2tfc3lzX3ZhbHVlKGNoYXIgKnBhdGgsIGludCBzZXR2YWx1ZSkKPj4+ICt7Cj4+PiArwqDC
oMKgIGludCBnZXR2YWx1ZTsKPj4+ICsKPj4+ICvCoMKgwqAgU0FGRV9GSUxFX1NDQU5GKHBhdGgs
ICIlZCIsICZnZXR2YWx1ZSk7Cj4+PiArwqDCoMKgIGlmIChzZXR2YWx1ZSA9PSBnZXR2YWx1ZSkK
Pj4+ICvCoMKgwqDCoMKgwqDCoCB0c3RfcmVzKFRQQVNTLCAiJXMgdmFsdWUgaXMgJWQiLCBwYXRo
LCBzZXR2YWx1ZSk7Cj4+PiArwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoCB0c3RfcmVz
KFRGQUlMLCAiJXMgdmFsdWUgZXhwZWN0ZWQgJWQgZ290ICVkIiwgcGF0aCwgCj4+PiBzZXR2YWx1
ZSwgZ2V0dmFsdWUpOwo+Pj4gK30KPj4+ICsKPj4+ICt2b2lkIGNoZWNrX3N5c19zdHJpbmcoY2hh
ciAqcGF0aCwgY2hhciAqc2V0bWVzc2FnZSkKPj4+ICt7Cj4+PiArwqDCoMKgIGNoYXIgZ2V0bWVz
c2FnZVsxMDI0XTsKPj4+ICsKPj4+ICvCoMKgwqAgU0FGRV9GSUxFX1NDQU5GKHBhdGgsICIlcyIs
IGdldG1lc3NhZ2UpOwo+Pj4gK8KgwqDCoCBpZiAoc3RyY21wKHNldG1lc3NhZ2UsIGdldG1lc3Nh
Z2UpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVEZBSUwsICIlcyBleHBlY3RlZCAlcyBn
b3QgJXMiLCBwYXRoLCBzZXRtZXNzYWdlLCAKPj4+IGdldG1lc3NhZ2UpOwo+Pj4gK8KgwqDCoCBl
bHNlCj4+PiArwqDCoMKgwqDCoMKgwqAgdHN0X3JlcyhUUEFTUywgIiVzIHN0cmluZyBpcyAlcyIs
IHBhdGgsIGdldG1lc3NhZ2UpOwo+Pj4gK30KPj4KPj4gSW4gdGhlIGVuZCBJJ3ZlIHJlbmFtZWQg
YW5kIG1vdmVkIHRoZXNlIGZ1bmN0aW9ucyBpbnRvIHRoZSB0ZXN0IGxpYnJhcnkKPj4gYmVjYXVz
ZSB0aGUgZnVuY3Rpb25hbGl0eSBpcyBnZW5lcmljIGVub3VnaCBhbmQgSSBkb3VidCB0aGF0IHRo
ZXNlCj4+IHRlc3RzIHdvdWxkIGJlIHRoZSBvbmx5IG9uZSB1c2luZyBpdC4KPiBUaGF0J3MgZ3Jl
YXQuwqAgSSByZW1lbWJlciBwcmN0bCBjYXNlcyB1c2UgdGhpcyBmdW5jdGlvbi4gQWxzbywgaW4g
c29tZSAKPiBjYXAgY2FzZXMsIGl0IG5lZWRzIGJpdHdpc2Ugb3BlcmF0b3JzKEkgb25seSBrbm93
IHByY3RsMDguYykuIE1heWJlIHdlIAo+IGNhbiBhZGQgVFNUX0FTU0VSVF9CSVRXSVNFPwpUaGlz
IHNpdHVhdGlvbiBpcyByYXJlbHkgc2Vlbi4gSSB3YW50IHRvIGFkZCB0d28gZnVuY3Rpb25zIHN1
Y2ggYXMgClRTVF9BU1NFUlRfRklMRV9TVFIvSU5UIHRvIGNvbXBhcmUgZmlsZSBmaWVsZCBzdHJp
bmcgd2l0aCBleHBlY3RlZCAKc3RyaW5nLiBTbywgSSBjYW4gdXNlIHRoaXMgYXBpIGZvciBwcmN0
bCBOb05ld1ByaXZzIGFuZCBTZWNjb21wIGZpZWxkIGluIAovcHJvYy9bcGlkXS9zdGF0dXMuIFdo
YXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXM/CgotLS0gYS9saWIvdHN0X2Fzc2VydC5jCisrKyBi
L2xpYi90c3RfYXNzZXJ0LmMKQEAgLTIyLDYgKzIyLDIwIEBAIHZvaWQgdHN0X2Fzc2VydF9pbnQo
Y29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IApsaW5lbm8sIGNvbnN0IGNoYXIgKnBhdGgsIGlu
dCB2YQogICAgICAgICB0c3RfcmVzXyhmaWxlLCBsaW5lbm8sIFRGQUlMLCAiJXMgIT0gJWQgZ290
ICVkIiwgcGF0aCwgdmFsLCAKc3lzX3ZhbCk7CiAgfQoKK3ZvaWQgdHN0X2Fzc2VydF9maWxlX2lu
dChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLCBjb25zdCBjaGFyIAoqcGF0aCwg
Y29uc3QgY2hhciAqYnVmLCBpbnQgdmFsKQoreworICAgICAgIGludCBzeXNfdmFsOworCisgICAg
ICAgU0FGRV9GSUxFX0xJTkVTX1NDQU5GKHBhdGgsIGJ1ZiwgJnN5c192YWwpOworCisgICAgICAg
aWYgKHZhbCA9PSBzeXNfdmFsKSB7CisgICAgICAgICAgICAgICB0c3RfcmVzXyhmaWxlLCBsaW5l
bm8sIFRQQVNTLCAiJXMgJXMgZmllbGQgPSAlZCIsIHBhdGgsIApidWYsIHN5c192YWwpOworICAg
ICAgICAgICAgICAgcmV0dXJuOworICAgICAgIH0KKworICAgICAgIHRzdF9yZXNfKGZpbGUsIGxp
bmVubywgVEZBSUwsICIlcyAlcyBmaWVsZCAhPSAlZCBnb3QgJWQiLCBwYXRoLCAKYnVmLCB2YWws
IHN5c192YWwpOworfQorCiAgdm9pZCB0c3RfYXNzZXJ0X3N0cihjb25zdCBjaGFyICpmaWxlLCBj
b25zdCBpbnQgbGluZW5vLCBjb25zdCBjaGFyIAoqcGF0aCwgY29uc3QgY2hhciAqdmFsKQogIHsK
ICAgICAgICAgY2hhciBzeXNfdmFsWzEwMjRdOwpAQCAtMzQsMyArNDgsMTcgQEAgdm9pZCB0c3Rf
YXNzZXJ0X3N0cihjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgCmxpbmVubywgY29uc3QgY2hh
ciAqcGF0aCwgY29uc3QKCiAgICAgICAgIHRzdF9yZXNfKGZpbGUsIGxpbmVubywgVEZBSUwsICIl
cyAhPSAnJXMnIGdvdCAnJXMnIiwgcGF0aCwgdmFsLCAKc3lzX3ZhbCk7CiAgfQorCit2b2lkIHRz
dF9hc3NlcnRfZmlsZV9zdHIoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywgY29u
c3QgY2hhciAKKnBhdGgsIGNvbnN0IGNoYXIgKmJ1ZiwgY29uc3QgY2hhciAqdmFsKQoreworICAg
ICAgIGNoYXIgc3lzX3ZhbFsxMDI0XTsKKworICAgICAgIFNBRkVfRklMRV9MSU5FU19TQ0FORihw
YXRoLCBidWYsIHN5c192YWwpOworCisgICAgICAgaWYgKCFzdHJjbXAodmFsLCBzeXNfdmFsKSkg
eworICAgICAgICAgICAgICAgdHN0X3Jlc18oZmlsZSwgbGluZW5vLCBUUEFTUywgIiVzICVzIGZp
ZWxkID0gJXMiLCBwYXRoLCAKYnVmLCBzeXNfdmFsKTsKKyAgICAgICAgICAgICAgIHJldHVybjsK
KyAgICAgICB9CisKKyAgICAgICB0c3RfcmVzXyhmaWxlLCBsaW5lbm8sIFRGQUlMLCAiJXMgJXMg
ZmllbGQgIT0gJXMgZ290ICVzIiwgcGF0aCwgCmJ1ZiwgdmFsLCBzeXNfdmFsKTsKK30KCgpCZXN0
IFJlZ2FyZHMKWWFuZyBYdQoKPj4KCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
