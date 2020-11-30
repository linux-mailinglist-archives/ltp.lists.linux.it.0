Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A32C7F4A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 08:53:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E46F23C5935
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 08:53:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D95E93C2C13
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 08:53:43 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E8DC16007BF
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 08:53:42 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C7126A07F1
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1606722820; bh=piErjzr008X6HRFwebZ7ZMYEJIp6VJPvFX2goV+k6SM=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Il3w4cajp9Y1OOU2Q5TgeFufNTg3Jt+2LwcfwaR/wVrU+qnNCjcIeiNKcgwPBVj0U
 TBu/nE8eRim4ashAa5SQJSxrsAAEbPepMNOUcqgtCz28ocLx8+rGV9CdH8V4edtaHe
 729cqYabnipYxBxhXZJuHKO3DsbxNBodwbc6Omps=
To: ltp@lists.linux.it
References: <20201125101633.30154-1-liwang@redhat.com>
 <87eekhof3i.fsf@suse.de> <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
 <87blflo9hx.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f9b2e084-f2e0-1016-f505-6218d7c1853e@jv-coder.de>
Date: Mon, 30 Nov 2020 08:53:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87blflo9hx.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fzsync: skip test when avaliable CPUs less than 2
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

SGksCj4+IE5vLCBhZl9hbGcwNyByZXF1aXJlcyAyIENQVXMsIG90aGVyd2lzZSBpdCdsbCByZXBv
cnQgZmFsc2UgcG9zaXRpdmVzLgo+PiBUaGUgdGVzdCB3aWxsIHBhc3Mgb25seSBpZiBmY2hvd25h
dCgpIGhpdHMgYSBoYWxmLWNsb3NlZCBzb2NrZXQgYW5kCj4+IHJldHVybnMgZXJyb3IuIEJ1dCBJ
SVJDIHRoZSBoYWxmLWNsb3NlZCBzb2NrZXQgd2lsbCBiZSBkZXN0cm95ZWQgZHVyaW5nCj4+IHJl
c2NoZWR1bGUgd2hpY2ggbWVhbnMgdGhlcmUncyBubyByYWNlIHdpbmRvdyB0byBoaXQgYW55bW9y
ZS4gQnV0IGl0Cj4+IHdvdWxkIGJlIGJldHRlciB0byBwdXQgdGhlIFRDT05GIGNvbmRpdGlvbiBp
bnRvIHRoZSB0ZXN0IGl0c2VsZi4KPiBJbnRlcmVzdGluZywgSSB3b25kZXIgaWYgdGhpcyBpcyBh
bHNvIHRydWUgZm9yIHRoZSByZWFsLXRpbWUga2VybmVsIHdpdGgKPiB0aGUgdGhyZWFkcyBzZXQg
dG8gUlQgcHJpb3JpdHk/Ckl0IGxvb2tzIGxpa2UgdGhlIHRlc3QgY2FuIGZhaWwgZXZlbiB3aXRo
IG1vcmUgdGhhbiBvbmUgY3B1LiBJJ3ZlIHNlZW4gCnRoaXMgc3BvcmFkaWMgZmFpbHVyZSBvbiBk
aWZmZXJlbnQgaGFyZHdhcmUgd2l0aCBtb3JlIHRoYW4gdHdvIGNvcmVzLCBhdCAKbGVhc3Qgb24g
aW50ZWwgZGVudmVydG9uICh4ODZfNjQpIGFuZCByZW5lc2FzIHItY2FyIChhYXJjaDY0KSBzeXN0
ZW1zLiAKQm90aCB3aXRoIGtlcm5lbCA0LjE5IHdpdGggdGhlIGZpeCBpbmNsdWRlZCwgb24gdGhl
IGRlbnZlcnRvbiBzeXN0ZW0gdGhlIApydCBwYXJjaGVzIHdlcmUgaW5jbHVkZWQgYW5kIG9uIHRo
ZSByLWNhciBub3QuIFRoZSB0ZXN0IHBhc3NlcyBtb3N0IG9mIAp0aGUgdGltZSwgYnV0IHNvbWV0
aW1lcyBmYWlscyB3aXRoIHRoZSBtZXNzYWdlIExpIHBvc3RlZC4KCkl0IGFsc28gc2VlbXMgdG8g
ZmFpbCBzcG9yYWRpY2FsbHkgb24gb3RoZXIgc3lzdGVtcyBhcyB3ZWxsOiAKaHR0cHM6Ly9idWdz
LmxhdW5jaHBhZC5uZXQvdWJ1bnR1LWtlcm5lbC10ZXN0cy8rYnVnLzE4OTI4NjAKCkFkZGl0aW9u
YWxseSBJIHRlc3RlZCBvbiBxZW11LXg4NiB3aXRoIDQuMTkgd2l0aCBhbmQgd2l0aG91dCBydCBw
YXRjaGVzLiAKVGhlIHRlc3Qgc3VjY2VlZHMgZXZlbiB3aXRoIG9ubHkgb25lIHZpcnR1YWxpemVk
IGNwdS4gU28gZWl0aGVyIE1hcnRpbidzIAphc3N1bXB0aW9uIGlzIHdyb25nIG9yIGl0IGhvbGRz
IG9ubHkgZm9yIG5ld2VyIGtlcm5lbCB2ZXJzaW9ucz8KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
