Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F6395B92
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:20:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B4F23C80A5
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:20:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 227B23C187D
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:20:25 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9A66560071A
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:20:24 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B03039FB67;
 Mon, 31 May 2021 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1622467222; bh=5X1tCPinewkcngfQIGcU44+Qy0gbFUrmly+/mu5M72Q=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=hKG7d+rfvxqYlWuGmlGa9qWECzljD3rMNKG8N3NFYcUB+O0njrGrL54ZsFUI96JPP
 rljQmEMCO3Jt9BXEZlcMfmP/inWPHyd3qc2SeOtl/LqS/IdCkIQZaWRc3qGw2y/QB1
 AGv0d19B9PzOBN6+tzmHHZT9mLhgpWjMY6EyGtss=
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com> <YLTbXU1ZF4ZiXKdt@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20f87781-e66d-e8c6-1ac5-de208667a7f2@jv-coder.de>
Date: Mon, 31 May 2021 15:20:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLTbXU1ZF4ZiXKdt@yuki>
Content-Language: en-US
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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

SGksCgpPbiA1LzMxLzIwMjEgMjo0OSBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IEhpIQo+PiAg
IGxpYi9uZXdsaWJfdGVzdHMvc2hlbGwvdGVzdF90aW1lb3V0LnNoIHwgMiArLQo+PiAgIGxpYi9u
ZXdsaWJfdGVzdHMvc2hlbGwvdGltZW91dDAzLnNoICAgIHwgMSArCj4+ICAgdGVzdGNhc2VzL2xp
Yi90c3RfdGVzdC5zaCAgICAgICAgICAgICAgfCA5ICsrKysrLS0tLQo+PiAgIDMgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
bGliL25ld2xpYl90ZXN0cy9zaGVsbC90ZXN0X3RpbWVvdXQuc2ggYi9saWIvbmV3bGliX3Rlc3Rz
L3NoZWxsL3Rlc3RfdGltZW91dC5zaAo+PiBpbmRleCBiMDU2ODBjYjEuLjlmMzFhZmEzMiAxMDA3
NTUKPj4gLS0tIGEvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90ZXN0X3RpbWVvdXQuc2gKPj4gKysr
IGIvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90ZXN0X3RpbWVvdXQuc2gKPj4gQEAgLTI4LDcgKzI4
LDcgQEAgdGltZW91dDAyLnNofCAgLTEwfDB8ICB8Mgo+PiAgIHRpbWVvdXQwMi5zaHwgLTAuMXww
fCAgfDAKPj4gICB0aW1lb3V0MDIuc2h8IC0xLjF8MHwgIHwyCj4+ICAgdGltZW91dDAyLnNofC0x
MC4xfDB8ICB8Mgo+PiAtdGltZW91dDAzLnNofCAgICAgfDB8MTJ8MTM3fCB8IHwgfFRlc3Qga2ls
bCBpZiB0ZXN0IGRvZXMgbm90IHRlcm1pbmF0ZSBieSBTSUdJTlQKPj4gK3RpbWVvdXQwMy5zaHwg
ICAgIHwwfDEyfDEzN3wgfCB8IHxUZXN0IGtpbGwgaWYgdGVzdCBkb2VzIG5vdCB0ZXJtaW5hdGUg
YnkgU0lHVEVSTQo+PiAgIHRpbWVvdXQwNC5zaHwgICAgIHwwfCAgfCAgMnwwfDB8MXxWZXJpZnkg
dGhhdCB0aW1lb3V0IGlzIGVuZm9yY2VkCj4+ICAgdGltZW91dDAyLnNofCAgICAyfDF8IDJ8ICAg
fDF8MHwwfFRlc3QgdGVybWluYXRpb24gb2YgdGltZW91dCBwcm9jZXNzCj4+ICAgIgo+PiBkaWZm
IC0tZ2l0IGEvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90aW1lb3V0MDMuc2ggYi9saWIvbmV3bGli
X3Rlc3RzL3NoZWxsL3RpbWVvdXQwMy5zaAo+PiBpbmRleCBjZDU0OGQ5YTIuLjEyNGU5NmE4NCAx
MDA3NTUKPj4gLS0tIGEvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90aW1lb3V0MDMuc2gKPj4gKysr
IGIvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90aW1lb3V0MDMuc2gKPj4gQEAgLTMwLDYgKzMwLDcg
QEAgVFNUX1RJTUVPVVQ9MQo+PiAgIAo+PiAgIGRvX3Rlc3QoKQo+PiAgIHsKPj4gKwl0cmFwICJ0
c3RfcmVzIFRJTkZPICdTb3JyeSwgdGltZW91dDAzIGlzIHN0aWxsIGFsaXZlJyIgVEVSTQo+PiAg
IAl0c3RfcmVzIFRJTkZPICJ0ZXN0aW5nIGtpbGxpbmcgdGVzdCBhZnRlciBUU1RfVElNRU9VVCIK
Pj4gICAKPj4gICAJc2xlZXAgMgo+PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfdGVz
dC5zaCBiL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2gKPj4gaW5kZXggM2E1NjUxYzAxLi42NmZm
ZGU0ZWIgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2gKPj4gKysrIGIv
dGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaAo+PiBAQCAtMjEsNyArMjEsOCBAQCBleHBvcnQgVFNU
X0xJQl9MT0FERUQ9MQo+PiAgIC4gdHN0X3NlY3VyaXR5LnNoCj4+ICAgCj4+ICAgIyBkZWZhdWx0
IHRyYXAgZnVuY3Rpb24KPj4gLXRyYXAgInRzdF9icmsgVEJST0sgJ3Rlc3QgaW50ZXJydXB0ZWQg
b3IgdGltZWQgb3V0JyIgSU5UCj4+ICt0cmFwICJ0c3RfYnJrIFRCUk9LICd0ZXN0IGludGVycnVw
dGVkJyIgSU5UCj4+ICt0cmFwICJ1bnNldCBfdHN0X3NldHVwX3RpbWVyX3BpZDsgdHN0X2JyayBU
QlJPSyAndGVzdCB0ZXJtaW5hdGVkJyIgVEVSTQo+IEkndmUgYmVlbiBsb29raW5nIGF0IHRoaXMg
Zm9yIGEgd2hpbGUgYW5kIEkgdGhpbmsgdGhhdCB3ZSBzaG91bGQgdW5zZXQKPiB0aGUgX3RzdF9z
ZXR1cF90aW1lcl9waWQgYXQgdGhlIGVuZCBvZiB0aGUgX3RzdF90aW1lb3V0X3Byb2Nlc3MoKQo+
IGluc3RlYWQsIHJpZ2h0PwpUaGF0IHdvbid0IHdvcmsgb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGlu
Zz8gOykgV2UgYXJlIGluIGEgc3Vic2hlbGwgaW4gCl90c3RfdGltZW91dF9wcm9jZXNzLCBpdCBj
YW5ub3QgbWFuaXB1bGF0ZSB0aGUgZW52aXJvbm1lbnQgb2YgdGhlIHBhcmVudCAKb3IgaXMgbXkg
bWVudGFsIG1vZGFsIG9mIGhvdyBzaGVsbCB3b3JrcyB3cm9uZyBhZ2Fpbj8uCj4gT3RoZXJ3aXNl
IHdlIHdpbGwgbGVhdmUgdGhlIHRpbWVvdXQgcHJvY2VzcyBzbGVlcGluZyBpZiBzb21lb25lIHNl
bmRzCj4gU0lHVEVSTSB0byB0aGUgdGVzdCBwcm9jZXNzIGZyb20gdGhlIG91dHNpZGUsIG9yIGRv
IEkgbWlzcyBzb21ldGhpbmc/ClllcywgdGhhdCBpcyBvbmUgb2YgdGhlIHJlYXNvbnMgd2h5IEkg
aW5pdGlhbGx5IHN1Z2dlc3RlZCBhIGRpZmZlcmVudCAKc2lnbmFsIGZvciB0aW1lb3V0LiBUaGF0
IHdvdWxkIGNsZWFubHkgc2VwYXJhdGUgdGhlIGxvZ2ljLgpCdXQgb24gdGhlIG90aGVyIGhhbmQg
d2hlbiB3aWxsIFNJR1RFUk0gYmUgc2VudCBmcm9tIHRoZSBvdXRzaWRlPyBUaGlzIAppcyBwcm9i
YWJseSBvbmx5IGhhcHBlbmluZyBvbiBzaHV0ZG93bj8gSW4gdGhhdCBjYXNlIGl0IGlzIG5vdCBy
ZWFsbHkgYSAKcHJvYmxlbS4KSWYgc29tZW9uZSB3YW50cyB0byB0ZXJtaW5hdGUgZ3JhY2VmdWxs
eSB1c2luZyBTSUdURVJNLCBoZSBjb3VsZCBzZW5kIGl0IAp0byB0aGUgcHJvY2VzcyBncm91cC4g
VGhhdCB3b3VsZCBraWxsIHRoZSB0aW1lb3V0IHByb2Nlc3MgYXMgd2VsbC4KCkrDtnJnCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
