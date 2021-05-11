Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C737379F5A
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 07:52:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E98B03C4E41
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 07:52:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 716953C21FE
 for <ltp@lists.linux.it>; Tue, 11 May 2021 07:52:27 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9712B600807
 for <ltp@lists.linux.it>; Tue, 11 May 2021 07:52:26 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B13579FBF9;
 Tue, 11 May 2021 05:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620712344; bh=ggmuaK12ZCJTSKaeBgNoPN8M4M/P13Rc3UbnvYph0aM=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=QsLSdyHTwLoEZJepzMaD4W3rWlS3bCXqwMnd+eDcdY20fs9GrbzWgez2MUzkA5v3s
 UYAX28Y8TpZzP/F4CIgyzVYCri0UA5VjGSVTAH9dwcJgYUne/d7BBjLT0F+gekdx37
 K1G5gfdJYyTxg1EUY1l0SWgHu1aqG01JeXUuQ6hE=
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
References: <20210508055109.16914-4-liwang@redhat.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
Date: Tue, 11 May 2021 07:54:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210508055109.16914-4-liwang@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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

SGkgTGksCgpmaXJzdCBvZiBhbGwgdGhhbmtzIGZvciBmaXhpbmcgbXkgcGF0Y2hzZXQgYW5kIGdl
dHRpbmcgaXQgbWVyZ2VkLgoKT24gNS84LzIwMjEgNzo1MSBBTSwgTGkgV2FuZyB3cm90ZToKPiBX
ZSBoYXZlIHRvIGd1YXJhbnRlZSBfdHN0X2tpbGxfdGVzdCBhbGl2ZSBmb3IgYSB3aGlsZSB0byBj
aGVjayBpZgo+IHRoZSB0YXJnZXQgdGVzdCBlaXhzdCBvciBub3QsIHNvIGlnbm9yZSBTSUdJTlQg
aW4gX3RzdF9raWxsX3Rlc3QKPiBpcyBuZWNlc3NhcnksIG90aGVyd2lzZSBpdCB3aWxsIGJlIHN0
b3BwZWQgYnkgdGhlIFNJR0lOVCBzZW5kaW5nCj4gYnkgaXRzZWxmLgo+Cj4gVGhlIHRpbWVvdXQw
My5zaCB2ZXJpZnkgdGhpcyBtZWNoYW5pc20gcHJvY2Nlc3Mgd2VsbCBpbiBvdXRwdXQ6Cj4KPiAg
ICB0aW1lb3V0MDMgMSBUQlJPSzogVGVzdCB0aW1lb3V0ZWQsIHNlbmRpbmcgU0lHSU5UISBJZiB5
b3UgYXJlIHJ1bm5pbmcgb24gc2xvdyBtYWNoaW5lLCB0cnkgZXhwb3J0aW5nIExUUF9USU1FT1VU
X01VTCA+IDEKPiAgICB0aW1lb3V0MDMgMSBUQlJPSzogdGVzdCBpbnRlcnJ1cHRlZCBvciB0aW1l
ZCBvdXQKPiAgICB0aW1lb3V0MDMgMSBUUEFTUzogdGVzdCBydW4gY2xlYW51cCBhZnRlciB0aW1l
b3V0Cj4gICAgdGltZW91dDAzIDEgVElORk86IFRlc3QgaXMgc3RpbGwgcnVubmluZywgd2FpdGlu
ZyAxMHMKPiAgICB0aW1lb3V0MDMgMSBUSU5GTzogVGVzdCBpcyBzdGlsbCBydW5uaW5nLCB3YWl0
aW5nIDlzCj4gICAgdGltZW91dDAzIDEgVElORk86IFRlc3QgaXMgc3RpbGwgcnVubmluZywgd2Fp
dGluZyA4cwo+ICAgIHRpbWVvdXQwMyAxIFRJTkZPOiBUZXN0IGlzIHN0aWxsIHJ1bm5pbmcsIHdh
aXRpbmcgN3MKPiAgICB0aW1lb3V0MDMgMSBUSU5GTzogVGVzdCBpcyBzdGlsbCBydW5uaW5nLCB3
YWl0aW5nIDZzCj4gICAgdGltZW91dDAzIDEgVElORk86IFRlc3QgaXMgc3RpbGwgcnVubmluZywg
d2FpdGluZyA1cwo+ICAgIHRpbWVvdXQwMyAxIFRJTkZPOiBUZXN0IGlzIHN0aWxsIHJ1bm5pbmcs
IHdhaXRpbmcgNHMKPiAgICB0aW1lb3V0MDMgMSBUSU5GTzogVGVzdCBpcyBzdGlsbCBydW5uaW5n
LCB3YWl0aW5nIDNzCj4gICAgdGltZW91dDAzIDEgVElORk86IFRlc3QgaXMgc3RpbGwgcnVubmlu
Zywgd2FpdGluZyAycwo+ICAgIHRpbWVvdXQwMyAxIFRJTkZPOiBUZXN0IGlzIHN0aWxsIHJ1bm5p
bmcsIHdhaXRpbmcgMXMKPiAgICB0aW1lb3V0MDMgMSBUQlJPSzogVGVzdCBzdGlsbCBydW5uaW5n
LCBzZW5kaW5nIFNJR0tJTEwKPiAgICBLaWxsZWQKQXQgZmlyc3QgSSBkaWQgYm90IHVuZGVyc3Rh
bmQgdGhlIHByb2JsZW0geW91IGZvdW5kLCBiZWNhdXNlIEkgdHJpZWQgCndpdGggZGFzaCwgYnVz
eWJveCBzaCBhbmQgenNoLgpBbGwgdGhyZWUgc2hlbGxzIGhhZCBubyBwcm9ibGVtIGhlcmUuIEJ1
dCB0aGVuIEkgdHJpZWQgd2l0aCBiYXNoIGFuZCBpdCAKZmFpbGVkLgoKSSB3b25kZXIgaWYgdGhp
cyBpcyBhIGJ1ZyBpbiBiYXNoIG9yIGluIHRoZSBvdGhlciBzaGVsbHMuIEkgZ3Vlc3MgCnNlbmRp
bmcgdGhlIHNpZ25hbCB0byB0aGUgd2hvbGUKcHJvY2VzcyBncm91cCBzaG91bGQgYWxzbyBzZW5k
IGl0IHRvIHRoZSBwcm9jZXNzIHJ1bm5pbmcgX3RzdF9raWxsX3Rlc3QuCgpJIGRpZCBzb21lIGRp
Z2dpbmcgaW50byB0aGlzIHdoaWxlIHdyaXRpbmcgdGhpcyAoc2VlIGNvbmNsdXNpb24gYmVsb3cg
CmZvciByZXN1bHRzIG9ubHkpOgoxLiBBbGwgc2hlbGxzIGhhdmUgdGhlaXIgb3duIGltcGxlbWVu
dGF0aW9uIG9mIGtpbGwgKGNvbXBhcmUgPFNIRUxMPiAtYyAKa2lsbCB3aXRoIC91c3IvYmluIGtp
bGwpCjIuIFdoZW4gcmVwbGFjaW5nICJqdXN0IiBraWxsIGluIHRoZSBzY3JpcHQgd2l0aCAvdXNy
L2Jpbi9raWxsLCBpdCBzdGlsbCAKb25seSBmYWlscyBpbiBiYXNoLgozLiB6c2ggc2VlbXMgdG8g
aWdub3JlIFNJR0lOVCwgYnV0IGl0IGNhbiBiZSBjYXVnaHQgdXNpbmcgdHJhcC4gYnVzeWJveCAK
c2gsIGFuZCBkYXNoIGNhbid0IGV2ZW4gZ2V0IGl0IHdoZW4gdHJhcHBlZAo0LiB6c2ggZGlzYWJs
ZXMgU0lHSU5UIGJ5IGNhbGxsaW5nICJ0cmFwICcnIElOVCIgaW50ZXJuYWxseSBzb21laG93LiAK
V2hlbiByZXNldHRpbmcgU0lHSU5UIHRvIGRlZmF1bHQgYmVoYXZpb3IsIGl0IGlzIHRoZSBzYW1l
IGFzIGJhc2guCgpGb3IgenNoIHRoaXMgc2VlbXMgdG8gYmUgZGVmYXVsdCBiZWhhdmlvciBmb3Ig
YmFja2dyb3VuZCBwcm9jZXNzZXMsIApwcm9iYWJseSB0byBwcmV2ZW50IGtleWJvYXJkIGludGVy
cnVwdGlvbiBieSBDVFJMK0M6CnpzaCAtYyAidHJhcCYiCnRyYXAgLS0gJycgSU5UCnRyYXAgLS0g
JycgUVVJVAoKenNoIC1jICJ0cmFwIgojIE5vIG91dHB1dAoKCgpUbyBjb25jbHVkZToKLSBiYXNo
IGRvZXMgbm90IHNlZW0gdG8gY2FyZSBhYm91dCBTSUdJTlQgZGVsaXZlcnkgdG8gYmFja2dyb3Vu
ZCAKcHJvY2Vzc2VzLCBidXQgY2FuIGJlIGJsb2NrZWQgdXNpbmcgdHJhcAotIHpzaCBpZ25vcmVz
IFNJR0lOVCBmb3IgYmFja2dyb3VuZCBwcm9jZXNzZXMgYnkgZGVmYXVsdCwgYnV0IGNhbiBiZSAK
YWxsb3dlZCB1c2luZyB0cmFwCi0gZGFzaCBhbmQgYnVzeWJveCBzaCBpZ25vcmUgdGhlIHNpZ25h
bCB0byBiYWNrZ3JvdW5kIHByb2Nlc3NlcywgYW5kIAp0aGlzIGNhbm5vdCBiZSBjaGFuZ2VkIHdp
dGggdHJhcAoKSSB0cmllZCB3aXRoIHRoZSBmb2xsb3dpbmcgc25pcHBldHM6CjxTSEVMTD4gLWMg
J3RyYXAgImVjaG8gdHJhcDsiIElOVDsgKHNsZWVwIDI7IGVjaG8gZW5kIHN1YikgJiBzbGVlcCAx
OyAKa2lsbCAtSU5UIC0kJDsgZWNobyBlbmQgbWFpbicKPFNIRUxMPiAtYyAndHJhcCAiZWNobyB0
cmFwOyIgSU5UOyAodHJhcCAtIFNJR0lOVCBzbGVlcCAyOyBlY2hvIGVuZCBzdWIpIAomIHNsZWVw
IDE7IGtpbGwgLUlOVCAtJCQ7IGVjaG8gZW5kIG1haW4nCjxTSEVMTD4gLWMgJ3RyYXAgImVjaG8g
dHJhcDsiIElOVDsgKHRyYXAgImV4aXQiIFNJR0lOVCBzbGVlcCAyOyBlY2hvIGVuZCAKc3ViKSAm
IHNsZWVwIDE7IGtpbGwgLUlOVCAtJCQ7IGVjaG8gZW5kIG1haW4nCgpTSUdJTlQgaGFuZGxpbmcg
Zm9yIGNoaWxkIHByb2Nlc3NlcyBpcyBzdHJhbmdlLiBUaGlzIG1pZ2h0IGhhdmUgc29tZSAKaW1w
bGljYXRpb24gZm9yIHRoZSBzaGVsbCB0ZXN0cywKYmVjYXVzZSBpdCBpcyBwb3NzaWJsZSwgdGhh
dCBTSUdJTlQgaXMgbm90IGRlbGl2ZXJlZCB0byBhbGwgcHJvY2Vzc2VzIAphbmQgc29tZSBtYXkg
cmVzaWRlIGFzIG9ycGhhbnMuClNpbmNlIHRoaXMgY2FuIGhhcHBlbiBvbmx5IGluIGNhc2Ugb2Yg
dGltZW91dHMsIEkgZ3Vlc3MgdGhlcmUgaXMgbm8gcmVhbCAKUHJvYmxlbS4KCkEgcG9zc2libGUg
Zml4IGNvdWxkIGJlIHVzaW5nIFNJR1RFUk0gaW5zdGVhZCBvZiBTSUdJTlQuIFRoaXMgc2lnbmFs
IApkb2VzIG5vdCBzZWVtIHRvIGhhdmUgc29tZSAiaW50ZWxsaWdlbnQiIGhhbmRsaW5nIGZvciBi
YWNrZ3JvdW5kIHByb2Nlc3Nlcy4KSSBkbyBub3Qga25vdyB3aHkgTFRQIHVzZWQgU0lHSU5UIGlu
IHRoZSBmaXJzdCBwbGFjZS4gTXkgZmlyc3QgdGhvdWdodCAKd291bGQgaGF2ZSBiZWVuIHRvIHVz
ZSBTSUdURVJNLsKgIEl0IGlzIHRoZSB3YXkgdG8gInBvbGl0ZWx5IGFzayAKcHJvY2Vzc2VzIHRv
IHRlcm1pbmF0ZSIKCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
