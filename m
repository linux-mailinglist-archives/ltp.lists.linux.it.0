Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DF1C50B6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 10:45:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F09F3C267C
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 10:45:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B2B203C2669
 for <ltp@lists.linux.it>; Tue,  5 May 2020 10:45:06 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 67AAC140134B
 for <ltp@lists.linux.it>; Tue,  5 May 2020 10:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=HxlFi
 G36ediurUJxco9iMUu1AcGkJZGwehwtN4NiJ+c=; b=TiKjBTOOgBJxFnbmFvFEX
 LavSc7nFGqopwJe7eI7JT6pM7jp9n6ZLLnUjW6WA5Da6vDF4RjArHJ4BQ7DzN6z4
 Q/bHeF1M6I73OToj9fA03HZh1lygbHeoP/WsOf/5m4EqKyZIzFfS4rgKP1zGGpue
 RFUokdH+Zop6HX0a6/bCEI=
Received: from [192.168.0.10] (unknown [223.64.143.32])
 by smtp9 (Coremail) with SMTP id DcCowACHjWFwJ7FewbJHAg--.462S2;
 Tue, 05 May 2020 16:44:33 +0800 (CST)
To: Viresh Kumar <viresh.kumar@linaro.org>, Cyril Hrubis <chrubis@suse.cz>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
 <e666a91d-1ffd-0f5f-131e-966ff763b14e@163.com>
 <20200505032803.s6axol3sfyyzl6ag@vireshk-i7>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <de7e8921-d9cb-0f59-26c2-068e8fdaac7b@163.com>
Date: Tue, 5 May 2020 16:44:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200505032803.s6axol3sfyyzl6ag@vireshk-i7>
Content-Language: en-US
X-CM-TRANSID: DcCowACHjWFwJ7FewbJHAg--.462S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCry7AryDtF1kXrWkWrWkCrg_yoWrGFy8pF
 s3J3W2kFWUJrZ7Gw4Skw47tF10yw18Cry5Xrn8Jry8XFn0vr9aqrWYgF1rCFW5GrWUtryI
 vrWUJry3J34UAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b8wZ7UUUUU=
X-Originating-IP: [223.64.143.32]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0hobXlUMV4tOTAAAsK
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gNS81LzIwIDExOjI4IEFNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gT24gMDQtMDUtMjAsIDE5
OjMxLCBYaWFvIFlhbmcgd3JvdGU6Cj4+IE9uIDUvNC8yMCAxOjA5IFBNLCBWaXJlc2ggS3VtYXIg
d3JvdGU6Cj4+PiBPbiAzMC0wNC0yMCwgMTY6NTcsIFhpYW8gWWFuZyB3cm90ZToKPj4+PiBwaWRm
ZF9vcGVuKDIpIHdpbGwgc2V0IGNsb3NlLW9uLWV4ZWMgZmxhZyBvbiB0aGUgZmlsZSBkZXNjcmlw
dG9yIGFzIGl0Cj4+Pj4gbWFucGFnZSBzdGF0ZXMsIHNvIGNoZWNrIGNsb3NlLW9uLWV4ZWMgZmxh
ZyBieSBmY250bCgyKS4KPj4+Pgo+Pj4+IEFsc28gYXZvaWQgY29tcGlsZXIgd2FybmluZyBieSBy
ZXBsYWNpbmcgKGxvbmcpIFRTVF9SRVQgd2l0aCAoaW50KSBwaWRmZDoKPj4+PiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gcGlkZmRfb3BlbjAxLmM6OToKPj4+PiBwaWRmZF9vcGVuMDEuYzogSW4g
ZnVuY3Rpb24g4oCYcnVu4oCZOgo+Pj4+IC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDo3
Njo0MTogd2FybmluZzogZm9ybWF0IOKAmCVp4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDi
gJhpbnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBlIOKAmGxvbmcgaW504oCZIFstV2Zvcm1h
dD1dCj4+Pj4gICAgICA3NiB8ICAgdHN0X2Jya18oX19GSUxFX18sIF9fTElORV9fLCAodHR5cGUp
LCAoYXJnX2ZtdCksICMjX19WQV9BUkdTX18pO1wKPj4+PiAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgo+Pj4+IC4uLy4uLy4uLy4uL2lu
Y2x1ZGUvdHN0X3NhZmVfbWFjcm9zLmg6MjI0OjU6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJh0c3RfYnJr4oCZCj4+Pj4gICAgIDIyNCB8ICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5P
LCAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICAgICAgICAgfCAgICAgXn5+fn5+fgo+
Pj4+IHBpZGZkX29wZW4wMS5jOjIwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhT
QUZFX0ZDTlRM4oCZCj4+Pj4gICAgICAyMCB8ICBmbGFnID0gU0FGRV9GQ05UTChUU1RfUkVULCBG
X0dFVEZEKTsKPj4+IFRoaXMgbG9nIGlzbid0IHVzZWZ1bCBhcyB0aGUgd2FybmluZyBzdGFydGVk
IGNvbWluZyBhZnRlciB5b3VyIGNoYW5nZQo+Pj4gb25seSBhbmQgbm90IGJlZm9yZS4KPj4gSGkg
VmlyZXNoLAo+Pgo+PiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lgo+Pgo+PiBSaWdodO+8jGp1c3Qg
YWRkIGEgaGludCB3aHkgSSB1c2UgcGlkZmQgaW5zdGVhZCBzbyBJIHdhbnQgdG8ga2VlcCBpdC4K
Pj4KPj4gT2YgY291cnNl77yMSSB3aWxsIG1lbnRpb24gdGhhdCBteSBjaGFuZ2UgaW50cm9kdWNl
cyB0aGUgY29tcGlsZXIgd2FybmluZyBpbgo+PiB2MiBwYXRjaC4KPiBFdmVuIHRoYXQgaXNuJ3Qg
cmVxdWlyZWQgcmVhbGx5LiBZb3UgY2FuIGFkZCBhIHZhcmlhYmxlIGlmIHlvdSBsaWtlLgoKSGkg
VmlyZXNoLAoKVGhhbmtzIGEgbG90IGZvciB5b3VyIHJldmlldy4KCkkgcHJlZmVyIHRvIGtlZXAg
aXQgOi0pLgoKPgo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWGlhbyBZYW5nIDx5YW5neC5q
eUBjbi5mdWppdHN1LmNvbT4KPj4+PiAtLS0KPj4+PiAgICAuLi4va2VybmVsL3N5c2NhbGxzL3Bp
ZGZkX29wZW4vcGlkZmRfb3BlbjAxLmMgIHwgMTggKysrKysrKysrKysrKystLS0tCj4+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZk
X29wZW4wMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29w
ZW4wMS5jCj4+Pj4gaW5kZXggOTNiYjg2Njg3Li4yOTNlOTNiNjMgMTAwNjQ0Cj4+Pj4gLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4+Pj4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5j
Cj4+Pj4gQEAgLTYsMTcgKzYsMjcgQEAKPj4+PiAgICAgKiBCYXNpYyBwaWRmZF9vcGVuKCkgdGVz
dCwgZmV0Y2hlcyB0aGUgUElEIG9mIHRoZSBjdXJyZW50IHByb2Nlc3MgYW5kIHRyaWVzIHRvCj4+
Pj4gICAgICogZ2V0IGl0cyBmaWxlIGRlc2NyaXB0b3IuCj4+Pj4gICAgICovCj4+Pj4gKwo+Pj4+
ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4+Pj4gKyNpbmNsdWRlIDx1bmlzdGQuaD4KPj4+PiAr
I2luY2x1ZGUgPGZjbnRsLmg+Cj4+Pj4gICAgI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4+Pj4gICAg
I2luY2x1ZGUgImxhcGkvcGlkZmRfb3Blbi5oIgo+Pj4+ICAgIHN0YXRpYyB2b2lkIHJ1bih2b2lk
KQo+Pj4+ICAgIHsKPj4+PiAtCVRFU1QocGlkZmRfb3BlbihnZXRwaWQoKSwgMCkpOwo+Pj4+ICsJ
aW50IHBpZGZkID0gMCwgZmxhZyA9IDA7Cj4+PiBOb25lIG9mIHRoZXNlIG5lZWQgdG8gYmUgaW5p
dGlhbGl6ZWQuCj4+IEluaXRpYWxpemF0aW9uIG9yIG5vdCBpbml0aWFsaXphdGlvbiBhcmUgYm90
aCBmaW5lIGZvciBtZS4KPj4KPj4gRG8geW91IGhhdmUgYW55IHN0cm9uZyByZWFzb24gdG8gZHJv
cCBJbml0aWFsaXphdGlvbj8KPiBJbml0aWFsaXphdGlvbnMgYXJlIG9ubHkgcmVxdWlyZWQgaWYg
dGhlcmUgaXMgYSBjaGFuY2Ugb2YgdGhlIHZhcmlhYmxlCj4gZ2V0dGluZyB1c2VkIHdpdGhvdXQg
YmVpbmcgaW5pdGlhbGl6ZWQsIHdoaWNoIGlzbid0IHRoZSBjYXNlIGhlcmUuCj4gV2hhdGV2ZXIg
dmFsdWUgeW91IHNldCB0byB0aGVzZSB2YXJpYWJsZXMsIHRoZXkgd2lsbCBnZXQgb3ZlcndyaXR0
ZW4KPiBhbnl3YXkuCgpSaWdodCwgdGhleSB3aWxsIGdldCBvdmVyd3JpdHRlbiBhbnl3YXkuCgpB
cyBteSBwcmV2aW91cyByZXBseSBzYWlkLCBlaXRoZXIgb2YgdGhlbSBpcyBPSyBmb3IgbWUgc28g
SSBjYW4gZHJvcCAKaW5pdGlhbGl6YXRpb25zIGFzIHlvdSBzdWdnZXN0ZWQuCgo+Cj4+Pj4gKwo+
Pj4+ICsJcGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAwKTsKPj4+PiArCWlmIChwaWRmZCA9
PSAtMSkKPj4+PiArCQl0c3RfYnJrKFRGQUlMIHwgVEVSUk5PLCAicGlkZmRfb3BlbihnZXRwaWQo
KSwgMCkgZmFpbGVkIik7Cj4+PiBUaGlzIGNvdWxkIGhhdmUgYmVlbiB3cml0dGVuIGFzOgo+Pj4g
ICAgICAgICAgIFRFU1QocGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSk7Cj4+IFdoeSBk
byB5b3Ugd2FudCB0byBrZWVwIFRFU1QoKT8gSSBkb24ndCB0aGluayBpdCBpcyBuZWNlc3Nhcnk6
Cj4+Cj4+IDEpIHBpZGZkIGFuZCBURVJSTk8gYXJlIGVub3VnaCB0byBjaGVjayByZXR1cm4gdmFs
dWUgYW5kIGVycm5vLgo+Pgo+PiAyKSBJdCBpcyBPSyBmb3IgdGVzdGNhc2UgdG8gbm90IHVzZSBU
RVNUKCkuCj4gQXMgZmFyIGFzIEkgaGF2ZSB1bmRlcnN0b29kLCB0aGF0IGlzIHRoZSBwcmVmZXJy
ZWQgd2F5IG9mIGRvaW5nIGl0Cj4gZnJvbSBMVFAgbWFpbnRhaW5lcnMuCj4KPiBPdmVyIHRoYXQg
aXQgd2FzIGFscmVhZHkgdGhlcmUsIHdoeSByZW1vdmUgaXQgbm93ID8gSnVzdCBmaXggdGhlCj4g
cHJvYmxlbXMgeW91IGFyZSB0cnlpbmcgdG8gZml4IGFuZCB0aGF0IHNob3VsZCBiZSBnb29kLgoK
SGkgQ3lyaWwsCgpURVNUKCkgc2VlbXMgc3VycGx1cyBhZnRlciBteSBjaGFuZ2Ugc28gSSB3YW50
IHRvIHJlbW92ZSBpdCBkaXJlY3RseS4KCkkgd29uZGVyIGlmIGl0IGlzIG5lY2Vzc2FyeSB0byBr
ZWVwIFRFU1QoKT8KClRoYW5rcywKClhpYW8gWWFuZwoKPgoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
