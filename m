Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB8024C542
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:25:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 038193C2FB4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:25:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 26F533C2F9F
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:25:22 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 414BF600650
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:25:20 +0200 (CEST)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 336AA204FD;
 Thu, 20 Aug 2020 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597947918;
 bh=HD+6B26pOM3xOHTkv4x7zLa79Thbsh5pJUjBsUjrp/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2apTTtZszk/WzWxBLqb/GueTDxRXME6bRh6QcMCrNyO3oVk9djn5GlimeaQC41dpa
 Zw62S5Yh/2y87P89CE4SeNzYO72SecBzL6gocrBJJDApjxzjILh0IFlfiQJAu2HQ5o
 nDFntFlLqzJpbcftsqC+BSodnlGcJY19CIVjW39g=
Date: Thu, 20 Aug 2020 11:25:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200820182516.GA49496@sol.localdomain>
References: <20200820091612.692383444@linuxfoundation.org>
 <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux- stable <stable@vger.kernel.org>,
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
L2Jsb2IvbWFzdGVyL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL2FmX2FsZzAyLmMKPiAKPiBTdW1t
YXJ5Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4ga2VybmVsOiA1LjguMy1yYzEKPiBnaXQgcmVwbzog
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xp
bnV4LXN0YWJsZS1yYy5naXQKPiBnaXQgYnJhbmNoOiBsaW51eC01LjgueQo+IGdpdCBjb21taXQ6
IDIwMWZmZjgwNzMxMGNlMTA0ODViY2ZmMjk0ZDQ3YmU5NWYzNzY5ZWIKPiBnaXQgZGVzY3JpYmU6
IHY1LjguMi0yMzMtZzIwMWZmZjgwNzMxMAo+IFRlc3QgZGV0YWlsczogaHR0cHM6Ly9xYS1yZXBv
cnRzLmxpbmFyby5vcmcvbGtmdC9saW51eC1zdGFibGUtcmMtNS44LW9lL2J1aWxkL3Y1LjguMi0y
MzMtZzIwMWZmZjgwNzMxMAo+IAo+IFJlZ3Jlc3Npb25zIChjb21wYXJlZCB0byBidWlsZCB2NS44
LjIpCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4geDE1Ogo+ICAgbHRwLWNyeXB0by10ZXN0czoKPiAg
ICAgKiBhZl9hbGcwMgo+IAo+ICAgbHRwLWN2ZS10ZXN0czoKPiAgICAgKiBjdmUtMjAxNy0xNzgw
NQo+IAoKTG9va3MgbGlrZSB0aGlzIHRlc3QgaXMgc3RpbGwgImJyb2tlbiIgYmVjYXVzZSBpdCBh
c3N1bWVzIGJlaGF2aW9yIHRoYXQgaXNuJ3QKY2xlYXJseSBzcGVjaWZpZWQsIGFzIHByZXZpb3Vz
bHkgZGlzY3Vzc2VkIGF0Cmh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyMDA3MDIwMzMyMjEu
R0ExOTM2N0Bnb25kb3IuYXBhbmEub3JnLmF1LgoKSSBzZW50IG91dCBMVFAgcGF0Y2hlcyB0byBm
aXggaXQ6Cmh0dHBzOi8vbGttbC5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by8yMDIwMDgyMDE4MTkx
OC40MDQ3NTgtMS1lYmlnZ2Vyc0BrZXJuZWwub3JnL1QvI3UKCi0gRXJpYwoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
