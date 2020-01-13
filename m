Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70E138C72
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2020 08:38:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C8F73C249B
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2020 08:38:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8276D3C08A1
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 08:38:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8AF73600926
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 08:38:22 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,428,1571673600"; d="scan'208";a="81724763"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 15:38:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E07484CE1CB3;
 Mon, 13 Jan 2020 15:29:11 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 15:38:18 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1577269768-30118-1-git-send-mail-xuyang2018.jy@cn.fujitsu.com>
 <1578365634-19825-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200110133746.GB14140@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <90d369da-1340-d919-e9e5-f819d028daf9@cn.fujitsu.com>
Date: Mon, 13 Jan 2020 15:38:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200110133746.GB14140@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E07484CE1CB3.ADC4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/pipe12: add new test for pipe when
 write bytes > PIPE_BUF
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGmjoQo+IEhpIQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvcGlwZS9waXBlMTIuYwo+PiBAQCAtMCwwICsxLDEwNiBAQAo+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQg
KGMpIDIwMjAgRlVKSVRTVSBMSU1JVEVELiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+PiArICogQXV0
aG9yOiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+PiArICoKPj4gKyAq
IFRlc3QgRGVzY3JpcHRpb246Cj4+ICsgKiBBIHBpcGUgaGFzIGEgbGltaXRlZCBjYXBhY2l0eS4g
SWYgdGhlIHBpcGUgd2l0aCBub24gYmxvY2sgbW9kZSBpcyBmdWxsLAo+PiArICogdGhlbiBhIHdy
aXRlKDIpIHdpbGwgZmFpbCBhbmQgZ2V0IEVBR0FJTiBlcnJvci4gT3RoZXJ3aXNlLCBmcm9tIDEg
dG8KPj4gKyAqIFBJUEVfQlVGIGJ5dGVzIG1heSBiZSB3cml0dGVuLgo+PiArICovCj4+ICsjZGVm
aW5lIF9HTlVfU09VUkNFCj4+ICsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4+ICsjaW5jbHVkZSA8c3Rk
bGliLmg+Cj4+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPj4gKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+
PiArI2luY2x1ZGUgImxhcGkvZmNudGwuaCIKPj4gKwo+PiArc3RhdGljIGludCBmZHNbMl07Cj4+
ICtzdGF0aWMgY2hhciAqd3JidWY7Cj4+ICtzdGF0aWMgY2hhciAqcmRidWY7Cj4+ICtzdGF0aWMg
c3NpemVfdCBtYXhfc2l6ZSwgaW52YWxpZF9zaXplOwo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHRj
YXNlIHsKPj4gKwlpbnQgZnVsbF9mbGFnOwo+PiArCWludCBuZWVkX29mZnNldDsKPiAKPiBUaGlz
IGNvdWxkIGJlIGNhbGxlZCBqdXN0IG9mZnNldCwgaXQgZG9lcyBub3QgaGF2ZSB0byBiZSBib29s
ZWFuIGVpdGhlciwKPiB3ZSBqdXN0IG5lZWQgdG8gd3JpdGUgb2Zmc2V0IGJ5dGVzIGZyb20gYSBi
dWZmZXIgYmVmb3JlIHdlIGF0dGVtcHQgdG8KPiB3cml0ZSB0byB0aGUgcGlwZS4KT0suCj4gCj4+
ICsJY2hhciAqbWVzc2FnZTsKPj4gK30gdGNhc2VzW10gPSB7Cj4+ICsJezEsIDAsICJUZXN0IG9u
IGZ1bGwgcGlwZSJ9LAo+ICAgICAgICAgICAgICAgICAgICJXcml0ZSB0byBmdWxsIHBpcGUiCj4+
ICsJezAsIDEsICJUZXN0IG9uIG5vbiBmdWxsIHBpcGUgZnJvbSAxIG9mZnNldCJ9LAo+IAkJICJX
cml0ZSB0byBub24tZW1wdHkgcGlwZSIKPj4gKwl7MCwgMCwgIlRlc3Qgb24gbm9uIGZ1bGwgcGlw
ZSBmcm9tIDAgb2Zmc2V0In0sCj4gICAgICAgICAgICAgICAgICAgICAgICAiV3JpdGUgdG8gZW1w
dHkgcGlwZSIKPj4gK307Cj4+ICsKT0suCj4+ICtzdGF0aWMgdm9pZCB2ZXJpZnlfcGlwZSh1bnNp
Z25lZCBpbnQgbikKPj4gK3sKPj4gKwlzdHJ1Y3QgdGNhc2UgKnRjID0gJnRjYXNlc1tuXTsKPj4g
Kwo+PiArCW1lbXNldChyZGJ1ZiwgMCwgbWF4X3NpemUpOwo+PiArCj4+ICsJdHN0X3JlcyhUSU5G
TywgIiVzIiwgdGMtPm1lc3NhZ2UpOwo+PiArCWlmICh0Yy0+ZnVsbF9mbGFnKSB7Cj4+ICsJCVNB
RkVfV1JJVEUoMSwgZmRzWzFdLCB3cmJ1ZiwgbWF4X3NpemUpOwo+PiArCQlURVNUKHdyaXRlKGZk
c1sxXSwgIngiLCAxKSk7Cj4+ICsJCWlmIChUU1RfUkVUID09IDApIHsKPiAJCQl3cml0ZSBpcyBy
ZXF1aXJlZCB0byByZXR1cm4gLTEgaGVyZSB3aGljaCBpcwo+IAkJCXdoYXQgd2UgaGF2ZSB0byBj
aGVjayBhZ2FpbnN0IGkuZSwgVFNUX1JFVCAhPSAtMQo+IAkJCW1lYW5zIGZhaWwKPj4gKwkJCXRz
dF9yZXMoVEZBSUwsICJ3cml0ZSBzdWNjZWVkZWQgdW5leHBlY3RlZGx5Iik7Cj4+ICsJCQlnb3Rv
IGNsZWFuX3BpcGVfYnVmOwo+PiArCQl9Cj4+ICsJCWlmIChUU1RfRVJSID09IEVBR0FJTikKPj4g
KwkJCXRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLCAid3JpdGUgZmFpbGVkIGFzIGV4cGVjdGVkIik7
Cj4+ICsJCWVsc2UKPj4gKwkJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAid3JpdGUgZmFpbGVk
LCBleHBlY3RlZCBFQUdBSU4gYnV0IGdvdCIpOwo+PiArCX0gZWxzZSB7Cj4+ICsJCWlmICh0Yy0+
bmVlZF9vZmZzZXQpCj4+ICsJCQlTQUZFX1dSSVRFKDEsIGZkc1sxXSwgIngiLCAxKTsKPj4gKwkJ
VEVTVCh3cml0ZShmZHNbMV0sIHdyYnVmLCBpbnZhbGlkX3NpemUpKTsKPj4gKwkJaWYgKFRTVF9S
RVQgPT0gLTEpIHsKPj4gKwkJCXRzdF9yZXMoVEZBSUwsICJ3cml0ZSBmYWlsZWQgdW5leHBlY3Rl
ZGx5Iik7Cj4+ICsJCQlnb3RvIGNsZWFuX3BpcGVfYnVmOwo+PiArCQl9Cj4+ICsJCWlmIChUU1Rf
UkVUID09IGludmFsaWRfc2l6ZSkKPj4gKwkJCXRzdF9yZXMoVEZBSUwsICJ3cml0ZSBzaXplICVs
ZCBsYXJnZXIgdGhhbiBQSVBFX0JVRiAlbGQiLCBUU1RfUkVULCBtYXhfc2l6ZSk7Cj4+ICsJCWVs
c2UKPj4gKwkJCXRzdF9yZXMoVFBBU1MsICJ3cml0ZSBzaXplICVsZCBiZXR3ZWVuIFsxLCAlbGRd
IiwgVFNUX1JFVCwgbWF4X3NpemUpOwo+IAo+IAkJSGVyZSBhcyB3ZWxsLCB3cml0ZSBpcyBzdXBw
b3NlZCB0byByZXR1cm4gdGhlIG51bWJlciBvZgo+IAkJYnl0ZXMgd3JpdHRlbiBzbyBpbiB0aGlz
IGNhc2UgdGhlIFRTVF9SRVQgbXVzdCBiZQo+IAkJbWF4X3NpemUgLSB0Y2FzZS0+b2Zmc2V0IHdo
aWNoIGlzIGFsbCB3ZSBoYXZlIHRvIGNoZWNrCj4gCQlmb3IsIGFueXRoaW5nIGVsc2UgdGhhbiB0
aGF0IG1lYW5zIGZhaWx1cmUuCkkgaGF2ZSBzZWVuIHBpcGVfd3JpdGUga2VybmVsIGNvZGVbMV0s
IGl0IG9ubHkgbWVyZ2VkIHNtYWxsIHNpemUgd3JpdGUgCmJ1dCBub3QgbGFyZ2Ugc2l6ZSB3cml0
ZShsYXJnZSBzaXplIHdyaXRlIHdpbGwgc3RpbGwgcGFnZS1hbGlnbiBzaXplLCBpbiAKb3RoZXIg
d29yZCwgaXQgdXNlcyBuZXcgcGFnZSkuIFNvLCBJIHRoaW5rIGl0IGlzIHdoeSBtYW4tcGFnZXMg
c2FpZCAKImZyb20gMSB0byBuIGJ5dGVzIG1heSBiZSB3cml0dGVuIi4gSXQgbWF5IGV4aXN0IGEg
aG9sZSB3aGVuIHdlIHVzZSBhIAp1bmFsaWduIG9mZnNldCBhbmQgdGhlIHNlcXVlbnQgYWxpZ24t
cGFnZSB3cml0ZS4gSSB0aGluayBpdCBpcyBub3JtYWwgCmFuZCBkb24ndCBuZWVkIHRvIG1lYW4g
ZmFpbHVyZS4gICJUU1RfUkVUIGlzIG1heF9zaXplIC0gdGNhc2UtPm9mZnNldCIgCmlzIG9rIHdo
ZW4gd2UgdXNlIFswLE4qcGFnZV9zaXplLTFdIFtwYWdlX3NpemUscGFnZV9idWYtMV0gd3JpdGUg
b3IgClswLGEtMV0gW2EsIHBhZ2VfYnVmLTFdIHdyaXRlLgoKVGhlIG90aGVyIHJlYXNvbiBmb3Ig
aXQgSSBndWVzcyBiZWFjYXVzZSBsb29raW5nIGZvciBhIGhvbGUgIG1heSBkcm9wIApwZWZvcm1h
bmNlIHdoZW4gcGlwZSBidWYgaXMgbGFyZ2UuCgpBbHNvLCB3ZSBjYW4gcHJpbnQgd3JpdGUgYnR5
ZXMgYnkgaW9jdGwoZmQsIEZJT05SRUFELCAmbmJ5dGVzKSBjb21tYW5kCihjb3ZlciB0aGlzIGlv
Y3RsIHRlc3QgcG9pbnQpLgoKWzFdaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZnMvcGlwZS5jI240MzEKPiAKPj4g
Kwl9Cj4+ICsKPj4gK2NsZWFuX3BpcGVfYnVmOgo+PiArCVNBRkVfUkVBRCgwLCBmZHNbMF0sIHJk
YnVmLCBtYXhfc2l6ZSk7Cj4+ICt9Cj4+ICsKPj4gKwo+PiArc3RhdGljIHZvaWQgY2xlYW51cCh2
b2lkKQo+PiArewo+PiArCWlmIChmZHNbMF0gPiAwKQo+PiArCQlTQUZFX0NMT1NFKGZkc1swXSk7
Cj4+ICsJaWYgKGZkc1sxXSA+IDApCj4+ICsJCVNBRkVfQ0xPU0UoZmRzWzFdKTsKPj4gKwlpZiAo
d3JidWYpCj4+ICsJCWZyZWUod3JidWYpOwo+PiArCWlmIChyZGJ1ZikKPj4gKwkJZnJlZShyZGJ1
Zik7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4+ICt7Cj4+ICsKPj4g
KwlURVNUKHBpcGUoZmRzKSk7Cj4+ICsJaWYgKFRTVF9SRVQgPT0gLTEpIHsKPj4gKwkJdHN0X2Jy
ayhUQlJPSyB8IFRURVJSTk8sICJwaXBlIik7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4gCj4gVGhp
cyBpcyBleGFjdGx5IHdoYXQgU0FGRV9QSVBFKCkgZG9lcy4KPiAKT0suCj4+ICsJbWF4X3NpemUg
PSBTQUZFX0ZDTlRMKGZkc1sxXSwgRl9HRVRQSVBFX1NaKTsKPj4gKwlpbnZhbGlkX3NpemUgPSBt
YXhfc2l6ZSArIDQwOTY7Cj4+ICsJd3JidWYgPSBTQUZFX01BTExPQyhpbnZhbGlkX3NpemUpOwo+
PiArCXJkYnVmID0gU0FGRV9NQUxMT0MobWF4X3NpemUpOwo+PiArCW1lbXNldCh3cmJ1ZiwgJ3gn
LCBpbnZhbGlkX3NpemUpOwo+PiArCj4+ICsJU0FGRV9GQ05UTChmZHNbMV0sIEZfU0VURkwsIE9f
Tk9OQkxPQ0spOwo+PiArCVNBRkVfRkNOVEwoZmRzWzBdLCBGX1NFVEZMLCBPX05PTkJMT0NLKTsK
Pj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+PiArCS50ZXN0
ID0gdmVyaWZ5X3BpcGUsCj4+ICsJLnNldHVwID0gc2V0dXAsCj4+ICsJLmNsZWFudXAgPSBjbGVh
bnVwLAo+PiArCS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMpLAo+PiArfTsKPj4gLS0gCj4+IDIu
MTguMAo+Pgo+Pgo+Pgo+Pgo+PiAtLSAKPj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
