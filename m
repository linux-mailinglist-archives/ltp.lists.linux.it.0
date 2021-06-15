Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CF3A7B50
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 11:59:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56A753C4D41
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 11:59:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 193D53C2E08
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 11:59:38 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 292BF1000D09
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 11:59:37 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 432749F75F;
 Tue, 15 Jun 2021 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623751176; bh=TMmeyM0HV2pzi5eSZKHDPdPThtFjSUh2YzpYY7/cim4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=KLztSZfLsr61qZQ9XwFDuh4UNC+ApoGcAN1bBL7yhLyqY4AN90C93wyocon1M7TpK
 PtNm2lwPiq1XNGzfiYpvb/fsUEZEZanUVhCXdX2fbvd5/5BVyJxgcPHsZ4iAZPwG52
 NrV3Afq/WgZXmPJZiusXf4euYSn6dIEo3O46oQ90=
To: Petr Vorel <pvorel@suse.cz>
References: <20210610101917.1251564-1-lkml@jv-coder.de>
 <YMcB3Wcu0J9C3Z/Q@pevik> <5db0624b-a6ce-2c02-d1d4-52034c85b2f1@jv-coder.de>
 <YMdgXPeTNHMtna/M@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <0324b896-0ef7-66d3-3d2c-9b9817721500@jv-coder.de>
Date: Tue, 15 Jun 2021 11:59:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMdgXPeTNHMtna/M@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ssh-stress: Convert to new api
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

SGkgUGV0ciwKCk9uIDYvMTQvMjAyMSAzOjU3IFBNLCBQZXRyIFZvcmVsIHdyb3RlOgo+Cj4+PiBP
dXQgb2YgY3VyaW9zaXR5LCBkaWQgeW91IHRlc3QgdGhpcyBvbiBUd28gSG9zdCBDb25maWd1cmF0
aW9uIFsyXSAoaS5lLiBzc2gpPwo+Pj4gT3IganVzdCBuZXRucz8KPj4gTm8sIGJ1dCBzaG91bGQg
aGF2ZS4uLgo+PiBJIGZvdW5kIHR3byBtYWpvciBwcm9ibGVtcyB3aXRoIHRoZSB0ZXN0ICh3aWxs
IHNlbmQgYSB2MikuIEJ1dCBhcGFydCBmcm9tCj4+IHRoYXQsIGVpdGhlciBJIHdhcyBub3QgYWJs
ZSB0byBmaW5kIHRoZSBkb2N1bWVudGF0aW9uIG9yIGl0IGlzIG5vdCBjbGVhcgo+PiBlbm91Z2gg
dG8gbWUsIGhvdyB0byBydW4gdGhlIHR3byBob3N0IHNldHVwLgo+PiBJIGZvdW5kIG5ldHdvcmsv
UkVBRE1FLm1kLCBidXQgaXQgb25seSBtZW50aW9ucyB0byBzZXQgUkhPU1QsIGJ1dCBmb3IgbXkK
Pj4gc2V0dXAgKHdpdGggaXBzIGRpZmZlcmVudCBmcm9tIHRoZSBkZWZhdWx0IG9uZXMsIElQVns0
LDZ9X3tMLFJ9SE9TVCBpcyBhbHNvCj4gWWVzIHdlIHNob3VsZCBiZSBtb3JlIHZlcmJvc2UgYXQg
VHdvIEhvc3QgQ29uZmlndXJhdGlvbiBbMV0gYXMgdGhlcmUgaXMgbm90aGluZwo+IG1vcmUuIEF0
IGxlYXN0IHRvIG1lbnRpb24gSVBWezQsNn1fe0wsUn1IT1NULgorMQo+PiByZXF1aXJlZCkgYW5k
IGx0cCBtdXN0IGFscmVhZHkgYmUgaW4gdGhlIFBBVEggb24gcmhvc3QsIHdoaWNoIHdhcyBub3QK
Pj4gcG9zc2libGUgZm9yIG15IHJob3N0IHNldHVwLCB3aGVyZSB0aGUgZmlsZXN5c3RlbSBpcyBy
ZWFkLW9ubHkgYW5kIEkgaGFkIHRvCj4+IGhhY2sgc2V0dGluZyB0aGUgcGF0aCBpbnRvIHRzdF9y
aG9zdF9ydW4uIEl0IGlzIG5vdCB0b3RhbGx5IGNsZWFyLCB0aGF0IGx0cAo+IFdoYXQgZXhhY3Rs
eSB3YXMgeW91ciBwcm9ibGVtPyBIYXZpbmcgdG8gbW9kaWZ5IFBBVEggb24gc2hlbGwgY29uZmln
IG9uIHJlYWQKPiBvbmx5IHN5c3RlbT8gSSdsbCBzZW5kIGEgcHJvcG9zYWwgdG8gc2V0IFBBVEgg
aW4gdHN0X3Rlc3Quc2guClRoZSBzaW1wbGVzdCB3YXkgdG8gc2V0IHRoZSBwYXRoIHdvdWxkIGJl
IGluIC5wcm9maWxlIG9uIHRoZSByaG9zdCwgYnV0IApzaW5jZSB0aGUgd2hvbGUgZnMgd2FzIHJl
YWRvbmx5LCB0aGlzIHdhcyBub3QgcG9zc2libGUuCkkgc29tZWhvdyB0aG91Z2h0IGx0cCB3b3Vs
ZCB0YWtlIGNhcmUgb2Ygc2V0dGluZyB0aGUgcGF0aCBhbmQgYWxzbyAKZXhwb3J0aW5nIExUUFJP
T1QgYXV0b21hdGljYWxseSwgYmVjYXVzZSBhY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRpb24s
IAppdCBleHBlY3RzIHRvIGZpbmQgbHRwIGF0IHRoZSBzYW1lIHBhdGggYXMgb24gdGhlIExIT1NU
LgpNYXliZSB0aGlzIHJlc3RyaWN0aW9uIGNvdWxkIGV2ZW4gYmUgbGlmdGVkLCBpZiB0aGUgTEhP
U1Qgc2V0cyB0aGUgcGF0aHMgCm9uIHRoZSBSSE9TVCAoc29tZXRoaW5nIGxpa2UgUkhPU1RfTFRQ
Uk9PVCwgd2hpY2ggZGVmYXVsdHMgdG8gTFRQUk9PVCkuIApUaGlzIGNvdWxkIHRoZW4gYmUgdXNl
ZCB0byBzZXQgUEFUSCBvbiBSSE9TVCBhcyB5b3Ugc3VnZ2VzdGVkLgpGb3IgbXkgdGVzdHMgSSBq
dXN0IGFkZGVkICJleHBvcnQgUEFUSD0kUEFUSDsiIHRvIHRoZSByaG9zdCBzc2ggY29tbWFuZC4g
Ckl0IHdhbnRlZCB0byB1c2UganVzdCAiUEFUSD0kUEFUSCIsIGJ1dCB0aGF0IGRpZCBub3Qgd29y
ayBiZWNhdXNlIEkgdXNlZCAKY29tbWFuZCBncm91cGluZyBpbiB0aGUgc3NoLXN0cmVzcyB0ZXN0
LgoiWD0xICggZWNobyAkWCApIiBmYWlscyB3aXRoIGEgc3ludGF4IGVycm9yLiBXaXRoIGV4cG9y
dCBpdCB3b3JrcyBhbmQgSSAKZ3Vlc3MgaXQgc2hvdWxkIGJlIGltcGxlbWVudGVkIGNsZWFuZXIg
dGhhbiBqdXN0IGZvcmNpbmcgdGhlIHdob2xlIFBBVEggCmZyb20gdGhlIExIT1NUIG9udG8gdGhl
IFJIT1NUIGFzIEkgZGlkLgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
