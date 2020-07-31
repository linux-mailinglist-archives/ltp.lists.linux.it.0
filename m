Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8423CAAD
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:47:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC9593C3267
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:47:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 941303C076F
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 19:16:04 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AF9D960213D
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 19:16:03 +0200 (CEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BDB62074B;
 Fri, 31 Jul 2020 17:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596215761;
 bh=9bNhpovPSTGi6X3LF9twzY/MMA9zySnTVDjOd55Ntxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2dlBa5GvxepmB1bZWS6B4sDbxrGegsTyQ4h4AQ1rmaWhT1WYYuPVBcjLzEYBROrYs
 eI8bf1euA96BCgOWN+O8i/1WbCxMhrQb/d5IwLpc+PWlibzAt7QRE5yyqaBRBahQpf
 HKwa1SAokQSMNQqWrUcwplngTMoq0no3Ux2vRfxc=
Date: Fri, 31 Jul 2020 19:15:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200731171547.GC2012979@kroah.com>
References: <20200730074420.502923740@linuxfoundation.org>
 <CA+G9fYvCPwwmF-k=Z9Z6P2KYrOMHurcORwa3RW2H1j6pq1QEDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvCPwwmF-k=Z9Z6P2KYrOMHurcORwa3RW2H1j6pq1QEDg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: Re: [LTP] [PATCH 5.4 00/19] 5.4.55-rc1 review
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
Cc: Peter Zijlstra <peterz@infradead.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-mm <linux-mm@kvack.org>,
 Basil Eljuse <Basil.Eljuse@arm.com>, Christoph Lameter <cl@linux.com>,
 Shuah Khan <shuah@kernel.org>, Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Vincent Guittot <vincent.guittot@linaro.org>, Hugh Dickins <hughd@google.com>,
 LTP List <ltp@lists.linux.it>, David Rientjes <rientjes@google.com>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>,
 Cgroups <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBKdWwgMzEsIDIwMjAgYXQgMDQ6MDI6MTZQTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gT24gVGh1LCAzMCBKdWwgMjAyMCBhdCAxMzozNiwgR3JlZyBLcm9haC1IYXJ0bWFu
Cj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGlzIHRo
ZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDUuNC41NSByZWxlYXNl
Lgo+ID4gVGhlcmUgYXJlIDE5IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBv
c3RlZCBhcyBhIHJlc3BvbnNlCj4gPiB0byB0aGlzIG9uZS4gIElmIGFueW9uZSBoYXMgYW55IGlz
c3VlcyB3aXRoIHRoZXNlIGJlaW5nIGFwcGxpZWQsIHBsZWFzZQo+ID4gbGV0IG1lIGtub3cuCj4g
Pgo+ID4gUmVzcG9uc2VzIHNob3VsZCBiZSBtYWRlIGJ5IFNhdCwgMDEgQXVnIDIwMjAgMDc6NDQ6
MDUgKzAwMDAuCj4gPiBBbnl0aGluZyByZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUg
dG9vIGxhdGUuCj4gPgo+ID4gVGhlIHdob2xlIHBhdGNoIHNlcmllcyBjYW4gYmUgZm91bmQgaW4g
b25lIHBhdGNoIGF0Ogo+ID4gICAgICAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51
eC9rZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNoLTUuNC41NS1yYzEuZ3oKPiA+IG9yIGlu
IHRoZSBnaXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+ID4gICAgICAgICBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQg
bGludXgtNS40LnkKPiA+IGFuZCB0aGUgZGlmZnN0YXQgY2FuIGJlIGZvdW5kIGJlbG93Lgo+ID4K
PiA+IHRoYW5rcywKPiA+Cj4gPiBncmVnIGstaAo+IAo+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlz
IHRlc3QgZmFybS4KPiBSZWdyZXNzaW9ucyBvbiBhcm02NCBKdW5vLXIyIGRldmljZSBydW5uaW5n
IExUUCBjb250cm9sbGVycy10ZXN0cwo+IAo+IENPTkZJR19BUk02NF82NEtfUEFHRVM9eQo+IAo+
IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVz
cyBkZWFkMDAwMDAwMDAwMTA4Cj4gW2RlYWQwMDAwMDAwMDAxMDhdIGFkZHJlc3MgYmV0d2VlbiB1
c2VyIGFuZCBrZXJuZWwgYWRkcmVzcyByYW5nZXMKPiBJbnRlcm5hbCBlcnJvcjogT29wczogOTYw
MDAwNDQgWyMxXSBQUkVFTVBUIFNNUAo+IAo+IHBjIDogZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCsw
eGE2NC8weDEwMzAKPiBsciA6IGdldF9wYWdlX2Zyb21fZnJlZWxpc3QrMHg5YzQvMHgxMDMwCj4g
Cj4gV2UgYXJlIHRyeWluZyB0byByZXByb2R1Y2UgdGhpcyBrZXJuZWwgcGFuaWMgYW5kIHRyeWlu
ZyB0byBuYXJyb3cgZG93biB0bwo+IHNwZWNpZmljIHRlc3QgY2FzZXMuCgpJZiB5b3UgY29tZSB1
cCB3aXRoIHNvbWV0aGluZyB0aGF0IG5lZWRzIHRvIGJlIHJldmVydGVkLCBwbGVhc2UgbGV0IG1l
Cmtub3cuCgpPdGhlcndpc2UsIHRoYW5rcyBmb3IgdGVzdGluZyBhbGwgb2YgdGhlc2UuCgpncmVn
IGstaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
