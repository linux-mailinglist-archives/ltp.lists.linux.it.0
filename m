Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA53BE63F
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 12:16:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9976E3C6AD5
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 12:16:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 196993C6868
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 12:16:22 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7B31C20032C
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 12:16:21 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A8C389F7F3;
 Wed,  7 Jul 2021 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625652978; bh=KkZpLyeapr8QGJ/fm7asCnXlKy50qr6XB2ukhVJD3W0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=dR5BsVNbfkqXIpz8G6EYPhpusE6GJtw3kNWBFpd6zJT1xd+yXZg3ZPfF393Ckhw9n
 eQYs1SBQ2n0yDTgPYHQrAxDVR69sEP7GzB7O4esaN4W34OgMDwYhekjOiC+a5kNGOc
 ryEx6sHiGbi1o0nTRF5sgxOxL//yAbVLJ5y2taio=
To: rpalethorpe@suse.de
References: <20210707071838.27834-1-rpalethorpe@suse.com>
 <43e8b66b-04df-9c4f-c47b-aba13347b6d8@jv-coder.de>
 <6c665478-d831-9e3f-470c-8538a399e4f7@jv-coder.de> <87a6my788m.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c67e4bc2-3159-d61d-0307-38e83e50ea24@jv-coder.de>
Date: Wed, 7 Jul 2021 12:16:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87a6my788m.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] kill13, CVE-2018-10124: Reproduce INT_MIN negation
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

SGkgUmljaGFyZCwKCk9uIDcvNy8yMDIxIDEyOjAxIFBNLCBSaWNoYXJkIFBhbGV0aG9ycGUgd3Jv
dGU6Cj4gSGVsbG8gSm9lcmcsCj4KPiBKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdy
aXRlczoKPgo+PiBIaSwKPj4KPj4gT24gNy83LzIwMjEgMTA6MzUgQU0sIEpvZXJnIFZlaGxvdyB3
cm90ZToKPj4+IEhpIFJpY2hhcmQsCj4+Pgo+Pj4gT24gNy83LzIwMjEgOToxOCBBTSwgUmljaGFy
ZCBQYWxldGhvcnBlIHZpYSBsdHAgd3JvdGU6Cj4+PiBSZXN1bHRzIGluIElOVF9NSU4/IFdoYXQg
ZG9lcyB0aGlzIG1lYW4gb3IgZGlkIHlvdSBtZWFudCB0byB3cml0ZQo+Pj4gcmVzdWx0cyBpbiBF
U1JDSD8KPj4+IERlZmF1bHQgbmVnYXRpbmcgaW50IG1pbiBpbiB0d28ncyBjb21wbGVtZW50IHlp
ZWxkcyAwIChJTlRfTUlOID0KPj4+IGIxMDAwLi4uIGFuZCBuZWdhdGluZyBtZWFucyBpbnZlcnRp
bmcgdGhlIGZpcnN0IGJpdCAtPiB0aHVzIDApLgo+PiBOZXZlcm1pbmQuLi4gSnVzdCBjaGVja2Vk
LiBMb29rcyBsaWtlIHNvbWVob3cgeDg2IGtlZXBzIC1JTlRfTUlOLgo+PiBOb3cgSSBrbm93IHdo
YXQgeW91IG1lYW4gd2l0aCAicmVzdWx0cyBpbiBJTlRfTUlOIgo+Pgo+PiBKb2VyZwo+IEFjdHVh
bGx5IHRoaXMgc2VlbXMgdG8gYmUgZXhwZWN0ZWQgdW5sZXNzIHRoZSBDUFUgdGFrZXMgYWN0aW9u
IHRvIHBydmVudAo+IGl0LiBBcyB5b3UgaW52ZXJ0IGFsbCB0aGUgYml0cyB0aGVuIGFkZCBvbmUg
aW4gdHdvJ3MgY29tcGxlbWVudC4gU28KPiBpbnZlcnRpbmcgcmVzdWx0cyBpbiBJTlRfTUFYIHRo
ZW4gd2UgYWRkIG9uZSBhbmQgb3ZlcmZsb3cgYmFjayB0bwo+IElOVF9NSU4uCkFoaCB5ZXMgdG90
YWxseSBoYWQgdGhlIHdyb25nIG1vZGVsIG9mICogLTEgaW4gbXkgaGVhZC4uLiBPZiBjb3Vyc2Ug
aXQgCmlzIGludmVydCBldmVyeXRoaW5nIGFuZCBhZGQgKzEuClRoYXQgb2YgY291cnNlIG1lYW5z
IC1JTlRfTUlOID09IElOVF9NSU4uCgo+Cj4gSXQgaXMgdW5kZWZpbmVkIHRob3VnaCBzbyB0aGUg
Q1BVIGNvdWxkIGRlY2lkZSB0byBkbyBzb21ldGhpbmcKPiBlbHNlLiBPVE9IIGl0IHNlZW1zIHF1
aXRlIHVubGlrZWx5IHdlIHdpbGwgZ2V0IGFueXRoaW5nIG90aGVyIHRoYW4KPiBJTlRfTUlOIG9y
IElOVF9NQVguIFNvIEkgd2lsbCBzZXQgc2lnIG51bWJlciB0byB6ZXJvIGFzIHlvdSBzdWdnZXN0
ZWQKPiBhbmQgd2Ugd2lsbCBqdXN0IGhhdmUgdG8gcmVseSBvbiBVQlNBTi4KV2l0aCB0aGlzIGNo
YW5nZToKQWNrZWQtYnk6IEpvZXJnIFZlaGxvdyA8am9lcmcudmVobG93QGFveC10ZWNoLmRlPgoK
SsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
