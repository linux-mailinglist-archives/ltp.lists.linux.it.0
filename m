Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80595329894
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:57:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2115D3C56FC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:57:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 24D2F3C0BAF
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:57:02 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 67456600446
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:57:01 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3390064F0B;
 Tue,  2 Mar 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614679018;
 bh=vEWwVJMiQRTjUe8rmg1yH4IA6xGvkI4PhQEIFb8Y/s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vh7QmYK/q7sfFih+qxff+adMeVP4WLvQOw8N7pdDRa9syrrFGMxxPC4I0hZT6ktYH
 muvMZqAqvX4D5eeAQVCvAji6IRa/9JQJnVjvbo+HRW6fY4XYtEcZKZH0mDHi3+GsNh
 aSvANAKj+s1IM5kJuLZM9jb+Du0RWbfDA//bc8gs=
Date: Tue, 2 Mar 2021 10:56:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YD4L57LQb8Nh/A85@kroah.com>
References: <20210301193642.707301430@linuxfoundation.org>
 <CA+G9fYuK0k0FsnSk4egKOO=B0pV80bjp+f5E-0xPOfbPugQPxg@mail.gmail.com>
 <CA+G9fYsivUPRRQgMXpnA_XdXH8i2wx_DPH70t+6OzHkjOaswrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsivUPRRQgMXpnA_XdXH8i2wx_DPH70t+6OzHkjOaswrg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.10 000/661] 5.10.20-rc2 review
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-stable <stable@vger.kernel.org>, pavel@denx.de,
 Jiri Slaby <jirislaby@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Jon Hunter <jonathanh@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBNYXIgMDIsIDIwMjEgYXQgMDM6MjA6MzJQTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gSGkgR3JlZyBhbmQgTGludXMsCj4gCj4gT24gVHVlLCAyIE1hciAyMDIxIGF0IDEy
OjQ1LCBOYXJlc2ggS2FtYm9qdSA8bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gT24gVHVlLCAyIE1hciAyMDIxIGF0IDAxOjIxLCBHcmVnIEtyb2FoLUhhcnRtYW4KPiA+
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoaXMgaXMg
dGhlIHN0YXJ0IG9mIHRoZSBzdGFibGUgcmV2aWV3IGN5Y2xlIGZvciB0aGUgNS4xMC4yMCByZWxl
YXNlLgo+ID4gPiBUaGVyZSBhcmUgNjYxIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxs
IGJlIHBvc3RlZCBhcyBhIHJlc3BvbnNlCj4gPiA+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhh
cyBhbnkgaXNzdWVzIHdpdGggdGhlc2UgYmVpbmcgYXBwbGllZCwgcGxlYXNlCj4gPiA+IGxldCBt
ZSBrbm93Lgo+ID4gPgo+ID4gPiBSZXNwb25zZXMgc2hvdWxkIGJlIG1hZGUgYnkgV2VkLCAwMyBN
YXIgMjAyMSAxOTozNDo1MyArMDAwMC4KPiA+ID4gQW55dGhpbmcgcmVjZWl2ZWQgYWZ0ZXIgdGhh
dCB0aW1lIG1pZ2h0IGJlIHRvbyBsYXRlLgo+ID4gPgo+ID4gPiBUaGUgd2hvbGUgcGF0Y2ggc2Vy
aWVzIGNhbiBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gPiA+ICAgICAgICAgaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y1Lngvc3RhYmxlLXJldmlldy9wYXRjaC01
LjEwLjIwLXJjMi5nego+ID4gPiBvciBpbiB0aGUgZ2l0IHRyZWUgYW5kIGJyYW5jaCBhdDoKPiA+
ID4gICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
c3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQgbGludXgtNS4xMC55Cj4gPiA+IGFuZCB0aGUgZGlm
ZnN0YXQgY2FuIGJlIGZvdW5kIGJlbG93Lgo+ID4gPgo+ID4gPiB0aGFua3MsCj4gPiA+Cj4gPiA+
IGdyZWcgay1oCj4gPgo+ID4KPiA+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFybS4K
PiA+IFJlZ3Jlc3Npb25zIGRldGVjdGVkIG9uIGFsbCBkZXZpY2VzIChhcm02NCwgYXJtLCB4ODZf
NjQgYW5kIGkzODYpLgo+ID4KPiA+IGhhbmd1cDAxICAgIDEgIFRGQUlMICA6ICBoYW5ndXAwMS5j
OjEzMzogdW5leHBlY3RlZCBtZXNzYWdlIDMKPiA+Cj4gPiBUaGlzIGZhaWx1cmUgaXMgc3BlY2lm
aWMgdG8gc3RhYmxlLXJjIDUuMTAgYW5kIDUuMTEuCj4gPiBUZXN0IFBBU1Mgb24gbWFpbmxpbmUg
YW5kIExpbnV4IG5leHQga2VybmVsLgo+ID4KPiAKPiBJIGhhdmUgcmV2ZXJ0ZWQgdGhlc2UgdHdv
IHBhdGNoZXMgYW5kIHRoZSB0ZXN0IGNhc2UgZ290IFBBU1MKPiBvbiBMaW51eCB2ZXJzaW9uIDUu
MTAuMjAtcmMyLgo+IAo+IGhhbmd1cDAxIDEgVFBBU1MgOiBjaGlsZCBwcm9jZXNzIGV4aXRlZCB3
aXRoIHN0YXR1cyAwCj4gCj4gICAgTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgo+ICAgICAgICB0dHk6IGltcGxlbWVudCByZWFkX2l0ZXIKPiAKPiAgICBMaW51
cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gICAgICAgIHR0eTog
Y29udmVydCB0dHlfbGRpc2Nfb3BzICdyZWFkKCknIGZ1bmN0aW9uIHRvIHRha2UgYSBrZXJuZWwg
cG9pbnRlcgoKT2RkLgoKSXMgNS4xMi1yYzEgYWxzbyBmYWlsaW5nIHdpdGggdGhpcyB0ZXN0IGFz
IHdlbGw/Cgp0aGFua3MsCgpncmVnIGstaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
