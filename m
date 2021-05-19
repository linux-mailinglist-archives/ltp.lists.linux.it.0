Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469D388A60
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 11:19:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 356553C3061
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 11:19:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D241E3C183E
 for <ltp@lists.linux.it>; Wed, 19 May 2021 11:19:27 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2426F1401172
 for <ltp@lists.linux.it>; Wed, 19 May 2021 11:19:26 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8B48D9F72D
 for <ltp@lists.linux.it>; Wed, 19 May 2021 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621415965; bh=EFSJ2vf35SS7dvPlFYJrlEJ22P6Cs6rLeCIKmU8Swjk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=TYZnVtSxcbo0r4SyosFklnrW1VjOlC+BM+UFf2fHEiWGoHrd24R17Gmi5FhijoDih
 ++etAe96iVlb35p7Ui7ZaFsV33kMlLU1R36BeC9H5vsRcc5jo1YtFg6pfm6QQzONeU
 GpxjYkWCxo0JvchhQNClcaoU8n5Q6K3WoguEERYM=
To: ltp@lists.linux.it
References: <20210519085812.27263-1-liwang@redhat.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <78d1900a-cdc7-77c6-8f01-73ce4236a162@jv-coder.de>
Date: Wed, 19 May 2021 11:21:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519085812.27263-1-liwang@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] tst_test: using SIGTERM to terminate process
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

SGksCgpPbiA1LzE5LzIwMjEgMTA6NTggQU0sIExpIFdhbmcgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L2xpYi9uZXdsaWJfdGVzdHMvc2hlbGwvdGltZW91dDAzLnNoIGIvbGliL25ld2xpYl90ZXN0cy9z
aGVsbC90aW1lb3V0MDMuc2gKPiBpbmRleCBjZDU0OGQ5YTIuLmRhYmVmMzJhMiAxMDA3NTUKPiAt
LS0gYS9saWIvbmV3bGliX3Rlc3RzL3NoZWxsL3RpbWVvdXQwMy5zaAo+ICsrKyBiL2xpYi9uZXds
aWJfdGVzdHMvc2hlbGwvdGltZW91dDAzLnNoCj4gQEAgLTYsOCArNiw5IEBACj4gICAjIGV4cGVj
dGVkIG91dHB1dDoKPiAgICMgdGltZW91dDAzIDEgVElORk86IHRpbWVvdXQgcGVyIHJ1biBpcyAw
aCAwbSAxcwo+ICAgIyB0aW1lb3V0MDMgMSBUSU5GTzogdGVzdGluZyBraWxsaW5nIHRlc3QgYWZ0
ZXIgVFNUX1RJTUVPVVQKPiAtIyB0aW1lb3V0MDMgMSBUQlJPSzogVGVzdCB0aW1lb3V0ZWQsIHNl
bmRpbmcgU0lHSU5UISBJZiB5b3UgYXJlIHJ1bm5pbmcgb24gc2xvdyBtYWNoaW5lLCB0cnkgZXhw
b3J0aW5nIExUUF9USU1FT1VUX01VTCA+IDEKPiAtIyB0aW1lb3V0MDMgMSBUQlJPSzogdGVzdCBp
bnRlcnJ1cHRlZCBvciB0aW1lZCBvdXQKPiArIyB0aW1lb3V0MDMgMSBUQlJPSzogVGVzdCB0aW1l
ZCBvdXQsIHNlbmRpbmcgU0lHVEVSTSEgSWYgeW91IGFyZSBydW5uaW5nIG9uIHNsb3cgbWFjaGlu
ZSwgdHJ5IGV4cG9ydGluZyBMVFBfVElNRU9VVF9NVUwgPiAxCj4gKyMgVGVybWluYXRlZApOaXQ6
IFRoaXMgTWVzc2FnZSBzZWVtcyB0byBiZSBvbmx5IHRoZXJlIGZvciBiYXNoLi4uIEkgdHJpZWQg
dG8gZmluZCB3aHkgCmFuZCBpZiBpdCBjYW4gYmUgc3VwcHJlc3NlZCwgYnV0IGZvdW5kIG5vdGhp
bmcuIEkgZ3Vlc3MgaXQgY29tZXMgZnJvbSAKdGhlIHRlcm1pbmF0ZWQgc2xlZXAgcHJvY2Vzcy4K
CkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
