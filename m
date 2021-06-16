Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348C3A91C0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:16:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5438B3C4CC6
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:16:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA4E93C188E
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:16:38 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 964D31000D4D
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:16:37 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 5CEAC9F7E5;
 Wed, 16 Jun 2021 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623824195; bh=v3zB/nVDOp9UmN0Wji+0DjKQ10bNppZqlMNf8gu3pVg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=qhg+qYKFExTshABNK4j0mUBx+DNwI3wc83ElPBAXjnwh8r+SN0jVGqhMrBvQ/4jbp
 X8ZmlcJVAZmMW9EZdEoBRzFsY1M0I3iDTTQezvPraXF4TKaTbPTveDHmqT9LACdYZN
 eCP9df5dgBRHwV6UcM1gE8AJPARMFc0499vu2Wws=
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>, ltp@lists.linux.it,
 pvorel@suse.cz
References: <20210614094338.125870-1-lkml@jv-coder.de>
 <a2ad7106-3e96-48a0-d195-80d7d09c8613@bell-sw.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <fae3c38e-ae64-05ac-264b-f11cae8c1c55@jv-coder.de>
Date: Wed, 16 Jun 2021 08:16:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a2ad7106-3e96-48a0-d195-80d7d09c8613@bell-sw.com>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] ssh-stress: Convert to new api
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGV5LAoKdGhhbmtzIGZvciB5b3VyIHJldmlldy4gSSB3aWxsIGludGVncmF0ZSB0aGUg
Y2hhbmdlcywgdGVzdCBhbmQgc2VuZCBhIHYzLgoKPj4gKyMgU1NIIGNvbmZpZyBmaWxlIG9uIHRo
ZSByZW1vdGUgaG9zdAo+PiArUkhPU1RfU1NIX0NPTkY9Cj4+ICsjIFNTRyBjb21tYW5kIHRvIGNv
bm5lY3QgZnJvbSB0aGUgcmVtb3RlIGhvc3QgdG8gdGhlIHRlc3QgaG9zdAo+ICAgICAgICBeCj4g
ICAgICAgU1NICk9idmlvdXNseSwgdGhhbmtzCj4KPj4gK1JIT1NUX1NTSD0KPj4gKyMgUHJvY2Vz
c2VzIHN0YXJ0ZWQgb24gdGhlIHJlbW90ZSBob3N0LCBraWxsZWQgYXQgY2xlYW51cAo+PiArUkhP
U1RfUElEUz0KPj4gKyMgTmV0c3RyZXNzIHByb2Nlc3Mgc3RhcnRlZCBvbiB0aGUgdGVzdCBob3N0
LCBraWxsZWQgYXQgY2xlYW51cAo+PiArTkVUU1RSRVNTX1BJRD0KPj4gICAKPj4gICBjbGVhbnVw
KCkKPj4gICB7Cj4+ICsJbG9jYWwgcGlkcyBwaWQKPj4gKwo+PiAgIAkjIFN0b3AgdGhlIHNzaCBk
YWVtb24KPj4gLQl0ZXN0IC1zIHNzaGQucGlkICYmIGtpbGwgJChjYXQgc3NoZC5waWQpCj4+IC0J
cGtpbGwgJ25ldHN0cmVzcyQnCj4+IC0JdHN0X3JtZGlyCj4+IC0JWyAiJHJ0bXBkaXIiIF0gJiYg
dHN0X3Job3N0X3J1biAtYyAicm0gLXJmICRydG1wZGlyIgo+PiAtCVRNUERJUj0KPj4gKwlbIC1z
IHNzaGQucGlkIF0gJiYga2lsbCAkKGNhdCBzc2hkLnBpZCkKPj4gKwlbIC1uICIkTkVUU1RSRVNT
X1BJRCIgXSAmJiBraWxsIC0yICRORVRTVFJFU1NfUElEID4vZGV2L251bGwgMj4mMQo+PiArCj4+
ICsJZm9yIHBpZCBpbiAkUkhPU1RfUElEUzsgZG8KPj4gKwkJdHN0X3Job3N0X3J1biAtYyAia2ls
bCAtLSAkcGlkIiAgPi9kZXYvbnVsbCAyPiYxCj4+ICsJZG9uZQo+IHRzdF9yaG9zdF9ydW4gLWMg
ImtpbGwgJFJIT1NUX1BJRFMiCkkgZ3Vlc3MgSSBkaWQgbm90IHVzZSB1c2UgaXQsIGJlY2F1c2Ug
aXQgbWlnaHQgYmUgYSBodWdlIG51bWJlciBvZiBwaWRzIAphbmQgSSBkaWQgbm90IGxvb2sgYXQg
dGhlIGFjdHVhbCBsaW1pdHMsIGJ1dCBub3cgdGhhdCBJIGxvb2tlZCBhdCBpdCwgaXQgCnNob3Vs
ZCBiZSBiaWcgZW5vdWdoLi4uCgo+Cj4+ICsKPj4gKwkjIEtpbGwgYWxsIHJlbWFpbmluZyBzc2gg
cHJvY2Vzc2VzCj4+ICsJdHN0X3Job3N0X3J1biAtYyAicHMgYXV3eCB8IFwKPj4gKwkJYXdrICdc
JDAgfiBcIiRSSE9TVF9TU0hfQ09ORlwiICYmIFwkMTEgPT0gXCJzc2hcIiB7cHJpbnQgXCQyfScg
fCBcCj4+ICsJCXhhcmdzIC1yIC10IGtpbGwgLS0gPi9kZXYvbnVsbCAyPiYxIgo+PiAgIH0KPj4g
ICAKPiBXaGF0IGFib3V0IHVzaW5nIHBraWxsIC1mIGluc3RlYWQgb2YgcHN8YXdrfGtpbGw/Ckkg
Z3Vlc3MgSSBkaWQgbm90IHVzZSBwa2lsbCBmb3IgdHdvIHJlYXNvbnM6CjEuIEkgd2FudGVkIHRv
IGJlIHN1cmUgdG8gcmVhbGx5IG9ubHkga2lsbCBzc2ggcHJvY2Vzc2VzIHdpdGggCiRSSE9TVF9T
U0hfQ09ORiBpbiB0aGVpciBhcmd1bWVudHMKMi4gSSBkaWQgbm90IHdhbnQgdG8gdXNlIGFuIGV4
dHJhIHRvb2wsIHRoYXQgaXMgbm90IG5lY2Vzc2FyaWx5IAphdmFpbGFibGUgb24gYWxsIHN5c3Rl
bXMuCgpUaGUgZmlyc3Qgb25lIGNvdWxkIGJlIHNvbHZlZCBieSB1c2luZyAicGtpbGwgLWYgIl5z
c2ggCi4qJFJIT1NUX1NTSF9DT05GIiwgSSBndWVzcy4gVGhpcyBzdGlsbCBsZWF2ZXMgYSBwcm9i
bGVtIHdpdGggdW5lc2NhcGVkIApyZWdleHAgbWV0YSBjaGFyYWN0ZXJzIGluIFJIT1NUX1NTSF9D
T05GLCBidXQgbXkgYXdrIHNvbHV0aW9uIGhhcyB0aGUgCnNhbWUgcHJvYmxlbS4gQnV0IEkgdGhp
bmsgdGhpcyBpcyBvbmx5IHRoZW9yZXRpY2FsLCBpdCBpcyBleHRyZW1lbHkgCnVubGlrZWx5LCB0
aGF0IGFueSByZWdleHAgbWV0YSBjaGFyYWN0ZXIgYXBhcnQgZnJvbSAiLiIgaXMgdXNlZCBpbiAK
UkhPU1RfU1NIX0NPTkYgYW5kIHRoZSBkb3Qgd2lsbCB1bmxpa2VseSBwcm9kdWNlIGZhbHNlIHBv
c2l0aXZlcy4KVGhlIHNlY29uZCBwb2ludCBjYW4gYmUgaWdub3JlZC4gcGtpbGwgaXMgdXNlZCBp
biBtYW55IGxvY2F0aW9ucyAKdGhyb3VnaG91dCBsdHAgYWxyZWFkeS4gSXQgc2hvdWxkIHByb2Jh
Ymx5IGJlIGFkZGVkIGFzIGEgcnVudGltZSBkZXBlbmRlbmN5LgoKPgo+PiAtCXRzdF9yaG9zdF9y
dW4gLXMgLWMgInNzaC1zdHJlc3MwMi1ybXQuc2ggJFRTVF9JUFZFUiAkKHRzdF9pcGFkZHIpIFwK
Pj4gLQkJJHJjb25maWcgJENPTk5FQ1RJT05fVE9UQUwgJE5TX0RVUkFUSU9OIgo+PiArCXRzdF9y
ZXMgVElORk8gIlZlcmlmeSB0aGUgc3NoIGNvbm5lY3Rpdml0eSBvdmVyIElQdjQvSVB2NiBpcyBu
b3QgYnJva2VuIGFmdGVyIGNyZWF0aW5nIG1hbnkgc3NoIHNlc3Npb25zIgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiBUaGUg
bWVzc2FnZSBtYXkgaGF2ZSBpbmRpY2F0ZWQgdGhlIGV4YWN0IElQIHZlcnNpb24gd2l0aCAkVFNU
X0lQVkVSClllYWggcmlnaHQsIHRoYXQgd2FzIGp1c3QgY29weSBhbmQgcGFzdGVkIGZyb20gdGhl
IG9yaWdpbmFsIHRlc3QgCmRlc2NyaXB0aW9uLgo+Cj4+ICsJZm9yIHBpZCBpbiAkUkhPU1RfUElE
UzsgZG8KPj4gKwkJdHN0X3Job3N0X3J1biAtYyAia2lsbCAkcGlkIiA+L2Rldi9udWxsCj4+ICsJ
CVsgJD8gLW5lIDAgXSAmJiBudW09JCgobnVtICsgMSkpCj4gRG8gd2UgbmVlZCAkKChudW0gKyAx
KSkgaGVyZT8gQXQgbGVhc3QgaXQgY291bGQgYmUgdXNlZCBpbiB0aGUKPiBtZXNzYWdlIGJlbG93
IGluc3RlYWQgb2YgInNvbWUgc3NoIi4uLgpJIHRoaW5rIEkganVzdCBjb3VudGVkIHRoZW0gaGVy
ZSwgYmVjYXVzZSBJIHdhbnRlZCB0byBrZWVwIHRoZSBsb29wIApydW5uaW5nLCBzbyBhbGwgcHJv
Y2Vzc2VzIGFyZSBraWxsZWQgYmVmb3JlIHRzdF9icmsgaXMgY2FsbGVkLgpCdXQgeWVzIGFkZGlu
ZyBpdCB0byB0aGUgbWVzc2FnZSBtYWtlcyBzZW5zZQo+PiAgIAo+PiAtCW5ldHN0cmVzcyAtUiAz
IC1nICRwb3J0ID4gdGNwX3NlcnZlci5sb2cgMj4mMSAmCj4+ICsJIyBTdGFydCBhIHRjcCBzZXJ2
ZXIKPj4gKwluZXRzdHJlc3MgLVIgMyAtZyAkcG9ydCA+L2Rldi9udWxsIDI+JjEgJgo+PiArCU5F
VFNUUkVTU19QSUQ9JCEKPgo+IFdlIGNhbiBub3cgdXNlIG5ldHN0cmVzcyAtQiwgaXQgd2lsbCBn
byB0byBiYWNrZ3JvdW5kIG9ubHkgYWZ0ZXIgc3VjZXNzZnVsbHkKPiBwZXJmb3JtaW5nIGJpbmQo
KS9saXN0ZW4oKS4gVGhlIGFjdHVhbCBwb3J0IG51bWJlciB3aWxsIGJlIHNhdmVkIGluIHRoZQo+
IG5ldHN0cmVzc19wb3J0IGZpbGUsIGkuZS46Cj4KPiBuZXRzdHJlc3MgLUIgLgo+IHBvcnQ9JChj
YXQgbmV0c3RyZXNzX3BvcnQpCkkgd2lsbCB0cnkgdGhpcwo+Cj4+ICAgCj4+IC0JdHN0X3Job3N0
X3J1biAtcyAtYyAic3NoLXN0cmVzczAzLXJtdC5zaCAkVFNUX0lQVkVSICQodHN0X2lwYWRkcikg
XAo+PiAtCQkkcmNvbmZpZyAkcG9ydCAkTlNfVElNRVMiCj4+ICsJIyBTZXR1cCBhbiBzc2ggdHVu
bmVsIGZyb20gdGhlIHJlbW90ZSBob3N0IHRvIHRlc3Rob3N0Cj4+ICsJUkhPU1RfUElEUz0kKHRz
dF9yaG9zdF9ydW4gLWMgXAo+PiArCQkiJFJIT1NUX1NTSCAtTiAtTCAkbHBvcnQ6JHJob3N0OiRw
b3J0IDwvZGV2L251bGwgMT4vZGV2L251bGwgMj4mMSBcCj4+ICsJCSYgZWNobyBcJCEiKQo+PiAr
CXRzdF9zbGVlcCAxCj4gV2h5IHlvdSBkb24ndCB1c2UgLWYgb3B0aW9uIHdpdGggc3NoPyBJIHdv
dWxkbid0IHJlbHkgb24gc2xlZXAgMSBoZXJlLgpHb29kIGlkZWEsIEkgZGlkIG5vdCB0aGluayBh
Ym91dCAtZi4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
