Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC030C71
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 12:15:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDAF5390297
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 12:15:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3F17E3EA180
 for <ltp@lists.linux.it>; Fri, 31 May 2019 12:15:29 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 42C521A016C7
 for <ltp@lists.linux.it>; Fri, 31 May 2019 12:15:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,534,1549900800"; d="scan'208";a="65374394"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 May 2019 18:15:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 64CBB4CD846F;
 Fri, 31 May 2019 18:15:21 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 31 May 2019 18:15:26 +0800
Message-ID: <5CF0FEB5.4030700@cn.fujitsu.com>
Date: Fri, 31 May 2019 18:15:17 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
In-Reply-To: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: 64CBB4CD846F.ABCA0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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

T24gMjAxOS8wNS8zMSAxNjo0NCwgSmluaHVpIGh1YW5nIHdyb3RlOgo+IE9uIG5ldyBrZXJuZWxz
LCBjb3B5X2ZpbGVfcmFuZ2UoKSByZXR1cm5lZCBFSVNESVIgd2hlbiBjb3B5ZWQgY29udGVudHMK
PiB0byBkaXJlY3RvcnksIGJ1dCBvbiBvbGQga2VybmVscywgaXQgcmV0dXJuZWQgRUJBREYsIHdl
IHNob3VsZCBhY2NlcHQKPiBFQkFERiB0byBiZSBjb21wYXRpYmxlIHdpdGggbmV3IGFuZCBvbGQg
a2VybmVscy4KPgo+IFRoZSBwYXRjaCBhcyBmb2xsb3dzOgo+IGNvbW1pdCAxMWNiZmIxMDc3NWEg
KCJ2ZnM6IGRlbnkgY29weV9maWxlX3JhbmdlKCkgZm9yIG5vbiByZWd1bGFyIGZpbGVzIikKSGks
CgpGcm9tIGRlc2NyaXB0aW9uIG9mIGNvbW1pdCwgSSB3b25kZXIgaWYgd2UgY2FuIGFkZCBtb3Jl
IHRlc3RzIGZvciBzb21lCm5vbiByZWd1bGFyIGZpbGVzKGUuZy4gYmxvY2ssIHBpcGUpPwpJIGp1
c3Qgd2FudCB0byBpbmNyZWFzZSBjb3ZlcmFnZSBhbmQgZml4IGFsbCBzaW1pbGFyIGlzc3VlcyBh
cyB5b3UgZGlkLiA6LSkKCkJlc3QgUmVnYXJkcywKWGlhbyBZYW5nCj4gU2lnbmVkLW9mZi1ieTog
SmluaHVpIGh1YW5nIDxodWFuZ2poLmp5QGNuLmZ1aml0c3UuY29tPgo+IC0tLQo+ICAuLi4vc3lz
Y2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMgICB8IDMzICsrKysrKysr
KysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29w
eV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCj4gaW5kZXggMDdjMDIwNy4u
OWU2MzU2YyAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmls
ZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwo+IEBAIC01NCwxOSArNTQs
MzIgQEAgc3RhdGljIHZvaWQgdmVyaWZ5X2NvcHlfZmlsZV9yYW5nZSh1bnNpZ25lZCBpbnQgbikK
PiAgCVRFU1Qoc3lzX2NvcHlfZmlsZV9yYW5nZShmZF9zcmMsIDAsICp0Yy0+Y29weV90b19mZCwK
PiAgCQkJCTAsIENPTlRTSVpFLCB0Yy0+ZmxhZ3MpKTsKPiAgCj4gLQlpZiAoVFNUX1JFVCA9PSAt
MSkgewo+IC0JCWlmICh0Yy0+ZXhwX2VyciA9PSBUU1RfRVJSKSB7Cj4gKwlpZiAoVFNUX1JFVCAh
PSAtMSkgewo+ICsJCXRzdF9yZXMoVEZBSUwsCj4gKwkJCSJjb3B5X2ZpbGVfcmFuZ2UgcmV0dXJu
ZWQgd3JvbmcgdmFsdWU6ICVsZCIsIFRTVF9SRVQpOwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4g
KwlpZiAodGMtPmV4cF9lcnIgPT0gVFNUX0VSUikgewo+ICsJCXRzdF9yZXMoVFBBU1MgfCBUVEVS
Uk5PLAo+ICsJCQkiY29weV9maWxlX3JhbmdlIGZhaWxlZCBhcyBleHBlY3RlZCIpOwo+ICsJfSBl
bHNlIHsKPiArCQkvKiBjb3B5X2ZpbGVfcmFuZ2UoKSByZXR1cm5lZCBFSVNESVIgd2hlbiBjb3B5
ZWQgY29udGVudHMgdG8KPiArCQkgKiBkaXJlY3Rvcnkgb24gbmV3IGtlcm5lbHMsIGJ1dCBvbiBv
bGQga2VybmVscywgaXQgcmV0dXJuZWQKPiArCQkgKiBFQkFERi4KPiArCQkgKgo+ICsJCSAqIHRo
ZSBwYXRjaCBhcyBmb2xsd3M6Cj4gKwkJICogY29tbWl0IDExY2JmYjEwNzc1YSAoInZmczogZGVu
eSBjb3B5X2ZpbGVfcmFuZ2UoKSBmb3Igbm9uIHJlZ3VsYXIgZmlsZXMiKQo+ICsJCSAqLwo+ICsJ
CWlmICh0Yy0+ZXhwX2VyciA9PSBFSVNESVIgJiYgVFNUX0VSUiA9PSBFQkFERikgewo+ICAJCQl0
c3RfcmVzKFRQQVNTIHwgVFRFUlJOTywKPiAtCQkJCQkiY29weV9maWxlX3JhbmdlIGZhaWxlZCBh
cyBleHBlY3RlZCIpOwo+IC0JCX0gZWxzZSB7Cj4gLQkJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5P
LAo+IC0JCQkJImNvcHlfZmlsZV9yYW5nZSBmYWlsZWQgdW5leHBlY3RlZGx5OyBleHBlY3RlZCAl
cywgYnV0IGdvdCIsCj4gLQkJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKPiArCQkJCSJj
b3B5X2ZpbGVfcmFuZ2UgZmFpbGVkIGFzIGV4cGVjdGVkIik7Cj4gIAkJCXJldHVybjsKPiAgCQl9
Cj4gLQl9IGVsc2Ugewo+IC0JCXRzdF9yZXMoVEZBSUwsCj4gLQkJCSJjb3B5X2ZpbGVfcmFuZ2Ug
cmV0dXJuZWQgd3JvbmcgdmFsdWU6ICVsZCIsIFRTVF9SRVQpOwo+ICsKPiArCQl0c3RfcmVzKFRG
QUlMIHwgVFRFUlJOTywKPiArCQkJImNvcHlfZmlsZV9yYW5nZSBmYWlsZWQgdW5leHBlY3RlZGx5
OyBleHBlY3RlZCAlcywgYnV0IGdvdCIsCj4gKwkJCXRzdF9zdHJlcnJubyh0Yy0+ZXhwX2Vycikp
Owo+ICAJfQo+ICB9Cj4gIAoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
