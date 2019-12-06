Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6F114C54
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 07:24:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AEA33C2437
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 07:24:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4A1213C242B
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 07:24:26 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D47C814060DF
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 07:24:25 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B16FE9F7F0;
 Fri,  6 Dec 2019 06:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575613464; bh=fj8remd3HOu32v4kXfyT65lyZiVT3cSMif2QKZUqhN0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=E30uXM/3j6orNW8foH3NBNcIK99JJX3CSfelMwZIDyn9JnEBg4XZBGkA6xwHk0DUp
 ZhD+nAXbzfBoww2AiRZ5FNbZzS6PdwSFvaFtsx452Mzv/83Pxf7CMwF/Gu0PbJcNKU
 awA733qDolgOcopYlYnkqjsi4gmrypqFLZb9rHjU=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
 <20191125153245.GA15129@rei.lan>
 <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
 <20191126121038.GC16922@rei.lan>
 <42d40727-f631-39ff-fdc0-576e13336a4d@jv-coder.de>
 <20191203151238.GI2844@rei>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <6d81a8f8-df00-62de-d0aa-aa7bcd3e622b@jv-coder.de>
Date: Fri, 6 Dec 2019 07:24:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191203151238.GI2844@rei>
Content-Language: en-US
X-Spam-Status: No, score=3.1 required=7.0 tests=BITCOIN_SPAM_02,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PDS_BTC_ID, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg_lib/memcg_process: Better synchronization
 of signal USR1
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

SGkgQ3lyaWwsCgo+IEhpIQo+Pj4gSSBoYXZlIHdyaXR0ZW4gYSBibG9nIHBvc3QgdGhhdCBwYXJ0
bHkgYXBwbGllcyB0byB0aGlzIGNhc2UsIHNlZToKPj4+Cj4+PiBodHRwczovL3Blb3BsZS5rZXJu
ZWwub3JnL21ldGFuL3doeS1zbGVlcC1pcy1hbG1vc3QtbmV2ZXItYWNjZXB0YWJsZS1pbi10ZXN0
cwo+PiBJIGtub3cgd2hlcmUgeW91IGFyZSBjb21pbmcgZnJvbSBhbmQgaXQgaXMgYmFzaWNhbGx5
IHRoZSBzYW1lIGFzIG15IG93bgo+PiBvcGluaW9uLgo+PiBUaGUgZGlmZmVyZW5jZSBpczogV2hl
biBJIGxvb2sgYXQgbHRwIEkgc2VlIGEgcnVudGltZSBvZiBtb3JlIHRoYW4gNgo+PiBob3Vycywg
bG9va2luZyBhdCB0aGUKPj4gY29udHJvbGxlciB0ZXN0IGFsb25lIGl0IGlzIG1vcmUgdGhhbiA0
IGhvdXJzLiBUaGlzIHB1dHMgMzAgc2Vjb25kcyBpbnRvCj4+IGEgdmVyeSBkaWZmZXJlbmV0Cj4+
IHBlcnNwZWN0aXZlIHRoYW4gbG9va2luZyBhdCBvbmx5IHN5c2NhbGwgdGVzdHMuIChJbiB0aGUg
dGVzdHJ1biBJIGxvb2tlZAo+PiBhdCBpdCBpcyBhcm91bmQgMTMgbWludXRlcykuCj4+IFRoYXQg
aXMgd2h5IEkgZG9uJ3QgY2FyZSBhYm91dCAzMCBzZWNvbmRzIGluIHRoaXMgY2FzZS4KPiBjb250
cm9sbGVycyB0ZXN0cnVuIHJ1bnMgZm9yIDI1IG1pbnV0ZXMgb24gb3VyIHNlcnZlcnMsIGl0IHdp
bGwgcHJvYmFibHkKPiBiZSByZWR1Y2VkIHRvIDE1IG1pbnV0ZXMgaW4gdHdvIG9yIHRocmVlIHll
YXJzIHdpdGggbmV4dCB1cGdyYWRlLiBUaGUKPiBtYWluIHBvaW50IGlzIHRoYXQgaGFyZHdhcmUg
dGVuZHMgdG8gYmUgZmFzdGVyIGFuZCBmYXN0ZXIgYnV0IGFueSBzbGVlcAo+IGluIHRoZSB0ZXN0
cyB3aWxsIG5vdCBzY2FsZSBhbmQgZW5kcyB1cCBiZWluZyBhIHByb2JsZW0gc29vbmVyIG9yIGxh
dGVyLgo+IEl0IGFsc28gZ3JlYXRseSBkZXBlbmRzIG9uIHdoaWNoIEhXIGFyZSB5b3UgcnVubmlu
ZyB0aGUgdGVzdHMgb24uCk9rIGluIHRoYXQgY2FzZSBpdCBtYWtlcyBzZW5zZS4KPj4gQ29ycmVj
dC4gVXNpbmcgZmlmb3MgaXMgcHJvYmFibHkgYSB2aWFibGUgc29sdXRpb24sIGJ1dCBpdCB3b3Vs
ZCByZXF1aXJlCj4+IGxpYnJhcnkgd29yaywKPj4gYmVjYXVzZSBvdGhlcndpc2UgdGhlIG92ZXJo
ZWFkIGlzIHdheSB0b28gYmlnLgo+PiBBbm90aGVyIHRoaW5nIEkgY2FuIHRoaW5rIG9mIGlzIGV4
dGVuZGluZyB0c3RfY2hlY2twb2ludCB3YWl0IHRvIGFsc28KPj4gd2F0Y2ggYSBwcm9jZXNzCj4+
IGFuZCBzdG9wIHdhaXRpbmcsIGlmIHRoYXQgcHJvY2VzcyBkaWVzLiBUaGlzIHdvdWxkIGJlIHRo
ZSBzaW1wbGVzdCB3YXkKPj4gdG8gZ2V0IGdvb2QKPj4gc3luY2hyb25pemF0aW9uIGFuZCBnZXQg
cmlkIG9mIHRoZSBzbGVlcC4KPiBJJ20gbm90IHN1cmUgaWYgd2UgY2FuIGltcGxlbWVudCB0aGlz
IHdpdGhvdXQgaW50cm9kdWNpbmcgYW5vdGhlciByYWNlCj4gY29uZGl0aW9uLiBUaGUgb25seSB3
YXkgaG93IHRvIHdha2UgdXAgZnV0ZXggZnJvbSBzbGVlcCBiZWZvcmUgaXQKPiB0aW1lb3V0cyBp
biBhIHJhY2UtZnJlZSB3YXkgaXMgc2VuZGluZyBhIHNpZ25hbC4gSW4gdGhpcyBjYXNlIHdlIHNo
b3VsZAo+IHNlZSBFSU5UUi4gQnV0IHRoYXQgd291bGQgbWVhbiB0aGF0IHRoZSBwcm9jZXNzIHRo
YXQgaXMgd2FraW5nIHVwIHRoZQo+IGZ1dGV4IGhhcyB0byBiZSBhIGNoaWxkIG9mIHRoZSBwcm9j
ZXNzLCB1bmxlc3Mgd2UgcmVwYXJlbnQgdGhhdCBwcm9jZXNzLAo+IGJ1dCBhbGwgdGhhdCB3b3Vs
ZCBiZSB0b28gdHJpY2t5IEkgZ3Vlc3MuCj4KPiBJZiB3ZSBkZWNpZGUgdG8gd2FrZSB0aGUgZnV0
ZXggcmVndWxhcnkgdG8gY2hlY2sgaWYgdGhlIHByb2Nlc3MgaXMgYWxpdmUKPiB3ZSBjYW4gbWlz
cyB0aGUgd2FrZS4gV2VsbCB0aGUgbGlicmFyeSB0cmllcyBoYXJkIGFuZCBsb29wcyBvdmVyIHRo
ZQo+IHdha2Ugc3lzY2FsbCBmb3IgYSB3aGlsZSwgYnV0IHRoaXMgY291bGQgc3RpbGwgZmFpbCBv
biB2ZXJ5IHNsb3cKPiBkZXZpY2VzIHVuZGVyIGxvYWQuIEJ1dCBpZiB0aGUgdGltaW5nIGlzIHVu
Zm9ydHVuYXRlIHdlIG1heSBtaXNzIG1vcmUKPiB0aGFuIG9uZSB3YWtlIHNpZ25hbCwgd2hpY2gg
d291bGQgbGVhZCB0byB0aW1lb3V0LiBUaW1pbmcgcHJvYmxlbXMgbGlrZQo+IHRoYXQgY2FuIGVh
c2lseSBhcmlzZSBvbiBWTXMgd2l0aCBhIHNpbmdsZSBDUFUgb24gb3ZlcmJvb2tlbmQgaG9zdC4K
T2ssIHNvIHdlIGFyZSBiYWNrIHRvIGZpZm9zLiBJIGd1ZXNzIHRoaXMgc2hvdWxkIGJlIHBhcnQg
b2YgdGhlIGxpYnJhcnkuCkkgd2lsbCBzZW5kIGEgcHJvcG9zYWwgZm9yIGRpc2N1c3Npb24gdG8g
dGhlIG1haWxpbmcgbGlzdCBsYXRlciBvciBuZXh0IAp3ZWVrLgoKSsO2cmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
