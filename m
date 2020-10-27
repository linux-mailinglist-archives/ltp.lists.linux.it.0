Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D4729AA04
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 11:51:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 802F13C5A3D
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 11:51:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 64EE73C30F7
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 11:51:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 83D91600CF6
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 11:51:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1135AF19;
 Tue, 27 Oct 2020 10:51:01 +0000 (UTC)
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-6-mdoucha@suse.cz> <5F97F205.8020602@cn.fujitsu.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <2c5270b6-bff3-fac6-4d3f-f83c608a6d8b@suse.cz>
Date: Tue, 27 Oct 2020 11:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5F97F205.8020602@cn.fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 05/19] Unify error handling in lib/safe_macros.c
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjcuIDEwLiAyMCAxMToxMCwgWWFuZyBYdSB3cm90ZToKPiBIaSBNYXJ0aW4KPj4gLSBQcm9w
ZXJseSBmb3JtYXQgY2FsbGVyIGZpbGU6bGluZSBsb2NhdGlvbgo+PiAtIFBlZGFudGljYWxseSBj
aGVjayBpbnZhbGlkIHN5c2NhbGwgcmV0dXJuIHZhbHVlcwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJ0aW4gRG91Y2hhPG1kb3VjaGFAc3VzZS5jej4KPj4gLS0tCj4+IMKgIGxpYi9zYWZlX21hY3Jv
cy5jIHwgNjAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDM4NCBpbnNlcnRpb25zKCspLCAyMTggZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9saWIvc2FmZV9tYWNyb3MuYyBiL2xpYi9zYWZlX21hY3Jvcy5j
Cj4+IGluZGV4IDRmNDhkNzUyOS4uZjVlODBmYzQ4IDEwMDY0NAo+PiAtLS0gYS9saWIvc2FmZV9t
YWNyb3MuYwo+PiArKysgYi9saWIvc2FmZV9tYWNyb3MuYwo+IAo+Pgo+Pgo+PiDCoMKgwqDCoMKg
IHJldHVybiBydmFsOwo+PiBAQCAtMjU1LDEwICsyODgsMTYgQEAgc3NpemVfdCBzYWZlX3JlYWQo
Y29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50Cj4+IGxpbmVubywgdm9pZCAoKmNsZWFudXBfZm4p
ICh2b2lkKSwKPj4gwqDCoMKgwqDCoCBzc2l6ZV90IHJ2YWw7Cj4+Cj4+IMKgwqDCoMKgwqAgcnZh
bCA9IHJlYWQoZmlsZGVzLCBidWYsIG5ieXRlKTsKPj4gKwo+PiDCoMKgwqDCoMKgIGlmIChydmFs
ID09IC0xIHx8IChsZW5fc3RyaWN0JibCoCAoc2l6ZV90KXJ2YWwgIT0gbmJ5dGUpKSB7Cj4+IC3C
oMKgwqDCoMKgwqDCoCB0c3RfYnJrbShUQlJPSyB8IFRFUlJOTywgY2xlYW51cF9mbiwKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXM6JWQ6IHJlYWQoJWQsJXAsJXp1KSBmYWlsZWQsIHJl
dHVybmVkICV6ZCIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZSwgbGluZW5vLCBm
aWxkZXMsIGJ1ZiwgbmJ5dGUsIHJ2YWwpOwo+PiArwqDCoMKgwqDCoMKgwqAgdHN0X2Jya21fKGZp
bGUsIGxpbmVubywgVEJST0sgfCBURVJSTk8sIGNsZWFudXBfZm4sCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJyZWFkKCVkLCVwLCV6dSkgZmFpbGVkLCByZXR1cm5lZCAlemQiLCBmaWxkZXMs
IGJ1ZiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmJ5dGUsIHJ2YWwpOwo+PiArwqDCoMKg
IH0KPj4gK8KgwqDCoCBpZiAocnZhbDzCoCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCB0c3RfYnJr
bV8oZmlsZSwgbGluZW5vLCBUQlJPSyB8IFRFUlJOTywgY2xlYW51cF9mbiwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIkludmFsaWQgcmVhZCglZCwlcCwlenUpIHJldHVybiB2YWx1ZSAlemQi
LCBmaWxkZXMsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZiwgbmJ5dGUsIHJ2YWwpOwo+
PiDCoMKgwqDCoMKgIH0KPiBIZXJlIGhhcyBwcm9ibGVtLi4gTWF5YmUgd2UgY2FuwqAgdXNlIHNp
bXBsZQo+IGlmIChydmFsIDwgMCB8fCAobGVuX3N0cmljdCYmwqAgKHNpemVfdClydmFsICE9IG5i
eXRlKSkgdG8gcmVwbGFjZS4KCk5vLCB0aGlzIGlzIGNvcnJlY3QgZXhjZXB0IGZvciB0aGUgbWlz
c2luZyAiZWxzZSIgYWdhaW4uIHJ2YWwgPCAtMSBpcwppbnZhbGlkIGFuZCBydmFsID09IC0xIHdp
bGwgYmUgY292ZXJlZCBieSB0aGUgZmlyc3QgaWYoKSBicmFuY2guCgo+Pgo+PiDCoMKgwqDCoMKg
IHJldHVybiBydmFsOwo+IAo+PiDCoMKgwqDCoMKgIHJldHVybiBydmFsOwo+PiBAQCAtNDUyLDEw
ICs1MzAsMTQgQEAgc3NpemVfdCBzYWZlX3dyaXRlKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGlu
dAo+PiBsaW5lbm8sIHZvaWQgKGNsZWFudXBfZm4pICh2b2lkKSwKPj4gwqDCoMKgwqDCoCBzc2l6
ZV90IHJ2YWw7Cj4+Cj4+IMKgwqDCoMKgwqAgcnZhbCA9IHdyaXRlKGZpbGRlcywgYnVmLCBuYnl0
ZSk7Cj4+ICsKPj4gwqDCoMKgwqDCoCBpZiAocnZhbCA9PSAtMSB8fCAobGVuX3N0cmljdCYmwqAg
KHNpemVfdClydmFsICE9IG5ieXRlKSkgewo+PiAtwqDCoMKgwqDCoMKgwqAgdHN0X2Jya20oVEJS
T0sgfCBURVJSTk8sIGNsZWFudXBfZm4sCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVz
OiVkOiB3cml0ZSglZCwlcCwlenUpIGZhaWxlZCIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmaWxlLCBsaW5lbm8sIGZpbGRlcywgYnVmLCBydmFsKTsKPj4gK8KgwqDCoMKg
wqDCoMKgIHRzdF9icmttXyhmaWxlLCBsaW5lbm8sIFRCUk9LIHwgVEVSUk5PLCBjbGVhbnVwX2Zu
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAid3JpdGUoJWQsJXAsJXp1KSBmYWlsZWQiLCBm
aWxkZXMsIGJ1ZiwgbmJ5dGUpOwo+PiArwqDCoMKgIH0gZWxzZSBpZiAocnZhbDzCoCAwKSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoCB0c3RfYnJrbV8oZmlsZSwgbGluZW5vLCBUQlJPSyB8IFRFUlJOTywg
Y2xlYW51cF9mbiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkludmFsaWQgd3JpdGUoJWQs
JXAsJXp1KSByZXR1cm4gdmFsdWUgJXpkIiwgZmlsZGVzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBidWYsIG5ieXRlLCBydmFsKTsKPj4gwqDCoMKgwqDCoCB9Cj4gSSBwcmVmZXIgdG8gdXNl
ICJpZiAocnZhbCA8IDAgfHwgKGxlbl9zdHJpY3QmJsKgIChzaXplX3QpcnZhbCAhPSBuYnl0ZSki
CgpUaGlzIGlzIGNvcnJlY3QgYXMgaXMuIHJ2YWwgPCAtMSBpcyBpbnZhbGlkLgoKPj4KPiAKPj4g
wqDCoMKgwqDCoCB9Cj4+Cj4+IEBAIC01MzAsMjAgKzYxMiwxOSBAQCBsb25nIHNhZmVfc3lzY29u
Zihjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQKPj4gbGluZW5vLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHZvaWQgKGNsZWFudXBfZm4pICh2b2lkKSwgaW50IG5hbWUpCj4+IMKgIHsKPj4g
wqDCoMKgwqDCoCBsb25nIHJ2YWw7Cj4+IC3CoMKgwqAgZXJybm8gPSAwOwo+Pgo+PiArwqDCoMKg
IGVycm5vID0gMDsKPiBJdCBsb29rcyBubyBjaGFuZ2UuCgpUaGVyZSdzIHdoaXRlc3BhY2UgY2hh
bmdlIGJlY2F1c2UgY2hlY2twYXRjaC5wbCB3YXMgY29tcGxhaW5pbmcuCgpJJ2xsIHJlc3VibWl0
IHYyIGZvciBwYXRjaGVzIDIsIDMgYW5kIDUgYWZ0ZXIgdGhlIHJlc3Qgb2YgdGhpcyBwYXRjaHNl
dApnZXRzIHB1c2hlZC4gVGhlc2UgdGhyZWUgcGF0Y2hlcyBhcmUgbm90IGJsb2NraW5nIGFueXRo
aW5nIGVsc2UuCgotLSAKTWFydGluIERvdWNoYSAgIG1kb3VjaGFAc3VzZS5jegpRQSBFbmdpbmVl
ciBmb3IgU29mdHdhcmUgTWFpbnRlbmFuY2UKU1VTRSBMSU5VWCwgcy5yLm8uCkNPUlNPIElJYQpL
cml6aWtvdmEgMTQ4LzM0CjE4NiAwMCBQcmFndWUgOApDemVjaCBSZXB1YmxpYwoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
