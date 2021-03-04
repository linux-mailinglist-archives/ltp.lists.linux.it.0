Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6B32D83B
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 18:02:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B4713C5672
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 18:02:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C959E3C5669
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 18:02:29 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DAF5C1A00CA7
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 18:02:28 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D375864F5F;
 Thu,  4 Mar 2021 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614877346;
 bh=olDcRtJ+t+lJRyUWeLlACC10m/jXX6cmy5ZSvP7+fMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1c8dYmxPme5nDJ5jJBax+akaxmeavwP2zwTlE9GI8aR60FlohQKfh7hHPgKbGI97
 gSBQ4zE2Vyo0AGD4FO+YIpL9l+apuq5uVhx2ieIXVz12G13RtPlR0tuBF++VUR/WOT
 CWIPlRNQoh+x24S8XNiUzDB5Icai1lA69GAocw7Y=
Date: Thu, 4 Mar 2021 18:02:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <YEESn1JboVRjfJGN@kroah.com>
References: <20210302192719.741064351@linuxfoundation.org>
 <CA+G9fYvkW+84U9e0Cjft_pq9bGnBBqCXST7Hg+gx4pKNyuGPFQ@mail.gmail.com>
 <YEDDIzz32JqSvi1S@kroah.com> <20210304165247.GA131220@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304165247.GA131220@roeck-us.net>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.11 000/773] 5.11.3-rc3 review
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-stable <stable@vger.kernel.org>, pavel@denx.de,
 Andrew Morton <akpm@linux-foundation.org>, Jon Hunter <jonathanh@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBNYXIgMDQsIDIwMjEgYXQgMDg6NTI6NDdBTSAtMDgwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiBPbiBUaHUsIE1hciAwNCwgMjAyMSBhdCAxMjoyMzoxNVBNICswMTAwLCBHcmVnIEty
b2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiBPbiBXZWQsIE1hciAwMywgMjAyMSBhdCAwMjowMjoyMFBN
ICswNTMwLCBOYXJlc2ggS2FtYm9qdSB3cm90ZToKPiA+ID4gT24gV2VkLCAzIE1hciAyMDIxIGF0
IDAwOjU5LCBHcmVnIEtyb2FoLUhhcnRtYW4KPiA+ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgdGhlIHN0YXJ0IG9mIHRoZSBzdGFi
bGUgcmV2aWV3IGN5Y2xlIGZvciB0aGUgNS4xMS4zIHJlbGVhc2UuCj4gPiA+ID4gVGhlcmUgYXJl
IDc3MyBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNw
b25zZQo+ID4gPiA+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNzdWVzIHdpdGgg
dGhlc2UgYmVpbmcgYXBwbGllZCwgcGxlYXNlCj4gPiA+ID4gbGV0IG1lIGtub3cuCj4gPiA+ID4K
PiA+ID4gPiBSZXNwb25zZXMgc2hvdWxkIGJlIG1hZGUgYnkgVGh1LCAwNCBNYXIgMjAyMSAxOToy
NTowNyArMDAwMC4KPiA+ID4gPiBBbnl0aGluZyByZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWln
aHQgYmUgdG9vIGxhdGUuCj4gPiA+ID4KPiA+ID4gPiBUaGUgd2hvbGUgcGF0Y2ggc2VyaWVzIGNh
biBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gPiA+ID4gICAgICAgICBodHRwczovL3d3dy5r
ZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNoLTUuMTEu
My1yYzMuZ3oKPiA+ID4gPiBvciBpbiB0aGUgZ2l0IHRyZWUgYW5kIGJyYW5jaCBhdDoKPiA+ID4g
PiAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9z
dGFibGUvbGludXgtc3RhYmxlLXJjLmdpdCBsaW51eC01LjExLnkKPiA+ID4gPiBhbmQgdGhlIGRp
ZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiA+ID4gPgo+ID4gPiA+IHRoYW5rcywKPiA+ID4g
Pgo+ID4gPiA+IGdyZWcgay1oCj4gPiA+IAo+ID4gPiAKPiA+ID4gUmVzdWx0cyBmcm9tIExpbmFy
b+KAmXMgdGVzdCBmYXJtLgo+ID4gPiBBbGwgb3VyIGJ1aWxkcyBhcmUgZ2V0dGluZyBQQVNTIG5v
dy4KPiA+ID4gQnV0LAo+ID4gPiBSZWdyZXNzaW9ucyBkZXRlY3RlZCBvbiBhbGwgZGV2aWNlcyAo
YXJtNjQsIGFybSwgeDg2XzY0IGFuZCBpMzg2KS4KPiA+ID4gTFRQIHB0eSB0ZXN0IGNhc2UgaGFu
Z3VwMDEgZmFpbGVkIG9uIGFsbCBkZXZpY2VzCj4gPiA+IAo+ID4gPiBoYW5ndXAwMSAgICAxICBU
RkFJTCAgOiAgaGFuZ3VwMDEuYzoxMzM6IHVuZXhwZWN0ZWQgbWVzc2FnZSAzCj4gPiA+IAo+ID4g
PiBSZXBvcnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5h
cm8ub3JnPgo+ID4gPiAKPiA+ID4gVGhpcyBmYWlsdXJlIGlzIHNwZWNpZmljIHRvIHN0YWJsZS1y
YyB2NS4xMC4yMC1yYzQgYW5kIHY1LjExLjMtcmMzCj4gPiA+IFRlc3QgUEFTUyBvbiB0aGUgdjUu
MTItcmMxIG1haW5saW5lIGFuZCBMaW51eCBuZXh0IGtlcm5lbC4KPiA+ID4gCj4gPiA+IEZvbGxv
d2luZyB0d28gY29tbWl0cyBjYXVzZWQgdGhpcyB0ZXN0IGZhaWx1cmUsCj4gPiA+IAo+ID4gPiAg
ICBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiA+ICAg
ICAgICB0dHk6IGltcGxlbWVudCByZWFkX2l0ZXIKPiA+ID4gCj4gPiA+ICAgIExpbnVzIFRvcnZh
bGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+ID4gICAgICAgIHR0eTogY29u
dmVydCB0dHlfbGRpc2Nfb3BzICdyZWFkKCknIGZ1bmN0aW9uIHRvIHRha2UgYSBrZXJuZWwgcG9p
bnRlcgo+ID4gPiAKPiA+ID4gVGVzdCBjYXNlIGZhaWxlZCBsaW5rLAo+ID4gPiBodHRwczovL3Fh
LXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4LXN0YWJsZS1yYy1saW51eC01LjExLnkvYnVp
bGQvdjUuMTEuMi03NzQtZzZjYTUyZGJjNThkZi90ZXN0cnVuLzQwNzAxNDMvc3VpdGUvbHRwLXB0
eS10ZXN0cy90ZXN0L2hhbmd1cDAxL2xvZwo+ID4gPiAKPiA+IAo+ID4gVGhhbmtzIGZvciB0ZXN0
aW5nIHRoZW0gYWxsLCBJJ2xsIHRyeSB0byBkZWJ1ZyB0aGlzIGxhdGVyIHRvZGF5Li4uCj4gPiAK
PiAKPiBEaWQgeW91IHNlZSBteSByZXNwb25zZSB0byB2NS4xMC55ID8gSXQgbG9va3MgbGlrZSB0
d28gcmVsYXRlZCBwYXRjaGVzCj4gbWF5IGJlIG1pc3NpbmcgZnJvbSB2NS4xMC55IGFuZCB2NS4x
MS55LgoKSSBkaWQsIHRoYW5rIHlvdSwgSSBuZWVkIHRvIGdldCB0aHJvdWdoIHNvbWUgb3RoZXIg
dGFza3MgZmlyc3QgYmVmb3JlCnRyeWluZyB0aGUgcmVwcm9kdWNlciBhbmQgc2VlIGlmIHRoZSBw
YXRjaGVzIHlvdSBsaXN0IGZpeCBpdCBvciBub3QuLi4KCnRoYW5rcywKCmdyZWcgay1oCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
