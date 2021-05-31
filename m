Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC3395B37
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:16:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1718F3C80A5
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:16:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7AEB33C187D
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:16:45 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BA7A86008DB
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:16:44 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 932AD9FBB1;
 Mon, 31 May 2021 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1622467002; bh=GHWu9YSoqVnUigcuxcJcvZDGk6EGS0HAVLHaw1ZVAr8=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=iHjw2wY3Zwes1bjfODoG0jWqolt/7/oBSQkqkzmjY9dawzK9d8PnHwV3Z5pOD+oBa
 hpZ7w/GR1SGAN2buz+kYOS85KxFxNd/CKNggn/YCEJn+5QNQL6BmPZuW+vtArgU1Ce
 eIfppEyqAl4whJryINilxic1+RvHT+fcvJfqlr8Q=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
 <d70f9e5f-0008-02aa-e099-2a8243c4b3fa@jv-coder.de> <YLTYDC4hxQPVxkZq@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <af8480e6-2020-d21d-bfe7-d9a4d28e0733@jv-coder.de>
Date: Mon, 31 May 2021 15:16:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLTYDC4hxQPVxkZq@yuki>
Content-Language: en-US
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
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

SGkgQ3lyaWwsCgpPbiA1LzMxLzIwMjEgMjozNSBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IEhp
IQo+PiBCdXQgb25lIG1vcmUgc3RyYW5nZSB0aGluZyBoZXJlLgo+PiBJIHdvbmRlciB3aHkgdGhp
cyBldmVuIHdvcmtzLiAkcGlkIGlzIHVzZWQgaW4gX3RzdF9raWxsX3Rlc3QgYW5kIGRlZmluZWQK
Pj4gaW4gX3RzdF9zZXR1cF90aW1lciBhcyBhIGxvY2FsIHZhcmlhYmxlLgo+PiBJdCBsb29rcyBs
aWtlIGl0IGlzIGluaGVyaXRlZCB0aHJvdWdoIHRoZSBjYWxsIGNoYWluIGFuZCBzaW5jZSBpdCBp
cwo+PiBjb3BpZWQgdG8gdGhlIGJhY2tncm91bmQgcHJvY2VzcywgaXQgY2Fubm90IGJlIG1hbmlw
dWxhdGVkIGJ5IHRoZSB0ZXN0cy4KPj4gU3RpbGwgSSB3b3VsZCB2b3RlIGZvciBjaGFuZ2luZyB0
aGlzIGF0IHNvbWUgcG9pbnQsIGJlY2F1c2UgaXQgaXMgaGlnaGx5Cj4+IGNvbmZ1c2luZy4KPiBU
aGF0J3MgYWN0dWFsbHkgYSBjb3JyZWN0IGFuZCB3ZWxsIGRlZmluZWQgYmVoYXZpb3IsIGlmIHlv
dSBjYWxsIGEKPiBmdW5jdGlvbiBnIGZyb20gZnVuY3Rpb24gZiB0aGUgZnVuY3Rpb24gZyBoYXMg
YWNjZXNzIHRvIHRoZSB2YXJpYWJsZXMKPiBsb2NhbCB0byBmLgo+Cj4gQW5kIHllcyBpdCdzIGNv
bmZ1c2luZywgYnV0IHRoZSBhbHRlcm5hdGl2ZSBpcyBoYXZpbmcgYW5vdGhlciBnbG9iYWwKPiB2
YXJpYWJsZSB3aGljaCBJIGRvIG5vdCB0aGluayBpcyBtdWNoIGJldHRlciB0aGFuIHRoaXMuCkht
IHNoZWxsIGNvZGUgaGFzIG1vcmUgc3RyYW5nZSBiZWhhdmlvciB0aGFuIEkgd291bGQgaGF2ZSBl
dmVyIGV4cGVjdGVkLi4uCkJ1dCBhdCBsZWFzdCBMaSBhbmQgbXlzZWxmIGRpZCBub3Qga25vdyB0
aGF0IGFuZCBldmVuIHdoaWxlIHlvdSBrbm93IAphYm91dCB0aGlzICJmZWF0dXJlIiwgeW91IHRo
aW5rIGl0IGlzIHN0cmFuZ2UuCkkgd291bGQgcmF0aGVyIGxpa2UgdG8gYmUgZXhwbGljaXQgYW5k
IHVzZSBhIGdsb2JhbCB2YXJpYWJsZSAod2hhdCBoYXJtIAppcyBpdCByZWFsbHk/KSBpbnN0ZWFk
IG9mIGNvbmZ1c2luZyB0aGUgbmV4dCBvbmUgbG9va2luZyBhdCB0aGlzIHBpZWNlIApvZiBjb2Rl
Li4uLgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
