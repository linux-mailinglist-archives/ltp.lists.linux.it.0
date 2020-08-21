Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2324D3AD
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 13:15:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32CA83C2F83
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 13:15:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D51A63C2F6B
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 13:15:19 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 52FC660019A
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 13:15:19 +0200 (CEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB66120738;
 Fri, 21 Aug 2020 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598008516;
 bh=Cd+VoXUvwJoGAVVf2MJ9G2nda7Xj5OzTfnu49z0OnaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=12JYQxi4ejZkUIEesZewhBfWUQ8hgtJxF8GwvPIQG/3OgM2uQnieWte9i/Yxy9Oyr
 ThPKZ9roAg3JXeLxoQS5WpzDG+5JCfH7bVG7EeI4f6Bpa5umKeLVewur4v5fRBw0AB
 6s1jA/B1G+DxBcEyy2rW2mm/IultwhXAsGdN8/Ic=
Date: Fri, 21 Aug 2020 13:15:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200821111535.GC2222852@kroah.com>
References: <20200820091612.692383444@linuxfoundation.org>
 <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.8 000/232] 5.8.3-rc1 review
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, patches@kernelci.org,
 Eric Biggers <ebiggers@kernel.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBBdWcgMjAsIDIwMjAgYXQgMDg6NTc6NTdQTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gT24gVGh1LCAyMCBBdWcgMjAyMCBhdCAxNDo1NSwgR3JlZyBLcm9haC1IYXJ0bWFu
Cj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGlzIHRo
ZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDUuOC4zIHJlbGVhc2Uu
Cj4gPiBUaGVyZSBhcmUgMjMyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBv
c3RlZCBhcyBhIHJlc3BvbnNlCj4gPiB0byB0aGlzIG9uZS4gIElmIGFueW9uZSBoYXMgYW55IGlz
c3VlcyB3aXRoIHRoZXNlIGJlaW5nIGFwcGxpZWQsIHBsZWFzZQo+ID4gbGV0IG1lIGtub3cuCj4g
Pgo+ID4gUmVzcG9uc2VzIHNob3VsZCBiZSBtYWRlIGJ5IFNhdCwgMjIgQXVnIDIwMjAgMDk6MTU6
MDkgKzAwMDAuCj4gPiBBbnl0aGluZyByZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUg
dG9vIGxhdGUuCj4gPgo+ID4gVGhlIHdob2xlIHBhdGNoIHNlcmllcyBjYW4gYmUgZm91bmQgaW4g
b25lIHBhdGNoIGF0Ogo+ID4gICAgICAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51
eC9rZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNoLTUuOC4zLXJjMS5nego+ID4gb3IgaW4g
dGhlIGdpdCB0cmVlIGFuZCBicmFuY2ggYXQ6Cj4gPiAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdCBs
aW51eC01LjgueQo+ID4gYW5kIHRoZSBkaWZmc3RhdCBjYW4gYmUgZm91bmQgYmVsb3cuCj4gPgo+
ID4gdGhhbmtzLAo+ID4KPiA+IGdyZWcgay1oCj4gCj4gPiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+Cj4gPiAgICAgY3J5cHRvOiBhZl9hbGcgLSBGaXggcmVncmVzc2lv
biBvbiBlbXB0eSByZXF1ZXN0cwo+IAo+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFy
bS4KPiBSZWdyZXNzaW9ucyBkZXRlY3RlZC4KPiAKPiAgIGx0cC1jcnlwdG8tdGVzdHM6Cj4gICAg
ICogYWZfYWxnMDIKPiAgIGx0cC1jdmUtdGVzdHM6Cj4gICAgICogY3ZlLTIwMTctMTc4MDUKPiAK
PiBhZl9hbGcwMi5jOjUyOiBCUk9LOiBUaW1lZCBvdXQgd2hpbGUgcmVhZGluZyBmcm9tIHJlcXVl
c3Qgc29ja2V0Lgo+IFdlIGFyZSBydW5uaW5nIHRoZSBMVFAgMjAyMDA1MTUgdGFnIHJlbGVhc2Vk
IHRlc3Qgc3VpdGUuCj4gIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRw
L2Jsb2IvbWFzdGVyL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL2FmX2FsZzAyLmMKCkxvb2tzIGxp
a2UgdGhlIGNyeXB0byB0ZXN0cyBhcmUgbm93IGZpeGVkIDopCgpBbnl3YXksIHRoYW5rcyBmb3Ig
dGVzdGluZyBhbGwgb2YgdGhlc2UgYW5kIGxldHRpbmcgbWUga25vdy4KCmdyZWcgay1oCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
