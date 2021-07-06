Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B463BC8E0
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:59:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E73203C68B6
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:59:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D77E93C149E
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:59:18 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 589551000A2A
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:59:18 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0DF009F7F3;
 Tue,  6 Jul 2021 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625565557; bh=vLLFKjIE4MGENyvNKHYMoBRE21+H35tGhLS8ihO3/mE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=t5xJhT55dEeQZJzTvReZtm3jwzh4ENTCt/di4pY2zOxV2Q8gxbZOFVZS/rO4osykX
 9ISqVmxX2nJLY+9GLk6QHI3FcFq7gpKr20+W+ONCXd3TmVnxcQzGQJzYmdxvjau0w3
 sr/IVLewImolCLREo30UXrBjHF8nNTRlEdh3QDTY=
To: rpalethorpe@suse.de
References: <20210705135014.679200-1-lkml@jv-coder.de> <87wnq37p2j.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a4595bcc-15e5-e79a-bd95-143630a33774@jv-coder.de>
Date: Tue, 6 Jul 2021 11:59:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87wnq37p2j.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/1] fs_bind: Convert to ltp tests
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

SGkgUmljaGFyZCwKCk9uIDcvNi8yMDIxIDExOjQ1IEFNLCBSaWNoYXJkIFBhbGV0aG9ycGUgd3Jv
dGU6Cj4gSGVsbG8gSm9lcmcsCj4KPiBKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdy
aXRlczoKPgo+PiBIaSBldmVyeW9uZSwKPj4KPj4gSSBrbm93IHRoaXMgaXMgYSBodWdlIGNoYW5n
ZXNldCwgYnV0IHRoZXJlIGlzIG5vdCByZWFsbHkgYSBnb29kIHdheSB0bwo+PiBicmVhayBpdCBk
b3duIGludG8gbXVsdGlwbGUgY29tbWl0cy4gRXZlcnkgc3RlcCBpbiBiZXR3ZWVuIHdvdWxkIGVp
dGhlcgo+PiBsZWFkIHRvIGEgYnJva2VuIHRlc3Qgc3VpdGUgb3IgYSBjaGFuZ2UsIHRoYXQgaXMg
dGhlbiBjaGFuZ2VkIGFnYWluLgo+PiBTbyBJIG1hZGUgdGhpcyBvbmUgaHVnZSBjb21taXQsIHRo
YXQgY29udmVydHMgYWxsIG9mIHRoZSB0ZXN0cyBvZiB0aGUKPj4gdGVzdHN1aXRlIGluIG9uZSBn
by4KPiBJdCBzZWVtcyBsaWtlIHRoZXJlIGFyZSBubyBmaWxlIHJlbmFtZXMgKGFjY29yZGluZyB0
byBHaXQpLCBidXQgbWFueQo+IGZpbGVzIGFyZSBkZWxldGVkIGFuZCBjcmVhdGVkLiBTbyB5b3Ug
Y291bGQgc3BsaXQgdGhlIGNvbW1pdCBpbnRvIGEKPiBkZWxldGlvbiBwYXRjaCBhbmQgYSBjcmVh
dGlvbiBwYXRjaC4KPgo+IEkgZ3Vlc3MgdGhlIGRlbGV0aW9uIHBhdGNoIG1pZ2h0IGhhdmUgdG8g
cmVtb3ZlIHNvbWUgcnVudGVzdCBmaWxlCj4gZW50cmllcyB0ZW1wb3JhcmlseT8gSG93ZXZlciBJ
IGRvbid0IHNlZSBhIGJpZyBwcm9ibGVtIHdpdGggdGhhdC4KQWN0dWFsbHkgbW9zdCBkZWxldGlv
bnMgYXJlIHJlbmFtZXMsIHRoYXQgZ2l0IGp1c3QgZGlkIG5vdCBwaWNrIHVwLCAKYmVjYXVzZSBv
ZiB0aGUgaW1tZW5zZQpjaGFuZ2VzIGluIHRoZSB0ZXN0cy4KSSBjb3VsZCBhZGQgdHdvIHBhdGNo
ZXM6CjEuIHJlbmFtZSAoQW5kIGRlbGV0ZSBvbGQgdGVzdHJ1bm5lciBzdHVmZiBhbmQgcnVudGVz
dCBlbnRyaWVzKQoyLiBBcHBseSBhbGwgY2hhbmdlcwoKVGhpcyBzaG91bGQgYWxsb3cgYmV0dGVy
IHJldmlldyBvZiB0aGUgYWN0dWFsIGNoYW5nZXMsIGF0IGxlYXN0IGZvciBtb3N0IAp0ZXN0cy4K
CkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
