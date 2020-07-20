Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AAF2261B8
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:15:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 879323C4E1F
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:15:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 627E03C2123
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:15:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF16D2010ED
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:15:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A348AB8B;
 Mon, 20 Jul 2020 14:15:55 +0000 (UTC)
Date: Mon, 20 Jul 2020 16:15:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200720141547.GB21201@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-5-pvorel@suse.cz>
 <5F15686A.1070605@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F15686A.1070605@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/7] net: Update README.md
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgouLi4KPiA+ICsrKyBiL3Rlc3RjYXNlcy9uZXR3b3JrL1JFQURNRS5tZAouLi4KPiA+ICAg
IyMgU2VydmVyIFNlcnZpY2VzIENvbmZpZ3VyYXRpb24KPiA+ICAgVmVyaWZ5IHRoYXQgdGhlIGJl
bG93IGRhZW1vbiBzZXJ2aWNlcyBhcmUgcnVubmluZy4gSWYgbm90LCBwbGVhc2UgaW5zdGFsbAo+
ID4gICBhbmQgc3RhcnQgdGhlbToKPiA+IC1yc2gtc2VydmVyLCB0ZWxuZXQtc2VydmVyLCBmaW5n
ZXItc2VydmVyLCByZGlzdCwgcnN5bmMsIGRoY3Atc2VydmVyLCBodHRwLXNlcnZlci4KPiA+ICsK
PiA+ICtkaGNwLXNlcnZlciwgZG5zbWFzcSwgaHR0cC1zZXJ2ZXIsIG5mcy1rZXJuZWwtc2VydmVy
LCBycGNiaW5kLCByc3luYywKPiA+ICt0ZWxuZXQtc2VydmVyLCB2c2Z0cGQKPiBIaSBQZXRyLAoK
PiBUaGVzZSBwYWNrYWdlIG5hbWVzIGFyZSBmcm9tIERlYmlhbi9VYnVudHUsIGRvIHdlIG5lZWQg
dG8gbWVudGlvbiBpdD8KQWxsIHRoZXNlIHBhY2thZ2VzIGFyZSBhdCBsZWFzdCBpbiBEZWJpYW4v
VWJ1bnR1IGFuZCBvcGVuU1VTRS4gSU1ITyBvdGhlcgpkaXN0cm9zIGhhdmUgc2ltaWxhciBuYW1l
cy4gRXhjZXB0aW9uIGlzIG5mcy1rZXJuZWwtc2VydmVyLCB3aGljaCBpcyBhdCBsZWFzdCBvbgpG
ZWRvcmEvUkhFTCBuZnMtc2VydmVyLiBUaHVzIHNvbWV0aGluZyBsaWtlOgoKZGhjcC1zZXJ2ZXIs
IGRuc21hc3EsIGh0dHAtc2VydmVyLCBuZnMta2VybmVsLXNlcnZlciBvciBuZnMtc2VydmVyLCBy
cGNiaW5kLApyc3luYyx0ZWxuZXQtc2VydmVyLCB2c2Z0cGQKCj4gPiAgIE5vdGU6IElmIGFueSBv
ZiB0aGUgYWJvdmUgZGFlbW9uIGlzIG5vdCBydW5uaW5nIG9uIHNlcnZlciwgdGhlIHRlc3QgcmVs
YXRlZCB0bwo+ID4gICB0aGF0IHNlcnZpY2UgcnVubmluZyBmcm9tIGNsaWVudCB3aWxsIGZhaWwu
Cgo+ID4gLSMjIyBGVFAgc2V0dXAKPiA+IC0qIEluIOKAnC9ldGMvZnRwdXNlcnPigJ0gW29yIHZp
IC9ldGMvdnNmdHBkLmZ0cHVzZXJzXSwgY29tbWVudCB0aGUgbGluZSBjb250YWluaW5nCj4gPiAt
4oCccm9vdOKAnSBzdHJpbmcuIFRoaXMgZmlsZSBsaXN0cyBhbGwgdGhvc2UgdXNlcnMgd2hvIGFy
ZSBub3QgZ2l2ZW4gYWNjZXNzIHRvIGRvIGZ0cAo+ID4gKyMjIyBGVFAgYW5kIHRlbG5ldCBzZXR1
cAo+ID4gK0JvdGggdGVzdHMgcmVxdWlyZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYFJIT1NUYCAo
cmVtb3RlIG1hY2hpbmUpLCBgUlVTRVJgCj4gPiArKHJlbW90ZSB1c2VyKSBhbmQgYFBBU1NXRGAg
KHJlbW90ZSBwYXNzd29yZCkuIE5PVEU6IGBSSE9TVGAgd2lsbCBpbXBseSB0d28gaG9zdAo+ID4g
K2NvbmZpZ3VyYXRpb2UgZm9yIG90aGVyIHRlc3RzLgo+ID4gKwo+ID4gK0lmIGBSSE9TVGAgaXMg
c2V0IHRvIGByb290YCwgZWl0aGVyIG9mIHRoZXNlIHN0ZXBzIGlzIHJlcXVpcmVkOgo+ID4gKwo+
ID4gKyogSW4gYC9ldGMvZnRwdXNlcnNgIChvciBgL2V0Yy92c2Z0cGQuZnRwdXNlcnNgKSwgY29t
bWVudCB0aGUgbGluZSBjb250YWluaW5nCj4gPiArInJvb3QiIHN0cmluZy4gVGhpcyBmaWxlIGxp
c3RzIGFsbCB0aG9zZSB1c2VycyB3aG8gYXJlIG5vdCBnaXZlbiBhY2Nlc3MgdG8gZG8gZnRwCj4g
PiAgIG9uIHRoZSBjdXJyZW50IHN5c3RlbS4KPiBBcmUgdGhpcyBmaWxlIGZyb20gRGViaWFuL1Vi
dW50dSBhcyB3ZWxsPwpBZ2FpbiwgL2V0Yy9mdHB1c2VycyBpcyBhdCBsZWFzdCBmb3Igb3BlblNV
U0UgYW5kIERlYmlhbi9VYnVudHUuCkZlZG9yYS9SSEVMIGhhcyAvZXRjL3ZzZnRwZC9mdHB1c2Vy
cyBhbmQgL2V0Yy92c2Z0cGQvdXNlcl9saXN0Ci9ldGMvdnNmdHBkLmZ0cHVzZXJzIGxvb2tzIGxp
a2UgdG8gYmUgb24gUkhFTCA0LyBzb21lIG9sZCBGZWRvcmEuCgpUaHVzOgoqIEluIGAvZXRjL2Z0
cHVzZXJzYCAob3IgYC9ldGMvdnNmdHBkL2Z0cHVzZXJzYCBvciBgL2V0Yy92c2Z0cGQuZnRwdXNl
cnNgKSwKKiBjb21tZW50IHRoZSBsaW5lIGNvbnRhaW5pbmcKLi4uCgpJIGFsc28gd29uZGVyZWQg
aWYgc2V0dXAgc2hvdWxkIG1lbnRpb24gc29tZXRoaW5nIHJlbGF0ZWQgdG8gc2luZ2xlIHRlc3Qs
CmJ1dCBpdCBkaWRuJ3QgaGFybS4gSSB3YXMgdGhpbmtpbmcgd2hldGhlciBmdHAgdGVzdCBpcyB3
b3J0aCB0byBrZWVwIChhbmQgdGh1cwpuZWVkIHRvIGJlIHJld3JpdHRlbiksIGJ1dCB1bmRlcnN0
YW5kIGl0J3MgdXNlZnVsIGFzIGEgaGlnaCBsZXZlbCBzbW9rZSB0ZXN0LgoKT0sgd2l0aCB0aGVz
ZSBjaGFuZ2VzPwoKS2luZCByZWdhcmRzLApQZXRyCgo+IE90aGVyIHRoYW4gdGhpcywgaXQgaXMg
Z29vZCB0byBtZS4gOi0pCj4gQWNrZWQtYnk6IFhpYW8gWWFuZyA8eWFuZ3guanlAY24uZnVqaXRz
dS5jb20+Cgo+IFRoYW5rcywKPiBYaWFvIFlhbmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
