Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC51D04DC
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 04:28:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADA613C2549
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 04:28:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id ADD443C2350
 for <ltp@lists.linux.it>; Wed, 13 May 2020 04:28:26 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id DAEFF1400531
 for <ltp@lists.linux.it>; Wed, 13 May 2020 04:28:24 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,385,1583164800"; d="scan'208";a="91971683"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 10:28:16 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 9914F50A996E;
 Wed, 13 May 2020 10:28:14 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 10:28:13 +0800
Message-ID: <5EBB5B3D.4020302@cn.fujitsu.com>
Date: Wed, 13 May 2020 10:28:13 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9914F50A996E.AAEAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsIFBldHIKCkZvciB0aGUgcGF0Y2ggc2V0LCBJIGFuZCBWaXJlc2ggaGF2ZSB0aGUg
Zm9sbG93aW5nIGRvdWJ0cyBzbyBkbyB5b3UgaGF2ZSAKYW55IHN1Z2dlc3Rpb24gYWJvdXQgdGhl
bT8KMSkgSSBrZWVwIFRFU1QoKSBpbiBwaWRmZF9vcGVuMDEvcGlkZmRfb3BlbjAzIGZvciBub3cg
YnV0IEkgdGhpbmsgaXQgaXMKICAgIHN1cnBsdXMgYmVjYXVzZSBwaWRmZC9mZCBhbmQgVEVSUk5P
IGFyZSBlbm91Z2ggdG8gY2hlY2sgcmV0dXJuIHZhbHVlCiAgICBhbmQgZXJybm8uCiAgICBJIHdv
bmRlciBpZiBpdCBpcyBuZWNlc3NhcnkgdG8ga2VlcCBURVNUKCk/CjIpIHRzdF9zeXNjYWxsKCkg
aXMgZW5vdWdoIHRvIGNoZWNrIHRoZSBzdXBwb3J0IG9mIHBpZGZkX29wZW4oKSBhbmQgSQogICAg
ZG9uJ3Qgd2FudCB0byBkZWZpbmUgY2hlY2sgZnVuY3Rpb24gYXMgZnNvcGVuX3N1cHBvcnRlZF9i
eV9rZXJuZWwoKQogICAgZG9lcy4KICAgIERvIHlvdSB0aGluayBzbz8KCkJUVzoKSSBkb24ndCBs
aWtlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBmc29wZW5fc3VwcG9ydGVkX2J5X2tlcm5lbCgpOgph
KSBzeXNjYWxsKCkvdHN0X3N5c2NhbGwoKSBpcyBlbm91Z2ggdG8gY2hlY2sgdGhlIHN1cHBvcnQg
b2YKcGlkZmRfb3BlbigyKSBhbmQgJ3RzdF9rdmVyY21wKDUsIDIsIDApKSA8IDAnIHdpbGwgc2tp
cCB0aGUgY2hlY2sgaWYKYSBrZXJuZWwgb24gZGlzdHJpYnV0aW9uIGlzIG5ld2VyIHRoYW4gdjUu
MiBidXQgZHJvcCB0aGUgc3VwcG9ydCBvZgpwaWRmZF9vcGVuKDIpIG9uIHB1cnBvc2UuCmIpIHRz
dF9zeXNjYWxsKCkgaGFzIGNoZWNrZWQgRU5PU1lTIGVycm9yIHNvIHdlIGNhbiBzaW1wbGUKZnNv
cGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKSBieSByZXBsYWNpbmcgc3lzY2FsbCgpIHdpdGggdHN0
X3N5c2NhbGxzKCkuCgpCZXN0IFJlZ2FyZHMsClhpYW8gWWFuZwpPbiAyMDIwLzUvMTMgOToyNiwg
WGlhbyBZYW5nIHdyb3RlOgo+IHBpZGZkX29wZW4oMikgd2lsbCBzZXQgY2xvc2Utb24tZXhlYyBm
bGFnIG9uIHRoZSBmaWxlIGRlc2NyaXB0b3IgYXMgaXQKPiBtYW5wYWdlIHN0YXRlcywgc28gY2hl
Y2sgY2xvc2Utb24tZXhlYyBmbGFnIGJ5IGZjbnRsKDIpLgo+Cj4gQlRXOgo+IEkgdHJpZWQgdG8g
cGFzcyAobG9uZykgVFNUX1JFVCB0byBmY250bCgpIGJ1dCB0cmlnZ2VyZWQgdGhlIGZvbGxvd2lu
Zwo+IGNvbXBpbGVyIHdhcm5pbmcsIHNvIHBhc3MgKGludCkgcGlkZmQgaW5zdGVhZC4KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gcGlkZmRfb3BlbjAxLmM6OToKPiBwaWRmZF9vcGVuMDEuYzogSW4g
ZnVuY3Rpb24g4oCYcnVu4oCZOgo+IC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDo3Njo0
MTogd2FybmluZzogZm9ybWF0IOKAmCVp4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhp
bnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBlIOKAmGxvbmcgaW504oCZIFstV2Zvcm1hdD1d
Cj4gICAgIDc2IHwgICB0c3RfYnJrXyhfX0ZJTEVfXywgX19MSU5FX18sICh0dHlwZSksIChhcmdf
Zm10KSwgIyNfX1ZBX0FSR1NfXyk7XAo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiAuLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF9zYWZl
X21hY3Jvcy5oOjIyNDo1OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYdHN0X2Jya+KA
mQo+ICAgIDIyNCB8ICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICAgICAgICB8ICAgICBefn5+fn5+Cj4gcGlkZmRfb3BlbjAxLmM6MjA6OTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmFNBRkVfRkNOVEzigJkKPiAgICAgMjAgfCAg
ZmxhZyA9IFNBRkVfRkNOVEwoVFNUX1JFVCwgRl9HRVRGRCk7Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvIFlhbmc8eWFuZ3guanlAY24uZnVqaXRzdS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFZpcmVzaCBL
dW1hcjx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KPiAtLS0KPiAgIHRlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVuMDEuYyB8IDkgKysrKysrKystCj4gICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gaW5k
ZXggOTNiYjg2Njg3Li5iYTE1ODBiYzcgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gQEAgLTExLDEzICsxMSwyMCBA
QAo+Cj4gICBzdGF0aWMgdm9pZCBydW4odm9pZCkKPiAgIHsKPiAtCVRFU1QocGlkZmRfb3Blbihn
ZXRwaWQoKSwgMCkpOwo+ICsJaW50IHBpZGZkLCBmbGFnOwo+ICsKPiArCVRFU1QocGlkZmQgPSBw
aWRmZF9vcGVuKGdldHBpZCgpLCAwKSk7Cj4KPiAgIAlpZiAoVFNUX1JFVCA9PSAtMSkKPiAgIAkJ
dHN0X2JyayhURkFJTCB8IFRURVJSTk8sICJwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSBmYWlsZWQi
KTsKPgo+ICsJZmxhZyA9IFNBRkVfRkNOVEwocGlkZmQsIEZfR0VURkQpOwo+ICsKPiAgIAlTQUZF
X0NMT1NFKFRTVF9SRVQpOwo+Cj4gKwlpZiAoIShmbGFnJiAgRkRfQ0xPRVhFQykpCj4gKwkJdHN0
X2JyayhURkFJTCwgInBpZGZkX29wZW4oZ2V0cGlkKCksIDApIGRpZG4ndCBzZXQgY2xvc2Utb24t
ZXhlYyBmbGFnIik7Cj4gKwo+ICAgCXRzdF9yZXMoVFBBU1MsICJwaWRmZF9vcGVuKGdldHBpZCgp
LCAwKSBwYXNzZWQiKTsKPiAgIH0KPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
