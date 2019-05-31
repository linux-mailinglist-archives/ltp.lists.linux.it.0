Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E830B6F
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:25:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CC532987A1
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:25:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CB21E3EA02A
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:25:40 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 999F760066F
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:25:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3316AF61;
 Fri, 31 May 2019 09:25:38 +0000 (UTC)
Date: Fri, 31 May 2019 11:25:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190531092538.GB4224@rei.lan>
References: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
 <20190531083203.GA4224@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531083203.GA4224@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] insmod01_sh test from commands test suite will make
 cve-2017-17053 test fail
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gPiBXZSBmb3VuZCBvdXQgdGhhdCB3aGVuIHJ1bm5pbmcgdGhlIExUUCB0ZXN0IHN1aXRl
IGRpcmVjdGx5ICh3aGljaCB1c2VzCj4gPiB0aGUgImRlZmF1bHQiIGZpbGUgaW4gc2NlbmFyaW9f
Z3JvdXBzKS4gVGhlIGluc21vZDAxX3NoIHdpbGwgaW5zZXJ0IGFuCj4gPiBvdXQtb2YtdHJlZSBt
b2R1bGUgYW5kIHRhaW50cyB0aGUga2VybmVsLCBhbmQgdGhlIGZvbGxvd2luZwo+ID4gY3ZlLTIw
MTctMTcwNTMgdGVzdCBpbiB0aGUgY3ZlIHRlc3Qgc3VpdGUgd2lsbCBjaGVjayBpZiB0aGUga2Vy
bmVsIGlzCj4gPiB0YWludGVkLiBUaHVzIGNhdXNpbmcgc29tZSBmYWxzZS1wb3NpdGl2ZSBpbiB0
aGUgdGVzdCByZXN1bHQuCj4gPiAKPiA+IFBlcmhhcHMgYSB3b3JrYXJvdW5kIGlzIHRvIG1vdmUg
dGhlIGN2ZSB0ZXN0IHN1aXRlIHRvIHNvbWV3aGVyZSBiZWZvcmUKPiA+IHRoZSBjb21tYW5kcyB0
ZXN0IHN1aXRlIGluIHRoZSAiZGVmYXVsdCIgc2NlbmFyaW8uCj4gPiAKPiA+IEJ1Z0xpbms6IGh0
dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTgzMDAxMQo+IAo+IExvb2tpbmcgYXQgdGhl
IGJ1ZyB0aGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBtb2R1bGUgaXMgbWlzc2luZyBsaWNlbnNlLgo+
IAo+IEkgZ3Vlc3MgdGhhdCBhZGRpbmcgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOyB0byB0aGUgZHVt
bXkgbW9kdWxlCj4gdGVzdGNhc2VzL2NvbW1hbmRzL2luc21vZC9sdHBfaW5zbW9kMDEuYyBzaG91
bGQgZml4IGl0LgoKTG9va2luZyBhdCB0aGUgbG9nIGNsb3NlciB0aGVyZSBhcmUgdGhyZWUgdGhp
bmdzIHRoYXQgc2VlbSB0byB0YWluIHRoZQprZXJuZWw6CgoqIE1pc3NpbmcgbW9kdWxlIGxpY2Vu
c2UKKiBPdXQtb2YtdHJlZSBtb2R1bGUKKiBNaXNzaW5nIHNpZ25hdHVyZQoKTm93IGVhY2ggb2Yg
dGhlc2Ugc2hvdWxkIGJlIHNldHRpbmcgdmVyeSBzcGVjaWZpYyBrZXJuZWwgdGFpbnQgZmxhZ3Mu
CmkuZS4gKHNlZSBsdHAvaW5jbHVkZS90c3RfdGFpbnQuaCkKCiogTWlzc2luZyBtb2R1bGUgbGlj
ZW5zZSAtPiBUU1RfVEFJTlRfRwoqIE91dC1vZi10cmVlIG1vZHVsZSAtPiBUU1RfVEFJTlRfTwoq
IE1pc3Npbmcgc2lnbmF0dXJlIC0+IFRTVF9UQUlOVF9FCgpXaGlsZSB0aGUgQ1ZFIHRlc3RzIGNo
ZWNrcyBvbmx5IHByZXNlbmNlIG9mIFRTVF9UQUlOVF9EIGFuZCBUU1RfVEFJTlRfVwpzbyBpbiB0
aGVvcnkgdGhpcyBzaG91bGQgd29yayBmaW5lLgoKSWYgeW91IGxvb2sgYXQgdGhlIHZhbHVlIG9m
IHRoZSB0YWludCBmbGFnIGZvciB0aGF0IGJ1Z3JlcG9ydDoKCjE0ODQ5ID0gMDAxMTEwMTAwMDAw
MDAwMQogICAgICAgICAgXl5eIF4gICAgICAgIF4KCSAgRU9JIFcJICAgICAgIEcKClNvbWV0aGlu
ZyBoYXMgc2V0IHRoZSAid2FybmluZyIgdGFpbnQgZmxhZyBhbmQgYWxzbyB0aGUgIndvcmtpbmcg
YXJvdW5kCmZpcm13YXJlIGJ1ZyIgZmxhZywgc28gaXQncyBxdWl0ZSBwb3NzaWJsZSB0aGF0IHRo
ZSBpbnNtb2QgdGVzdHMgaXMgbm90CnRoZSBjdWxwcml0IGhlcmUuCgotLSAKQ3lyaWwgSHJ1Ymlz
CmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
