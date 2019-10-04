Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482BCB89A
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 12:48:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2DD33C229F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 12:48:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 32B793C2152
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:48:39 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5526F200903
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:48:38 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.193.66.40])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 010469F91C;
 Fri,  4 Oct 2019 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570186117; bh=LVFYnCFQmz1+F8TT7wBjQeM9fBmfXzV4qfmWSnwrHoI=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=PcBVd7u4Nyxxp5FeLOt+sjEW5VVwHmr7zH0F5X0Ylk7O/HK9pZlGnbnB2fEZbvy6h
 uS4Gl4TSUHgq1S/FA10oZfgDRm0khmpTizXOpq+ebaEF9RYdTQB/Mc2w8p43JDqnE0
 0JMlyaa37LIqWynHlgFd2j0tnsvOs0fxxUnBbzQ4=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190927092024.97928-1-lkml@jv-coder.de>
 <20191004103414.GE1231@rei>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <635c345d-18f8-6f2e-e658-648251d32e65@jv-coder.de>
Date: Fri, 4 Oct 2019 12:48:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191004103414.GE1231@rei>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] lsmod01: Add kernel module
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpBbSAwNC4xMC4yMDE5IHVtIDEyOjM0IHNjaHJpZWIgQ3lyaWwgSHJ1YmlzOgo+IEhpIQo+
PiBGb3Jnb3QgY2FsbGluZyBjbGVhbnVwIGluIHYxCj4+Cj4+IFRoZSB0ZXN0IGZhaWxzLCBpZiBu
byBrZXJuZWwgbW9kdWxlIGlzIGxvYWRlZC4gTm93IGF0IGxlYXN0IG9uZSBtb2R1bGUgaXMKPj4g
YWx3YXlzIGxvYWRlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9lcmcgVmVobG93IDxqb2VyZy52
ZWhsb3dAYW94LXRlY2guZGU+Cj4+IC0tLQo+PiAgIHRlc3RjYXNlcy9jb21tYW5kcy8uZ2l0aWdu
b3JlICAgICAgICAgIHwgIDEgKwo+PiAgIHRlc3RjYXNlcy9jb21tYW5kcy9sc21vZC9NYWtlZmls
ZSAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4+ICAgdGVzdGNhc2VzL2NvbW1hbmRzL2xzbW9k
L2xzbW9kMDEuc2ggICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIHRlc3Rj
YXNlcy9jb21tYW5kcy9sc21vZC9sdHBfbHNtb2QwMS5jIHwgMjYgKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gICA0IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2NvbW1hbmRzL2xzbW9kL2x0cF9sc21vZDAxLmMKPj4K
Pj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9jb21tYW5kcy8uZ2l0aWdub3JlIGIvdGVzdGNhc2Vz
L2NvbW1hbmRzLy5naXRpZ25vcmUKPj4gaW5kZXggMGVkMzQzODgxLi5lZDVlMTNlMjkgMTAwNjQ0
Cj4+IC0tLSBhL3Rlc3RjYXNlcy9jb21tYW5kcy8uZ2l0aWdub3JlCj4+ICsrKyBiL3Rlc3RjYXNl
cy9jb21tYW5kcy8uZ2l0aWdub3JlCj4+IEBAIC0yLDMgKzIsNCBAQAo+PiAgIC9sZGQvZGF0YWZp
bGVzLyoub2JqLnNvCj4+ICAgL2VqZWN0L2VqZWN0X2NoZWNrX3RyYXkKPj4gICAvaW5zbW9kL2x0
cF9pbnNtb2QwMS5rbwo+PiArL2xzbW9kL2x0cF9sc21vZDAxLmtvCj4+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMvY29tbWFuZHMvbHNtb2QvTWFrZWZpbGUgYi90ZXN0Y2FzZXMvY29tbWFuZHMvbHNt
b2QvTWFrZWZpbGUKPj4gaW5kZXggMmFmOTFiM2RlLi44ZmMzYjE0MzYgMTAwNjQ0Cj4+IC0tLSBh
L3Rlc3RjYXNlcy9jb21tYW5kcy9sc21vZC9NYWtlZmlsZQo+PiArKysgYi90ZXN0Y2FzZXMvY29t
bWFuZHMvbHNtb2QvTWFrZWZpbGUKPj4gQEAgLTEzLDEwICsxMywyNSBAQAo+PiAgICMgICAgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPj4gICAjCj4+ICAgCj4+
ICtpZm5lcSAoJChLRVJORUxSRUxFQVNFKSwpCj4+ICsKPj4gK29iai1tIDo9IGx0cF9sc21vZDAx
Lm8KPj4gKwo+PiArZWxzZQo+PiArCj4+ICAgdG9wX3NyY2RpcgkJPz0gLi4vLi4vLi4KPj4gICAK
Pj4gK2luY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5tawo+PiArCj4+
ICtSRVFfVkVSU0lPTl9NQUpPUiAgICAgICA6PSAyCj4+ICtSRVFfVkVSU0lPTl9QQVRDSCAgICAg
ICA6PSA2Cj4+ICtNQUtFX1RBUkdFVFMgICAgICAgICAgICA6PSBsdHBfbHNtb2QwMS5rbwo+PiAr
Cj4+ICAgaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvZW52X3ByZS5tawo+PiAgIAo+
PiAgIElOU1RBTExfVEFSR0VUUwkJOj0gbHNtb2QwMS5zaAo+PiAgIAo+PiAraW5jbHVkZSAkKHRv
cF9zcmNkaXIpL2luY2x1ZGUvbWsvbW9kdWxlLm1rCj4+ICAgaW5jbHVkZSAkKHRvcF9zcmNkaXIp
L2luY2x1ZGUvbWsvZ2VuZXJpY19sZWFmX3RhcmdldC5tawo+PiArCj4+ICtlbmRpZgo+PiBkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2NvbW1hbmRzL2xzbW9kL2xzbW9kMDEuc2ggYi90ZXN0Y2FzZXMv
Y29tbWFuZHMvbHNtb2QvbHNtb2QwMS5zaAo+PiBpbmRleCBhZDE3MGRjZDQuLjdmOWRkMjg0ZSAx
MDA3NTUKPj4gLS0tIGEvdGVzdGNhc2VzL2NvbW1hbmRzL2xzbW9kL2xzbW9kMDEuc2gKPj4gKysr
IGIvdGVzdGNhc2VzL2NvbW1hbmRzL2xzbW9kL2xzbW9kMDEuc2gKPj4gQEAgLTUsMTMgKzUsMzcg
QEAKPj4gICAjCj4+ICAgIyBUZXN0IGJhc2ljIGZ1bmN0aW9uYWxpdHkgb2YgbHNtb2QgY29tbWFu
ZC4KPj4gICAKPj4gK1RTVF9DTEVBTlVQPWNsZWFudXAKPj4gICBUU1RfVEVTVEZVTkM9bHNtb2Rf
dGVzdAo+PiAgIFRTVF9ORUVEU19UTVBESVI9MQo+PiAgIFRTVF9ORUVEU19DTURTPSJsc21vZCIK
Pj4gK1RTVF9ORUVEU19NT0RVTEU9Imx0cF9sc21vZDAxLmtvIgo+PiAgIC4gdHN0X3Rlc3Quc2gK
Pj4gICAKPj4gK2luc2VydGVkPTAKPj4gKwo+PiArY2xlYW51cCgpCj4+ICt7Cj4+ICsJaWYgWyAk
aW5zZXJ0ZWQgLW5lIDAgXTsgdGhlbgo+PiArCQl0c3RfcmVzIFRJTkZPICJydW5uaW5nIHJtbW9k
IGx0cF9sc21vZDAxIgo+PiArCQlybW1vZCBsdHBfbHNtb2QwMQo+PiArCQlpZiBbICQ/IC1uZSAw
IF07IHRoZW4KPj4gKwkJCXRzdF9yZXMgVFdBUk4gImZhaWxlZCB0byBybW1vZCBsdHBfbHNtb2Qw
MSIKPj4gKwkJZmkKPj4gKwkJaW5zZXJ0ZWQ9MAo+PiArCWZpCj4+ICt9Cj4+ICsKPj4gKwo+PiAg
IGxzbW9kX3Rlc3QoKQo+PiAgIHsKPj4gKwlpbnNtb2QgIiRUU1RfTU9EUEFUSCIKPj4gKwlpZiBb
ICQ/IC1uZSAwIF07IHRoZW4KPj4gKwkJdHN0X3JlcyBURkFJTCAiaW5zbW9kIGZhaWxlZCIKPj4g
KwkJcmV0dXJuCj4+ICsJZmkKPj4gKwlpbnNlcnRlZD0xCj4gVGhpcyBzaG91bGQgYmUgaW4gdGhl
IHRlc3Qgc2V0dXAuIEFsc28gY2FuIGluc2VydCB0aGUgbW9kdWxlIG9ubHkgYW5kCj4gb25seSBp
ZiAvcHJvYy9tb2R1bGVzIGlzIGVtcHR5PwpZb3UgYXJlIHJpZ2h0LCBJIHdpbGwgY2hhbmdlIGl0
Cj4KPj4gICAJbHNtb2Rfb3V0cHV0PSQobHNtb2QgfCBhd2sgJyEvTW9kdWxlL3twcmludCAkMSwg
JDIsICQzfScgfCBzb3J0KQo+PiAgIAlpZiBbIC16ICIkbHNtb2Rfb3V0cHV0IiBdOyB0aGVuCj4+
ICAgCQl0c3RfcmVzIFRGQUlMICJGYWlsZWQgdG8gcGFyc2UgdGhlIG91dHB1dCBmcm9tIGxzbW9k
Igo+PiBAQCAtMzQsNiArNTgsOCBAQCBsc21vZF90ZXN0KCkKPj4gICAJCXJldHVybgo+PiAgIAlm
aQo+PiAgIAo+PiArCWNsZWFudXAKPiBJZiB5b3UgZGVmaW5lIHRoZSBjbGVhbnVwIGluIFRTVF9D
TEVBTlVQIHRoZSBsaWJyYXJ5IHdpbGwgY2FsbCBpdCBmb3IKPiB5b3UsIGRvIG5vdCBjYWxsIGl0
IHlvdXJzZWxmIGhlcmUuCgpObywgaWYgbm8gVFNUX1NFVFVQIGlzIGRlZmluZWQsIHRoZSBsaWJy
YXJ5IHdpbGwgbm90IGNhbGwgaXQuClNlZSB0c3RfdGVzdC5zaDozMToKaWZbIC1uICIkVFNUX1NF
VFVQX1NUQVJURUQiIC1hIC1uICIkVFNUX0NMRUFOVVAiIC1hIFwKIMKgwqDCoCDCoMKgwqDCoCAt
eiAiJFRTVF9OT19DTEVBTlVQIiBdOyB0aGVuCiDCoMKgwqAgJFRTVF9DTEVBTlVQCmZpCkJ1dCBz
aW5jZSBJJ20gZ29pbmcgdG8gbW92ZSB0aGUgbW9kdWxlIGxvYWRpbmcgaW50byBzZXR1cCwKSSBj
YW4gcmVtb3ZlIHRoaXMuCgo+Cj4+ICAgCXRzdF9yZXMgVFBBU1MgIidsc21vZCcgcGFzc2VkLiIK
Pj4gICB9Cj4+ICAgCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY29tbWFuZHMvbHNtb2QvbHRw
X2xzbW9kMDEuYyBiL3Rlc3RjYXNlcy9jb21tYW5kcy9sc21vZC9sdHBfbHNtb2QwMS5jCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMC4uOGJhNzg2Mjc2Cj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvdGVzdGNhc2VzL2NvbW1hbmRzL2xzbW9kL2x0cF9sc21vZDAxLmMK
Pj4gQEAgLTAsMCArMSwyNiBAQAo+PiArLyoKPj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTYgRnVqaXRzdSBMdGQu
Cj4+ICsgKiBBdXRob3I6IEd1YW5nd2VuIEZlbmcgPGZlbmdndy1mbnN0QGNuLmZ1aml0c3UuY29t
Pgo+PiArICoKPj4gKyAqIERlc2NyaXB0aW9uOgo+PiArICogIFRoaXMgaXMgYSBrZXJuZWwgbG9h
ZGFibGUgbW9kdWxlIHByb2dyYW1tZSB1c2VkIGJ5IGxzc21vZDAxLnNoCj4+ICsgKiAgdGVzdGNh
c2Ugd2hpY2ggaW5zZXJ0cyB0aGlzIG1vZHVsZSBmb3IgdGVzdCBvZiBsc21vZCBjb21tYW5kLgo+
PiArICovCj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4gKyNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+ICsKPj4gK3N0YXRp
YyBpbnQgdGVzdF9pbml0KHZvaWQpCj4+ICt7Cj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4g
K3N0YXRpYyB2b2lkIHRlc3RfZXhpdCh2b2lkKQo+PiArewo+PiArCj4+ICt9Cj4+ICsKPj4gK21v
ZHVsZV9pbml0KHRlc3RfaW5pdCk7Cj4+ICttb2R1bGVfZXhpdCh0ZXN0X2V4aXQpOwo+IFlvdSBh
cmUgbWlzc2luZyB0aGUgR1BMIGxpY2Vuc2UgaGVyZSwgd2l0aG91dCBpdCB0aGUgbW9kdWxlIHdp
bGwgdGFpbnQKPiB0aGUga2VybmVsLgpJIHdpbGwgYWRkIGl0LgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
