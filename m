Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843D3B188C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:11:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3B9F3C6FDB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:11:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63D583C2E72
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:11:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AA2291A00882
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:11:43 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1B8AC21940;
 Wed, 23 Jun 2021 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624446703;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3cUgGxAhYtabqs1+p91ch2bWH+SMYcanEHi5vatiJc=;
 b=YKaYckHu7VOR3mMePzklz7hKBr2Z4bgJL7s36NUm5eyvmM2Nqgl0WrK9fJEqno2ouevHoe
 Cgg2NpmCpmINCITBKfqLzQ8rmYz5bY74g6MwMUhASP56XkgVanHMRwH6UQ2pBmwGvoC26p
 1nZszK+N+th3RRo/Tma0HtIlCAbqB30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624446703;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3cUgGxAhYtabqs1+p91ch2bWH+SMYcanEHi5vatiJc=;
 b=/pW18dDxTko3+B4yhFAQ2Aps1WUUjD3982+jVHAM3Mh/d2GWx0I4kQdKEJ2Ys31hA4eSsB
 JpY3D13qOtjtzVBg==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 89BBEA3B81;
 Wed, 23 Jun 2021 11:11:42 +0000 (UTC)
References: <20210623071543.171021-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20210623071543.171021-1-lkml@jv-coder.de>
Date: Wed, 23 Jun 2021 12:11:41 +0100
Message-ID: <87mtrg4yz6.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] cpuset_regression_test: convert and improve
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gSm9lcmcsCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4g
SGksCj4KPiB0aGlzIGlzIG1vcmUgb3IgbGVzcyBhIHYyIG9mIGEgcGF0Y2ggSSBzZW5kIHByZXZp
b3VzbHkgKHBhdGNoIDMpLgo+IEkga25vdyB0aGF0IHJpY2hhcmQgaXMgbm90IGVudGlyZWx5IGhh
cHB5IHdpdGggdGhpcyBwYXRjaCwgSSB3aWxsCj4gZ2l2ZSBpdCBhbm90aGVyIHRyeSBhbnl3YXku
Li4KPiBJdCBpcyBlaXRoZXIgdGhpcyBwYXRjaCBvciBhbm90aGVyIHBhdGNoLCB0aGF0IGhhcyB0
byBsb29rIHRocm91Z2gKPiB0aGUgY2dyb3VwIGhpZXJhcmNoeSwgdG8gY2hlY2sgaWYgdGhlcmUg
aXMgYW55IGdyb3VwLHRoYXQgZXhwbGljaXRlbHkKPiB1c2VzIGNwdSAwLgoKSWYgaXQgaXMgYWxy
ZWFkeSBiZWluZyB1c2VkIHRoZW4gY2FuIHlvdSBzZXQgaXQ/Cgo+Cj4gVG8gbWUsIGl0IGlzIGEg
YmV0dGVyIHNvbHV0aW9uIHRvIGp1c3QgY2hhbmdlIGdyb3VwcyBmb3IgYSBzaG9ydCB0aW1lLAo+
IGFuZCBjaGVjayBpZiB0aGUgYnVnIGV4aXN0cy4gSWYgbHRwIHRlc3RzIGFyZSBydW5uaW5nLCB0
aGUgY2hhbmNlLCB0aGF0Cj4gdGhlcmUgaXMgYW55dGhpbmcgcnVubmluZywgdGhhdCByZWFsbHkg
bmVlZHMgYSBjb3JyZWN0IGNwdXNldCBpcyB2ZXJ5IGxvdy4KPiBJIGFtIGNvbW1pbmcgZnJvbSBh
IHN5c3RlbSwgd2hlcmUgY2dyb3VwcyBhcmUgc2V0dXAgYnkgYSBjb250YWluZXIgbGF1bmNoZXIs
Cj4gdGhhdCBqdXN0IGhhcHBlbnMgdG8gYXNzaWduIGNwdXMgdG8gdGhlIGNvbnRhaW5lcnMgLSBu
b3QgZXZlbiBleGNsdXNpdmVseS4KPiBMVFAgdGVzdHMgYXJlIHVzZWQgYXMgc29tZSBwYXJ0IG9m
IHRoZSB0ZXN0c3VpdGUsIHRvIHRlc3QgYXMgY2xvc2UgdG8gYQo+IHByb2R1Y3Rpb24gc3lzdGVt
IGFzIHBvc3NpYmxlLgoKSSB3YXMgdGhpbmtpbmcgdGhhdCBpZiB5b3UgYXJlIGFscmVhZHkgdXNp
bmcgQ1BVIHNldHMgdGhlbiB5b3UgZWl0aGVyCmRvbid0IGhhdmUgdGhlIGJ1ZyBvciB5b3Ugd29u
J3QgaGl0IGl0IG9uIHlvdXIgc2V0dXAocyk/IElmIHNvIHRoZW4gdGhlCnRlc3QgaXMgcmVkdW5k
YW50LgoKPgo+IFRoZSBvbmx5IHdheSBJIGNvdWxkIHRoaW5rIG9mIGEgcHJvY2VzcyBtaXNiZWhh
dmluZyBieSBkaXNhYmVsaW5nIGNwdSBwaW5uaW5nLAo+IHdvdWxkIGJlIGEgYmFkbHkgd3JpdHRl
biBtdWx0aXRocmVhZCBhcHBsaWNhdGlvbiwgdGhhdCBjYW5ub3QgY29ycmVjdGx5IHJ1biwKPiBp
ZiB0aHJlYWRzIGFyZSByZWFsbHkgcnVubmluZyBpbiBwYXJhbGxlbCwgYnV0IHRoaXMgd291bGQg
YWxzbyByZXF1aXJlIGEgc2NoZWR1bGluZwo+IHBvbGljeSwgdGhhdCBtYWtlcyBzY2hlZHVsaW5n
IHBvaW50cyBwcmVkaWNhdGFibGUuIFdoaWxlIEkga25vdyB0aGF0IHNvZnR3YXJlIGxpa2UKPiB0
aGF0IGV4aXN0cyAoaW4gZmFjdCBJIHdhcyB3b3JraW5nIG9uIHNvbWV0aGluZyBsaWtlIHRoYXQg
aW4gdGhlIHBhc3QpLCBJIHRoaW5rIGl0Cj4gaXMgaGlnaGx5IHVubGlrZWx5LCB0aGF0IGl0IGlz
IHJ1bm5pbmcgcGFyYWxsZWwgdG8gbHRwLgo+IEFuZCBldmVuIHRoZW4sIHRoaXMgY291bGQgYmUg
bWl0aWdhdGVkIGJ5IG5vdCBqdXN0IHNldHRpbmcgY3B1IGJpbmRpbmcgdG8gdW5kZWZpbmVkLAo+
IGJ1dCB0byBvbmUgZml4ZWQgY29yZS4gQnV0IHdpdGggdGhlIGNoYW5nZXMgaW4gcGF0Y2ggMiwg
dGhpcyBpcyBub3QKPiBwb3NzaWJsZS4KPgo+IEJ1dCBhbnlob3cgbHRwIGZpZGRsZXMgd2l0aCBs
b3RzIG9mIGNyaXRpY2FsIHN5c3RlbSBwYXJhbWV0ZXJzIGR1cmluZyBpdCdzIHJ1bnRpbWUsCj4g
dGhlcmUgaXMgbm8gZ3VhcmFudGVlLCB0aGF0IGFuIGFwcGxpY2F0aW9uIHRoYXQgcmVxdWlyZXMg
c29tZSB2ZXJ5IHNwZWNpZmljIGtlcm5lbAo+IHJ1bnRpbWUgc2V0dGluZ3Mgc3Vydml2ZXMgdGhp
cy4gVGhhdCdzIHdoeSBJIHdvdWxkIHN0aWxsIHZvdGUgZm9yIHRoaXMgcGF0Y2guCj4KPiBKw7Zy
ZwoKSSBzdGlsbCB0aGluayBpdCBoYXMgYSBzbWFsbCBjaGFuY2Ugb2YgY2F1c2luZyBwcm9ibGVt
cyBmb3IgdXMuIFRoZXJlCmFyZSBzb21lIGhldGVyb2dlbmVvdXMgQ1BVIHN5c3RlbXMgd2hlcmUg
Y29udHJvbCBzb2Z0d2FyZSBzaG91bGQgcnVuIG9uCmEgZ2l2ZW4gQ1BVLiBJIGRvbid0IGtub3cg
d2hldGhlciBDR3JvdXBzIGFyZSB1c2VkIHRvIGNvbnRyb2wgdGhhdCBvciBpZgppdCB3b3VsZCBt
YXR0ZXIgaWYgdGhlIHByb2Nlc3MgaXMgbW92ZWQgdGVtcG9yYXJpbHkuIEl0J3MganVzdCBhIHNt
YWxsCnJpc2sgSSB3b3VsZCBhdm9pZCBpZiB0aGUgdGVzdCBpcyBub3QgcmVhbGx5IHdvcnRoIGl0
LgoKT1RPSCB0aGUgcGF0Y2ggbG9va3MgZ29vZCBvdGhlcndpc2UsIHNvIGl0IHNob3VsZCBiZSBt
ZXJnZWQgaWYgbm8gb25lCmVsc2UgYWdyZWVzIHdpdGggbWUuCgotLSAKVGhhbmsgeW91LApSaWNo
YXJkLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
