Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2E1CF714
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:26:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92DAF3C24A4
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:26:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7A6453C1D31
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:26:46 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 81E2C1000B54
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:25:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,383,1583164800"; d="scan'208";a="91954062"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 May 2020 22:25:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id DD0B74BCC88A;
 Tue, 12 May 2020 22:25:50 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 22:25:51 +0800
Message-ID: <5EBAB1ED.2070805@cn.fujitsu.com>
Date: Tue, 12 May 2020 22:25:49 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <ice_yangxiao@163.com>, Cyril Hrubis <chrubis@suse.cz>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
 <e666a91d-1ffd-0f5f-131e-966ff763b14e@163.com>
 <20200505032803.s6axol3sfyyzl6ag@vireshk-i7>
 <de7e8921-d9cb-0f59-26c2-068e8fdaac7b@163.com>
In-Reply-To: <de7e8921-d9cb-0f59-26c2-068e8fdaac7b@163.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DD0B74BCC88A.AE46C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

5LqOIDIwMjAvNS81IDE2OjQ0LCBYaWFvIFlhbmcg5YaZ6YGTOgo+IE9uIDUvNS8yMCAxMToyOCBB
TSwgVmlyZXNoIEt1bWFyIHdyb3RlOgo+PiBPbiAwNC0wNS0yMCwgMTk6MzEsIFhpYW8gWWFuZyB3
cm90ZToKPj4+IE9uIDUvNC8yMCAxOjA5IFBNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4+Pj4gT24g
MzAtMDQtMjAsIDE2OjU3LCBYaWFvIFlhbmcgd3JvdGU6Cj4+Pj4+IHBpZGZkX29wZW4oMikgd2ls
bCBzZXQgY2xvc2Utb24tZXhlYyBmbGFnIG9uIHRoZSBmaWxlIGRlc2NyaXB0b3IgYXMgaXQKPj4+
Pj4gbWFucGFnZSBzdGF0ZXMsIHNvIGNoZWNrIGNsb3NlLW9uLWV4ZWMgZmxhZyBieSBmY250bCgy
KS4KPj4+Pj4KPj4+Pj4gQWxzbyBhdm9pZCBjb21waWxlciB3YXJuaW5nIGJ5IHJlcGxhY2luZyAo
bG9uZykgVFNUX1JFVCB3aXRoIChpbnQpCj4+Pj4+IHBpZGZkOgo+Pj4+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIHBpZGZkX29wZW4wMS5jOjk6Cj4+Pj4+IHBpZGZkX29wZW4wMS5jOiBJbiBm
dW5jdGlvbiDigJhydW7igJk6Cj4+Pj4+IC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDo3
Njo0MTogd2FybmluZzogZm9ybWF0IOKAmCVp4oCZIGV4cGVjdHMKPj4+Pj4gYXJndW1lbnQgb2Yg
dHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBlIOKAmGxvbmcgaW504oCZIFst
V2Zvcm1hdD1dCj4+Pj4+IDc2IHwgdHN0X2Jya18oX19GSUxFX18sIF9fTElORV9fLCAodHR5cGUp
LCAoYXJnX2ZtdCksICMjX19WQV9BUkdTX18pO1wKPj4+Pj4gfCBefn5+fn5+fn4KPj4+Pj4gLi4v
Li4vLi4vLi4vaW5jbHVkZS90c3Rfc2FmZV9tYWNyb3MuaDoyMjQ6NTogbm90ZTogaW4gZXhwYW5z
aW9uIG9mCj4+Pj4+IG1hY3JvIOKAmHRzdF9icmvigJkKPj4+Pj4gMjI0IHwgdHN0X2JyayhUQlJP
SyB8IFRFUlJOTywgXAo+Pj4+PiB8IF5+fn5+fn4KPj4+Pj4gcGlkZmRfb3BlbjAxLmM6MjA6OTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmFNBRkVfRkNOVEzigJkKPj4+Pj4gMjAgfCBm
bGFnID0gU0FGRV9GQ05UTChUU1RfUkVULCBGX0dFVEZEKTsKPj4+PiBUaGlzIGxvZyBpc24ndCB1
c2VmdWwgYXMgdGhlIHdhcm5pbmcgc3RhcnRlZCBjb21pbmcgYWZ0ZXIgeW91ciBjaGFuZ2UKPj4+
PiBvbmx5IGFuZCBub3QgYmVmb3JlLgo+Pj4gSGkgVmlyZXNoLAo+Pj4KPj4+IFRoYW5rcyBmb3Ig
eW91ciByZXZpZXcuCj4+Pgo+Pj4gUmlnaHTvvIxqdXN0IGFkZCBhIGhpbnQgd2h5IEkgdXNlIHBp
ZGZkIGluc3RlYWQgc28gSSB3YW50IHRvIGtlZXAgaXQuCj4+Pgo+Pj4gT2YgY291cnNl77yMSSB3
aWxsIG1lbnRpb24gdGhhdCBteSBjaGFuZ2UgaW50cm9kdWNlcyB0aGUgY29tcGlsZXIKPj4+IHdh
cm5pbmcgaW4KPj4+IHYyIHBhdGNoLgo+PiBFdmVuIHRoYXQgaXNuJ3QgcmVxdWlyZWQgcmVhbGx5
LiBZb3UgY2FuIGFkZCBhIHZhcmlhYmxlIGlmIHlvdSBsaWtlLgo+Cj4gSGkgVmlyZXNoLAo+Cj4g
VGhhbmtzIGEgbG90IGZvciB5b3VyIHJldmlldy4KPgo+IEkgcHJlZmVyIHRvIGtlZXAgaXQgOi0p
Lgo+Cj4+Cj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvIFlhbmcgPHlhbmd4Lmp5
QGNuLmZ1aml0c3UuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gLi4uL2tlcm5lbC9zeXNjYWxscy9waWRm
ZF9vcGVuL3BpZGZkX29wZW4wMS5jIHwgMTggKysrKysrKysrKysrKystLS0tCj4+Pj4+IDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29w
ZW4wMS5jCj4+Pj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZk
X29wZW4wMS5jCj4+Pj4+IGluZGV4IDkzYmI4NjY4Ny4uMjkzZTkzYjYzIDEwMDY0NAo+Pj4+PiAt
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX29wZW4vcGlkZmRfb3BlbjAxLmMK
Pj4+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29w
ZW4wMS5jCj4+Pj4+IEBAIC02LDE3ICs2LDI3IEBACj4+Pj4+ICogQmFzaWMgcGlkZmRfb3Blbigp
IHRlc3QsIGZldGNoZXMgdGhlIFBJRCBvZiB0aGUgY3VycmVudCBwcm9jZXNzCj4+Pj4+IGFuZCB0
cmllcyB0bwo+Pj4+PiAqIGdldCBpdHMgZmlsZSBkZXNjcmlwdG9yLgo+Pj4+PiAqLwo+Pj4+PiAr
Cj4+Pj4+ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8dW5pc3RkLmg+
Cj4+Pj4+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPj4+Pj4gI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4+
Pj4+ICNpbmNsdWRlICJsYXBpL3BpZGZkX29wZW4uaCIKPj4+Pj4gc3RhdGljIHZvaWQgcnVuKHZv
aWQpCj4+Pj4+IHsKPj4+Pj4gLSBURVNUKHBpZGZkX29wZW4oZ2V0cGlkKCksIDApKTsKPj4+Pj4g
KyBpbnQgcGlkZmQgPSAwLCBmbGFnID0gMDsKPj4+PiBOb25lIG9mIHRoZXNlIG5lZWQgdG8gYmUg
aW5pdGlhbGl6ZWQuCj4+PiBJbml0aWFsaXphdGlvbiBvciBub3QgaW5pdGlhbGl6YXRpb24gYXJl
IGJvdGggZmluZSBmb3IgbWUuCj4+Pgo+Pj4gRG8geW91IGhhdmUgYW55IHN0cm9uZyByZWFzb24g
dG8gZHJvcCBJbml0aWFsaXphdGlvbj8KPj4gSW5pdGlhbGl6YXRpb25zIGFyZSBvbmx5IHJlcXVp
cmVkIGlmIHRoZXJlIGlzIGEgY2hhbmNlIG9mIHRoZSB2YXJpYWJsZQo+PiBnZXR0aW5nIHVzZWQg
d2l0aG91dCBiZWluZyBpbml0aWFsaXplZCwgd2hpY2ggaXNuJ3QgdGhlIGNhc2UgaGVyZS4KPj4g
V2hhdGV2ZXIgdmFsdWUgeW91IHNldCB0byB0aGVzZSB2YXJpYWJsZXMsIHRoZXkgd2lsbCBnZXQg
b3ZlcndyaXR0ZW4KPj4gYW55d2F5Lgo+Cj4gUmlnaHQsIHRoZXkgd2lsbCBnZXQgb3ZlcndyaXR0
ZW4gYW55d2F5Lgo+Cj4gQXMgbXkgcHJldmlvdXMgcmVwbHkgc2FpZCwgZWl0aGVyIG9mIHRoZW0g
aXMgT0sgZm9yIG1lIHNvIEkgY2FuIGRyb3AKPiBpbml0aWFsaXphdGlvbnMgYXMgeW91IHN1Z2dl
c3RlZC4KPgo+Pgo+Pj4+PiArCj4+Pj4+ICsgcGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAw
KTsKPj4+Pj4gKyBpZiAocGlkZmQgPT0gLTEpCj4+Pj4+ICsgdHN0X2JyayhURkFJTCB8IFRFUlJO
TywgInBpZGZkX29wZW4oZ2V0cGlkKCksIDApIGZhaWxlZCIpOwo+Pj4+IFRoaXMgY291bGQgaGF2
ZSBiZWVuIHdyaXR0ZW4gYXM6Cj4+Pj4gVEVTVChwaWRmZCA9IHBpZGZkX29wZW4oZ2V0cGlkKCks
IDApKTsKPj4+IFdoeSBkbyB5b3Ugd2FudCB0byBrZWVwIFRFU1QoKT8gSSBkb24ndCB0aGluayBp
dCBpcyBuZWNlc3Nhcnk6Cj4+Pgo+Pj4gMSkgcGlkZmQgYW5kIFRFUlJOTyBhcmUgZW5vdWdoIHRv
IGNoZWNrIHJldHVybiB2YWx1ZSBhbmQgZXJybm8uCj4+Pgo+Pj4gMikgSXQgaXMgT0sgZm9yIHRl
c3RjYXNlIHRvIG5vdCB1c2UgVEVTVCgpLgo+PiBBcyBmYXIgYXMgSSBoYXZlIHVuZGVyc3Rvb2Qs
IHRoYXQgaXMgdGhlIHByZWZlcnJlZCB3YXkgb2YgZG9pbmcgaXQKPj4gZnJvbSBMVFAgbWFpbnRh
aW5lcnMuCj4+Cj4+IE92ZXIgdGhhdCBpdCB3YXMgYWxyZWFkeSB0aGVyZSwgd2h5IHJlbW92ZSBp
dCBub3cgPyBKdXN0IGZpeCB0aGUKPj4gcHJvYmxlbXMgeW91IGFyZSB0cnlpbmcgdG8gZml4IGFu
ZCB0aGF0IHNob3VsZCBiZSBnb29kLgo+Cj4gSGkgQ3lyaWwsCj4KPiBURVNUKCkgc2VlbXMgc3Vy
cGx1cyBhZnRlciBteSBjaGFuZ2Ugc28gSSB3YW50IHRvIHJlbW92ZSBpdCBkaXJlY3RseS4KPgo+
IEkgd29uZGVyIGlmIGl0IGlzIG5lY2Vzc2FyeSB0byBrZWVwIFRFU1QoKT8KSGkgQ3lyaWwsCgpE
byB5b3UgaGF2ZSBhbnkgY29tbWVudCBvbiB0aGUgZG91YnQ/CgpCZXN0IFJlZ2FyZHMsClhpYW8g
WWFuZwo+Cj4gVGhhbmtzLAo+Cj4gWGlhbyBZYW5nCj4KPj4KPgo+Cj4KPiAuCj4KCgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
