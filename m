Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EE19772F
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 10:59:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 541243C3165
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 10:59:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 28B233C3135
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:59:16 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 992C9140116E
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:59:13 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; d="scan'208";a="87919473"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 16:59:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id CE52949DF136;
 Mon, 30 Mar 2020 16:48:47 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 16:59:03 +0800
Message-ID: <5E81B4D5.9070706@cn.fujitsu.com>
Date: Mon, 30 Mar 2020 16:59:01 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Zouwei (Samuel)" <zou_wei@huawei.com>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
 <5E81A0EF.4040508@cn.fujitsu.com>
 <C3CD0DF8AD11A84CB25A1426DE537C61E5928002@dggeml524-mbx.china.huawei.com>
In-Reply-To: <C3CD0DF8AD11A84CB25A1426DE537C61E5928002@dggeml524-mbx.china.huawei.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CE52949DF136.A999F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSCB2MyAwLzNdIEZpeCBidWcgY2F1?=
 =?gb2312?b?c2VkIGJ5IGRlZmF1bHQgdW1hc2s=?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAyMC8zLzMwIDE2OjIyLCBab3V3ZWkgKFNhbXVlbCkgd3JvdGU6Cj4gSGkgWWFuZywKPiAK
PiBJIGRvd25sb2FkZWQgdGhlIGRldmVsb3BtZW50IHZlcnNpb24gb2YgbHRwIHR3byB3ZWVrcyBh
Z28sIHJhbiB0aGUgY2FzZXMgaW4gdGhlIHJ1bnRlc3QgZGlyZWN0b3J5LCBhbmQgYW5hbHl6ZWQg
YWxsIHRoZSBmYWlsZWQgY2FzZXMuCj4gSSBmb3VuZCB0aGF0IHRoZXNlIDMgY2FzZXMgaGF2ZSB0
aGUgdW1hc2sgaXNzdWUuCj4gCj4gRHVlIHRvIHRoZSBsaW1pdGVkIHRpbWUgaW52ZXN0ZWQgYnkg
aW5kaXZpZHVhbHMsIGl0IGlzIHBvc3NpYmxlIHRoYXQgb3RoZXIgY2FzZXMgd2l0aCB0aGUgc2Ft
ZSBpc3N1ZSB3aWxsIG5vdCBiZSBkaXNjb3ZlcmVkLgo+IEkgd2lsbCBhbmFseXplIHRoZSBvdGhl
ciBmYWlsZWQgY2FzZXMgdGhhdCBoYXZlIG5vdCBiZWVuIGNvbmNsdWRlZCBmdXJ0aGVyIGluIHRo
ZSBuZXh0IGZldyB3ZWVrcy4KSGkgWm91LAoKVGhhbmtzLCBJIGhhdmUgcHVzaGVkIHRoZSBwYXRj
aCBzZXQuClBlcmhhcHMsIHlvdSBjYW4gZml4IGFsbCBzYW1lIHVtYXNrIGlzc3VlcyBieSBhIHNp
bmdsZSBwYXRjaCBpbiBmdXR1cmUuCgpUaGFua3MsClhpYW8gWWFuZwo+IAo+IFRoYW5rcyBmb3Ig
eW91ciBzdWdnZXN0aW9ucyBhbmQgcmV2aWV3cy4KPiAKPiBCZXN0IFJlZ2FyZHMKPiBab3UgV2Vp
Cj4gLS0tLS3Tyrz+1K28/i0tLS0tCj4gt6K8/sjLOiBYaWFvIFlhbmcgW21haWx0bzp5YW5neC5q
eUBjbi5mdWppdHN1LmNvbV0KPiC3osvNyrG85DogMjAyMMTqM9TCMzDI1SAxNTozNAo+IMrVvP7I
yzogWm91d2VpIChTYW11ZWwpPHpvdV93ZWlAaHVhd2VpLmNvbT4KPiCzrcvNOiBsdHBAbGlzdHMu
bGludXguaXQKPiDW98ziOiBSZTogW0xUUF0gW1BBVENIIHYzIDAvM10gRml4IGJ1ZyBjYXVzZWQg
YnkgZGVmYXVsdCB1bWFzawo+IAo+IE9uIDIwMjAvMy8zMCAxNToyNywgWm91IFdlaSB3cm90ZToK
Pj4gdjM6Cj4+IFRoZSBjYXNlIGlzIG9ubHkgc3VjY2Vzc2Z1bCB3aGVuIHN5c3RlbSBkZWZhdWx0
IHVtYXNrIGlzIDAwMjIuCj4+IFdoZW4gZGVmYXVsdCB1bWFzayBpcyAwMDc3IG9yIG90aGVyIHZh
bHVlcywgc2hvdWxkIGNsZWFyIHVtYXNrIGJ5IHVtYXNrKDApIGluIHNldHVwKCkuCj4gSGkgWm91
LAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCBzZXQuCj4gRGlkIHlvdSBmaW5kIGFueSBvdGhl
ciBjYXNlcyByZWxhdGVkIHdpdGggdGhlIHNhbWUgaXNzdWU/Cj4gCj4gVGhhbmtzLAo+IFhpYW8g
WWFuZwo+Pgo+PiBab3UgV2VpICgzKToKPj4gICAgIHNlY3VyaXR5L2RpcnR5YzB3OiBGaXggYnVn
IGNhdXNlZCBieSBkZWZhdWx0IHVtYXNrCj4+ICAgICBzeXNjYWxscy9mc3RhdDogRml4IGJ1ZyBj
YXVzZWQgYnkgZGVmYXVsdCB1bWFzawo+PiAgICAgc3lzY2FsbHMvc3RhdHgwMTogRml4IGJ1ZyBj
YXVzZWQgYnkgZGVmYXVsdCB1bWFzawo+Pgo+PiAgICB0ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5
L2RpcnR5YzB3L2RpcnR5YzB3LmMgfCAyICsrCj4+ICAgIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZnN0YXQvZnN0YXQwMi5jICAgICB8IDIgKysKPj4gICAgdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zdGF0eC9zdGF0eDAxLmMgICAgIHwgMiArKwo+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQo+Pgo+PiAtLQo+PiAyLjYuMgo+Pgo+Pgo+IAo+IAo+IAo+IAo+IAoKCgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
