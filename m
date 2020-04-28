Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4E1BB755
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 09:20:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4A733C5F3F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 09:20:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 767DD3C281C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 09:20:00 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 93D1B1A00E5A
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 09:19:59 +0200 (CEST)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MEFCF-1jJC3v2md3-00AHYs for <ltp@lists.linux.it>; Tue, 28 Apr 2020
 09:19:58 +0200
Received: by mail-qt1-f170.google.com with SMTP id e17so13108270qtp.7
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 00:19:58 -0700 (PDT)
X-Gm-Message-State: AGi0PuYWgKUsOAsd+QK33waK0YffU/+jOel8+fxtBXZzgdIMiZJAsD11
 nGqrdPTJ7rsBUp79AqbjGDk26LmBRooFhcrSHBE=
X-Google-Smtp-Source: APiQypLc3twcq059+K/MxjfAHrz6X/bweMb/VNhSuYdezpgto3lNjtajI9t953ZOtNWO3893yazOdTFDID7a2Nje2b4=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr26923442qtp.304.1588058397492; 
 Tue, 28 Apr 2020 00:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200427145212.GA5678@dell5510>
 <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
 <20200428061424.fj4mq676aoosoqyw@vireshk-i7>
In-Reply-To: <20200428061424.fj4mq676aoosoqyw@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Apr 2020 09:19:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0On9euT2mzx+LsXVe21cqwNMR4Hzj3eVDhbCS_KeGb4w@mail.gmail.com>
Message-ID: <CAK8P3a0On9euT2mzx+LsXVe21cqwNMR4Hzj3eVDhbCS_KeGb4w@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:A4P91gpPNB7DL72t0ZWzHUPYJeGV40wSYGWmotjqk6vsTHi4Knx
 WZZ3jL9KBxMU8HA1TrK/GN1zNolPxfg8cvdmkZwfjnNjqfkirznLmAF1tbAU0Gh0j5AryZd
 9UHI+Mab6vMaRB4E01YMZ/nCSuLM608m6Tis8U/7F3zErDZJZVkOsg9WC5bhF88zUXYmJmT
 4DlQjgg5pnY2ncHvSj/cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q9oBQ9nnGuQ=:YmJVSFwha1mltehYGgelrV
 X6yBrgspGo4XcGqZ6cHbPl2EtrxuYW86w+4IYnuj+rhH9n7gvrUMoy1n/LHW7HGM1z9xNTNDR
 /qDDbUxgp43OH9Cf2D9zfT4Mi3yVwdlgumDLeEH4LMzXNuwnOxBm0SNFVHeOX5Wtsp/j/+8DH
 lEOmQIWieCf3ouqA0/HjtFge/kCQVfkkIzh2QmYvnpxEkQ1fGDk6s6gDJ7iu9wM5HRwMubRIe
 lKub2jySnRLqocJLhZaq5uIdn2naPrbOJdkJJiO1jIF08QHQJBMZP+eyF8AkzzDTsk0ZPyG3v
 PvlqpGHvrv8IWouwU6j6HaFt8AHeAohA1VkNbdlEZTSliK1hK0zcG+kQCBwnK1ymmOFg7bfXH
 NKTdSv8T0pkgPEsFPPLalOV6Ii0alhBGYwuYQbWzPtVTsrTtF5yqEGedu8rLActyKYU2CC0Zh
 aI5YAqjZ/uv1IDmTun9lodlLiLIrU+qBCUezLryiCQPJBmYeNkrvj590shT2te1S7IRfx3vH1
 YMbccS9NxEn+yDCe4cS/hLghf6CaAlaUeahi2OW8GCbvUksMNX/rXn54Uj2cY/f4t8+8i4iEe
 JAix5NDZGfHQoOg/ziygVm4KZHgkfcRih8F06aEI0Vsr4LD4FL0K9kpkKqjaKeSGB8n0T5Huy
 Qa3IeZXXp6kFxmtAjRBeGcFtP2xxYcJ5IPTxLUqpS8rjhQMKPDO8+6gL09c575QRW2s0QQVS7
 oe27Q3XVciS1pND33Enp8+GZsupPA4AcpWoukz7x5a+gmE4gkpdgwvThVaCx7OHMvLAvE+NIs
 7rnPMJrDNsYK0HEI6KSIWUXkccIQUWmq1ttuE5l5qkiJz72Uuw=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] common_timers: staticize all definitions
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBBcHIgMjgsIDIwMjAgYXQgODoxNCBBTSBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1h
ckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDI4LTA0LTIwLCAxMDozMCwgVmlyZXNoIEt1bWFy
IHdyb3RlOgo+ID4gU3RhdGljaXplIGFsbCB2YXJpYWJsZSBhbmQgZnVuY3Rpb24gZGVmaW5pdGlv
bnMgdG8gYXZvaWQgYnVpbGQgZmFpbHVyZXMKPiA+IGluIHRoZSBmdXR1cmUgaWYgdGhpcyBnZXRz
IGluY2x1ZGVkIGJ5IG11bHRpcGxlIGZpbGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpcmVz
aCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xh
cGkvY29tbW9uX3RpbWVycy5oIHwgOCArKysrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGFwaS9jb21tb25fdGltZXJzLmggYi9pbmNsdWRlL2xhcGkvY29tbW9uX3RpbWVycy5oCj4gPiBp
bmRleCBkZjQxOTZlZWI1NzkuLmQyZDBkMGRhYjVmZCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUv
bGFwaS9jb21tb25fdGltZXJzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGFwaS9jb21tb25fdGltZXJz
LmgKPiA+IEBAIC0xNSw3ICsxNSw3IEBACj4gPiAgI2RlZmluZSBOU0VDX1BFUl9TRUMgKDEwMDAw
MDAwMDBMKQo+ID4gICNlbmRpZgo+ID4KPiA+IC1jbG9ja190IGNsb2NrX2xpc3RbXSA9IHsKPiA+
ICtzdGF0aWMgY2xvY2tfdCBjbG9ja19saXN0W10gPSB7Cj4gPiAgICAgICBDTE9DS19SRUFMVElN
RSwKPiA+ICAgICAgIENMT0NLX01PTk9UT05JQywKPiA+ICAgICAgIENMT0NLX1BST0NFU1NfQ1BV
VElNRV9JRCwKPiA+IEBAIC0zNCw3ICszNCw3IEBAIGNsb2NrX3QgY2xvY2tfbGlzdFtdID0gewo+
ID4gICAgICAgY2FzZSBkZWZfbmFtZTogICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICByZXR1
cm4gI2RlZl9uYW1lOwo+Cj4gVW5mb3J0dW5hdGVseSB0aGlzIHN0aWxsIGdlbmVyYXRlcyB3YXJu
aW5nOgo+Cj4gd2FybmluZzog4oCYY2xvY2tfbGlzdOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZAo+
Cj4gSSBtaXNzZWQgc2VlaW5nIHRoaXMgZWFybGllciBpbiB0aGUgZnVsbCBidWlsZCBhbmQgc2F3
IGl0IG5vdyB3aGlsZQo+IGJ1aWxkaW5nIGEgc2luZ2xlIHRlc3QgY2FzZS4KPgo+IEkgdGhpbmsg
d2UgbmVlZCB0byBtb3ZlIHRoaXMgdG8gc29tZSAuYyBmaWxlIGFuZCByZW1vdmUgdGhlICJzdGF0
aWMiCj4gcGFydC4gQnV0IEkgYW0gbm90IHN1cmUgd2hpY2ggb25lIHRvLiBJZiB3ZSBkbyB0aGF0
LCB0aGVuIHJlc3Qgb2YgdGhlCj4gc2VyaWVzIHdpbGwgbm90IGJlIGFmZmVjdGVkIGJ5IGl0LgoK
VGhhdCBpcyBwcm9iYWJseSB0aGUgY2xlYW5lc3Qgd2F5LCB5ZXMKCj4gT3Igd2UgY2FuIHNpbXBs
eSBkcm9wIHRoZSAic3RhdGljIiBwYXJ0IGFuZCBtdWx0aXBsZSBjb3BpZXMgb2YgdGhpcwo+IHdp
bGwgYmUgcHJlc2VudCBpbiBkaWZmZXJlbnQgLmMgZmlsZXMuIFdoaWNoIEkgZG9uJ3QgcmVhbGx5
IGxpa2UgdG8gYmUKPiBob25lc3QuCgpUaGVyZSBpcyB1c3VhbGx5IG5vIHdhcm5pbmcgYWJvdXQg
dmFyaWFibGVzIGluIGhlYWRlciBmaWxlcwp0aGF0IGFyZSBtYXJrZWQgJ3N0YXRpYyBjb25zdCcg
cmF0aGVyIHRoYW4ganVzdCAnc3RhdGljJywgYXMgdGhhdAppcyBhIGNvbW1vbiB3YXkgdG8gZG8g
dGhpbmdzIGluIEMrKy4KCj4gT3Igd2UgY2FuIHNpbXBseSBkcm9wIHRoZSAic3RhdGljIiBwYXJ0
IGFuZCBtdWx0aXBsZSBjb3BpZXMgb2YgdGhpcwo+IHdpbGwgYmUgcHJlc2VudCBpbiBkaWZmZXJl
bnQgLmMgZmlsZXMuIFdoaWNoIEkgZG9uJ3QgcmVhbGx5IGxpa2UgdG8gYmUKPiBob25lc3QuCgpX
aXRoIGdjYy0xMCBhbmQgY2xhbmctMTAgdGhpcyB3aWxsIGNhdXNlIGEgbGluay10aW1lIGZhaWx1
cmUsIGJlY2F1c2UKdGhleSBub3cgYm90aCBkZWZhdWx0IHRvICItZm5vLWNvbW1vbiIgYmVoYXZp
b3IuCgogICAgICAgQXJuZAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
