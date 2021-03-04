Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37C32D1AA
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 12:23:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3EB33C5685
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 12:23:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B77A23C4C0F
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 12:23:21 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AE00C140114E
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 12:23:20 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA98164F0A;
 Thu,  4 Mar 2021 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614856998;
 bh=ATRq1K4aXnURfrCxB9naFZ2vK8QttOmkqhGzAxe7gEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LAiUXvqTs1vJCPEvCrqjnOLwReOJAWnhu+4rXljsOMhL1CqPMu4G+N7YTYl+LIlgZ
 O65jZBPxNQPm/z2r8GVe/kKSL5f7x/qgPxyLXSsJWfxNoruoQruiyEr0GTVyxGJZi6
 G11tkuis3fSfY6KyprTDA4ZlSvKG5UwFAeS/hO5o=
Date: Thu, 4 Mar 2021 12:23:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YEDDIzz32JqSvi1S@kroah.com>
References: <20210302192719.741064351@linuxfoundation.org>
 <CA+G9fYvkW+84U9e0Cjft_pq9bGnBBqCXST7Hg+gx4pKNyuGPFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvkW+84U9e0Cjft_pq9bGnBBqCXST7Hg+gx4pKNyuGPFQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-stable <stable@vger.kernel.org>, pavel@denx.de,
 Andrew Morton <akpm@linux-foundation.org>, Jon Hunter <jonathanh@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCBNYXIgMDMsIDIwMjEgYXQgMDI6MDI6MjBQTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gT24gV2VkLCAzIE1hciAyMDIxIGF0IDAwOjU5LCBHcmVnIEtyb2FoLUhhcnRtYW4K
PiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoaXMgaXMgdGhl
IHN0YXJ0IG9mIHRoZSBzdGFibGUgcmV2aWV3IGN5Y2xlIGZvciB0aGUgNS4xMS4zIHJlbGVhc2Uu
Cj4gPiBUaGVyZSBhcmUgNzczIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBv
c3RlZCBhcyBhIHJlc3BvbnNlCj4gPiB0byB0aGlzIG9uZS4gIElmIGFueW9uZSBoYXMgYW55IGlz
c3VlcyB3aXRoIHRoZXNlIGJlaW5nIGFwcGxpZWQsIHBsZWFzZQo+ID4gbGV0IG1lIGtub3cuCj4g
Pgo+ID4gUmVzcG9uc2VzIHNob3VsZCBiZSBtYWRlIGJ5IFRodSwgMDQgTWFyIDIwMjEgMTk6MjU6
MDcgKzAwMDAuCj4gPiBBbnl0aGluZyByZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUg
dG9vIGxhdGUuCj4gPgo+ID4gVGhlIHdob2xlIHBhdGNoIHNlcmllcyBjYW4gYmUgZm91bmQgaW4g
b25lIHBhdGNoIGF0Ogo+ID4gICAgICAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51
eC9rZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNoLTUuMTEuMy1yYzMuZ3oKPiA+IG9yIGlu
IHRoZSBnaXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+ID4gICAgICAgICBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQg
bGludXgtNS4xMS55Cj4gPiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiA+
Cj4gPiB0aGFua3MsCj4gPgo+ID4gZ3JlZyBrLWgKPiAKPiAKPiBSZXN1bHRzIGZyb20gTGluYXJv
4oCZcyB0ZXN0IGZhcm0uCj4gQWxsIG91ciBidWlsZHMgYXJlIGdldHRpbmcgUEFTUyBub3cuCj4g
QnV0LAo+IFJlZ3Jlc3Npb25zIGRldGVjdGVkIG9uIGFsbCBkZXZpY2VzIChhcm02NCwgYXJtLCB4
ODZfNjQgYW5kIGkzODYpLgo+IExUUCBwdHkgdGVzdCBjYXNlIGhhbmd1cDAxIGZhaWxlZCBvbiBh
bGwgZGV2aWNlcwo+IAo+IGhhbmd1cDAxICAgIDEgIFRGQUlMICA6ICBoYW5ndXAwMS5jOjEzMzog
dW5leHBlY3RlZCBtZXNzYWdlIDMKPiAKPiBSZXBvcnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0
aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPgo+IAo+IFRoaXMgZmFpbHVyZSBpcyBzcGVj
aWZpYyB0byBzdGFibGUtcmMgdjUuMTAuMjAtcmM0IGFuZCB2NS4xMS4zLXJjMwo+IFRlc3QgUEFT
UyBvbiB0aGUgdjUuMTItcmMxIG1haW5saW5lIGFuZCBMaW51eCBuZXh0IGtlcm5lbC4KPiAKPiBG
b2xsb3dpbmcgdHdvIGNvbW1pdHMgY2F1c2VkIHRoaXMgdGVzdCBmYWlsdXJlLAo+IAo+ICAgIExp
bnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiAgICAgICAgdHR5
OiBpbXBsZW1lbnQgcmVhZF9pdGVyCj4gCj4gICAgTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgo+ICAgICAgICB0dHk6IGNvbnZlcnQgdHR5X2xkaXNjX29wcyAn
cmVhZCgpJyBmdW5jdGlvbiB0byB0YWtlIGEga2VybmVsIHBvaW50ZXIKPiAKPiBUZXN0IGNhc2Ug
ZmFpbGVkIGxpbmssCj4gaHR0cHM6Ly9xYS1yZXBvcnRzLmxpbmFyby5vcmcvbGtmdC9saW51eC1z
dGFibGUtcmMtbGludXgtNS4xMS55L2J1aWxkL3Y1LjExLjItNzc0LWc2Y2E1MmRiYzU4ZGYvdGVz
dHJ1bi80MDcwMTQzL3N1aXRlL2x0cC1wdHktdGVzdHMvdGVzdC9oYW5ndXAwMS9sb2cKPiAKClRo
YW5rcyBmb3IgdGVzdGluZyB0aGVtIGFsbCwgSSdsbCB0cnkgdG8gZGVidWcgdGhpcyBsYXRlciB0
b2RheS4uLgoKZ3JlZyBrLWgKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
