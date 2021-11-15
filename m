Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EF450847
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 16:28:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 808943C8622
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 16:28:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3982C3C8254
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 16:28:22 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 868961401167
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 16:28:21 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 988DA9F68B;
 Mon, 15 Nov 2021 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1636990099; bh=iGPcMBFUePNUzDytkRC2AJok+vWRDFExLTjHqVZR6fM=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=purhHRr1vaefIYNWf97/4tAOrl+VxcB4SRVgIXV6sa89tW8yAjrhmjyGnRgUVQ99c
 p776K5w3kzCPOHOaEiv49n524+GK6jZGAnFcOzd4z9p5t4oX0s0+pbRqVN42ug9MJE
 revWtCGFMcJO6CzpGVac9rJm/dzffUPA88sXEc9A=
Message-ID: <8d0d2702-1b8f-4d59-7a78-b78276a9189d@jv-coder.de>
Date: Mon, 15 Nov 2021 16:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20211115081526.384856-1-lkml@jv-coder.de>
 <20211115081526.384856-4-lkml@jv-coder.de> <YZJ7KeRXJbEne7Jz@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
In-Reply-To: <YZJ7KeRXJbEne7Jz@yuki>
X-Spam-Status: No, score=-2.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/3] realtime/matrix_mult: Fix test optimization
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

SGkgQ3lyaWwsCj4gSWRlYWxseSB0aGUgY29tbWVudCBjaGFuZ2VzIHNob3VsZCBiZSBpbiBhIHNl
cGFyYXRlIHBhdGNoLi4uCj4KPgo+ICAgCj4gVGhlc2Ugc3RhdGljIGZ1bmN0aW9uIGNvbnZlcnNp
b25zIHNob3VsZCBpZGVhbGx5IGJlIGluIGEgc2VwYXJhdGUgcGF0Y2gKPiBhcyB3ZWxsLiBBdCBs
ZWFzdCB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gZG9lcyBub3QgbWVudGlvbiBlaXRoZXIgb2YgdGhl
c2UKPiBjaGFuZ2VzLgpJIGp1c3QgZGlkIHNvbWUgY2xlYW51cCBoZXJlLiBXb3VsZCBpdCBiZSBv
aywgdG8gZG8gYWxsIGNsZWFudXAgaW4gb25lIApjb21taXQgYW5kIHRoZSBmaXggaW4gYSBzZWNv
bmQgb25lPwoKPj4gICAKPj4gLWludCBzZXRfYWZmaW5pdHkodm9pZCkKPj4gK3N0YXRpYyBpbnQg
c2V0X2FmZmluaXR5KHZvaWQpCj4+ICAgewo+PiArCXN0YXRpYyBwdGhyZWFkX211dGV4X3QgbXV0
ZXhfY3B1ID0gUFRIUkVBRF9NVVRFWF9JTklUSUFMSVpFUjsKPiBBcyB3ZWxsIGFzIHRoaXMgY2hh
bmdlLCBpdCBsb29rcyBva2F5LCBidXQgaXQncyBub3QgbGlzdGVkIGluIHRoZSBwYXRjaAo+IGRl
c2NyaXB0aW9uLgpSaWdodCwgdGhhdCBpcyBhbHNvIGp1c3QgY2xlYW51cC4gVGhlIG11dGV4IGlz
IG9ubHkgdXNlZCBpbnNpZGUgb2YgdGhpcyAKZnVuY3Rpb24sIGFuZCBJIGZpZ3VyZWQKdXNpbmcg
dGhlIHN0YXRpYyBpbml0aWFsaXplciBpc8KgIGJldHRlciwgdGhhbiAwLWluaXRpYWxpemF0aW9u
Lgo+PiArCWZvciAoaSA9IDA7IGkgPCBpdGVyYXRpb25zOyBpKyspIHsKPj4gKwkJbWF0cml4X211
bHRfcmVjb3JkKG1hdHJpY2VzWzBdLCBpKTsKPj4gKwl9Cj4gQW5kIGhlcmUgTE1LTCBjb2Rpbmcg
c3R5bGUgcHJlZmVycyB0byBhdm9pZCB0aGUgY3VybHkgYnJhY2VzLCBidXQgdGhhdAo+IGlzIHZl
cnkgbWlub3IuClllcyBzb3JyeSwgSSBoYWQgdGhpcyB3aXRob3V0IGN1cmx5IGJyYWNlcywgdGhh
biBhZGRlZCBzb21lIGRlYnVnIGNvZGUgCmFuZCBmb3Jnb3QgdG8gcmVtb3ZlIHRoZW0gYWdhaW4u
ClRoaXMgYnR3LiBpcyB0aGUgcmVhc29uLCB3aHkgSSBkb24ndCBsaWtlIHRoaXMgcnVsZSAoYnV0
IEkgd2lsbCBub3QgdHJ5IAp0byBhcmd1ZSBhYm91dCBpdCBoZXJlKQoKCkpvZXJnCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
