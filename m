Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D049E3887BE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 08:44:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 897593C2B12
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 08:44:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18C1B3C0BCB
 for <ltp@lists.linux.it>; Wed, 19 May 2021 08:44:20 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8376660035C
 for <ltp@lists.linux.it>; Wed, 19 May 2021 08:44:19 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 189E19F72D;
 Wed, 19 May 2021 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621406658; bh=M5Syq/4B9Du9nvUyNmnRvUK1hqW4pC1TectYgSQU+Bo=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=kKmas79cVYm0G/GiL0IP8tAwzzkSWvOL4YeWkEMF6eDHqsME2RaZdML8OPlyU9Xiz
 U8kZ25XSb4S1avTALlelBusASDRucFD1Gyt3PplYVl8u2ZAQKm9zhdIWba5dNiDrR/
 OnJEmwSToLWu0t0ykOrxXRnousno332nG6ZCmM0Y=
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <d70f9e5f-0008-02aa-e099-2a8243c4b3fa@jv-coder.de>
Date: Wed, 19 May 2021 08:46:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518122610.17171-2-liwang@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgoKT24gNS8xOC8yMDIxIDI6MjYgUE0sIExpIFdhbmcgd3JvdGU6Cgo+IENvLWF1dGhv
cmVkLWJ5OiBKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+ClBsZWFzZSB1c2UgSm9lcmcg
VmVobG93IDxqb2VyZy52ZWhsb3dAYW94LXRlY2guZGU+IGhlcmUsIHRoYW5rcy4KPiBTaWduZWQt
b2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGxpYi9uZXdsaWJf
dGVzdHMvc2hlbGwvdGVzdF90aW1lb3V0LnNoIHwgMiArLQo+ICAgbGliL25ld2xpYl90ZXN0cy9z
aGVsbC90aW1lb3V0MDMuc2ggICAgfCAxICsKPiAgIHRlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2gg
ICAgICAgICAgICAgIHwgOSArKysrKy0tLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9uZXdsaWJfdGVzdHMv
c2hlbGwvdGVzdF90aW1lb3V0LnNoIGIvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90ZXN0X3RpbWVv
dXQuc2gKPiBpbmRleCBiMDU2ODBjYjEuLjlmMzFhZmEzMiAxMDA3NTUKPiAtLS0gYS9saWIvbmV3
bGliX3Rlc3RzL3NoZWxsL3Rlc3RfdGltZW91dC5zaAo+ICsrKyBiL2xpYi9uZXdsaWJfdGVzdHMv
c2hlbGwvdGVzdF90aW1lb3V0LnNoCj4gQEAgLTI4LDcgKzI4LDcgQEAgdGltZW91dDAyLnNofCAg
LTEwfDB8ICB8Mgo+ICAgdGltZW91dDAyLnNofCAtMC4xfDB8ICB8MAo+ICAgdGltZW91dDAyLnNo
fCAtMS4xfDB8ICB8Mgo+ICAgdGltZW91dDAyLnNofC0xMC4xfDB8ICB8Mgo+IC10aW1lb3V0MDMu
c2h8ICAgICB8MHwxMnwxMzd8IHwgfCB8VGVzdCBraWxsIGlmIHRlc3QgZG9lcyBub3QgdGVybWlu
YXRlIGJ5IFNJR0lOVAo+ICt0aW1lb3V0MDMuc2h8ICAgICB8MHwxMnwxMzd8IHwgfCB8VGVzdCBr
aWxsIGlmIHRlc3QgZG9lcyBub3QgdGVybWluYXRlIGJ5IFNJR1RFUk0KV2hvYSB3aGF0IGRpZCBJ
IHdyaXRlIHRoZXJlLCB0aGF0J3MgaGFyZCB0byByZWFkIDopCldoaWxlIHlvdSdyZSBhdCBpdCwg
Y2FuIHlvdSBwbGVhc2UgY2hhbmdlIHRoaXMgdG8gIlRlc3QgaXMga2lsbGVkLCBpZiBpdCAKZG9l
cyBub3QgdGVybWluYXRlIGFmdGVyIFNJR1RFUk0iCj4gICB0aW1lb3V0MDQuc2h8ICAgICB8MHwg
IHwgIDJ8MHwwfDF8VmVyaWZ5IHRoYXQgdGltZW91dCBpcyBlbmZvcmNlZAo+ICAgdGltZW91dDAy
LnNofCAgICAyfDF8IDJ8ICAgfDF8MHwwfFRlc3QgdGVybWluYXRpb24gb2YgdGltZW91dCBwcm9j
ZXNzCj4gICAiCj4gZGlmZiAtLWdpdCBhL2xpYi9uZXdsaWJfdGVzdHMvc2hlbGwvdGltZW91dDAz
LnNoIGIvbGliL25ld2xpYl90ZXN0cy9zaGVsbC90aW1lb3V0MDMuc2gKQXQgdGhlIHRvcCBvZiB0
aGlzIGZpbGUsIHRoZXJlIGlzIGEgY29tbWVudCB3aXRoIHRoZSBleHBlY3RlZCBvdXRwdXQsIAp0
aGF0IHNob3VsZCBiZSBjb3JyZWN0ZWQKPiBpbmRleCBjZDU0OGQ5YTIuLjEyNGU5NmE4NCAxMDA3
NTUKPiAtLS0gYS9saWIvbmV3bGliX3Rlc3RzL3NoZWxsL3RpbWVvdXQwMy5zaAo+ICsrKyBiL2xp
Yi9uZXdsaWJfdGVzdHMvc2hlbGwvdGltZW91dDAzLnNoCj4gQEAgLTMwLDYgKzMwLDcgQEAgVFNU
X1RJTUVPVVQ9MQo+ICAgCj4gICBkb190ZXN0KCkKPiAgIHsKPiArCXRyYXAgInRzdF9yZXMgVElO
Rk8gJ1NvcnJ5LCB0aW1lb3V0MDMgaXMgc3RpbGwgYWxpdmUnIiBURVJNCldlIGRvbid0IG5lZWQg
dGhpcy4KPiAgIAl0c3RfcmVzIFRJTkZPICJ0ZXN0aW5nIGtpbGxpbmcgdGVzdCBhZnRlciBUU1Rf
VElNRU9VVCIKPiAgIAo+ICAgCXNsZWVwIDIKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi90
c3RfdGVzdC5zaCBiL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2gKPiBpbmRleCAzYTU2NTFjMDEu
LjY2ZmZkZTRlYiAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMvbGliL3RzdF90ZXN0LnNoCj4gKysr
IGIvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaAo+IEBAIC0yMSw3ICsyMSw4IEBAIGV4cG9ydCBU
U1RfTElCX0xPQURFRD0xCj4gICAuIHRzdF9zZWN1cml0eS5zaAo+ICAgCj4gICAjIGRlZmF1bHQg
dHJhcCBmdW5jdGlvbgo+IC10cmFwICJ0c3RfYnJrIFRCUk9LICd0ZXN0IGludGVycnVwdGVkIG9y
IHRpbWVkIG91dCciIElOVAo+ICt0cmFwICJ0c3RfYnJrIFRCUk9LICd0ZXN0IGludGVycnVwdGVk
JyIgSU5UCj4gK3RyYXAgInVuc2V0IF90c3Rfc2V0dXBfdGltZXJfcGlkOyB0c3RfYnJrIFRCUk9L
ICd0ZXN0IHRlcm1pbmF0ZWQnIiBURVJNCj4gICAKPiAgIF90c3RfZG9fZXhpdCgpCj4gICB7Cj4g
QEAgLTQzOSw5ICs0NDAsOSBAQCBfdHN0X2tpbGxfdGVzdCgpCj4gICB7Cj4gICAJbG9jYWwgaT0x
MAo+ICAgCj4gLQl0cmFwICcnIElOVAo+IC0JdHN0X3JlcyBUQlJPSyAiVGVzdCB0aW1lb3V0ZWQs
IHNlbmRpbmcgU0lHSU5UISBJZiB5b3UgYXJlIHJ1bm5pbmcgb24gc2xvdyBtYWNoaW5lLCB0cnkg
ZXhwb3J0aW5nIExUUF9USU1FT1VUX01VTCA+IDEiCj4gLQlraWxsIC1JTlQgLSRwaWQKPiArCXRy
YXAgJycgVEVSTQo+ICsJdHN0X3JlcyBUQlJPSyAiVGVzdCB0aW1lZCBvdXQsIHNlbmRpbmcgU0lH
VEVSTSEgSWYgeW91IGFyZSBydW5uaW5nIG9uIHNsb3cgbWFjaGluZSwgdHJ5IGV4cG9ydGluZyBM
VFBfVElNRU9VVF9NVUwgPiAxIgo+ICsJa2lsbCAtVEVSTSAtJHBpZApUaGlzIHdvcmtzIGZpbmUu
CitSZXZpZXdlZC1ieTogSm9lcmcgVmVobG93IDxqb2VyZy52ZWhsb3dAYW94LXRlY2guZGU+CmFm
dGVyIG15IHJlbWFya3MgYXJlIHJlc29sdmVkLgoKQnV0IG9uZSBtb3JlIHN0cmFuZ2UgdGhpbmcg
aGVyZS4KSSB3b25kZXIgd2h5IHRoaXMgZXZlbiB3b3Jrcy4gJHBpZCBpcyB1c2VkIGluIF90c3Rf
a2lsbF90ZXN0IGFuZCBkZWZpbmVkIAppbiBfdHN0X3NldHVwX3RpbWVyIGFzIGEgbG9jYWwgdmFy
aWFibGUuCkl0IGxvb2tzIGxpa2UgaXQgaXMgaW5oZXJpdGVkIHRocm91Z2ggdGhlIGNhbGwgY2hh
aW4gYW5kIHNpbmNlIGl0IGlzIApjb3BpZWQgdG8gdGhlIGJhY2tncm91bmQgcHJvY2VzcywgaXQg
Y2Fubm90IGJlIG1hbmlwdWxhdGVkIGJ5IHRoZSB0ZXN0cy4KU3RpbGwgSSB3b3VsZCB2b3RlIGZv
ciBjaGFuZ2luZyB0aGlzIGF0IHNvbWUgcG9pbnQsIGJlY2F1c2UgaXQgaXMgaGlnaGx5IApjb25m
dXNpbmcuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
