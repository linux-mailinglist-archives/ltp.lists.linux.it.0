Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F42275A7
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 04:35:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F35AB3C4E22
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 04:35:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C30D43C4E19
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 04:35:16 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id BE7CF2009C2
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 04:35:14 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; d="scan'208";a="96675036"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 10:35:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 253004CE5076;
 Tue, 21 Jul 2020 10:35:11 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 10:35:10 +0800
Message-ID: <5F16545D.4090103@cn.fujitsu.com>
Date: Tue, 21 Jul 2020 10:35:09 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-5-pvorel@suse.cz> <5F15686A.1070605@cn.fujitsu.com>
 <20200720141547.GB21201@dell5510>
In-Reply-To: <20200720141547.GB21201@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 253004CE5076.A849B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAyMC83LzIwIDIyOjE1LCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpLAo+Cj4gLi4uCj4+PiAr
KysgYi90ZXN0Y2FzZXMvbmV0d29yay9SRUFETUUubWQKPiAuLi4KPj4+ICAgICMjIFNlcnZlciBT
ZXJ2aWNlcyBDb25maWd1cmF0aW9uCj4+PiAgICBWZXJpZnkgdGhhdCB0aGUgYmVsb3cgZGFlbW9u
IHNlcnZpY2VzIGFyZSBydW5uaW5nLiBJZiBub3QsIHBsZWFzZSBpbnN0YWxsCj4+PiAgICBhbmQg
c3RhcnQgdGhlbToKPj4+IC1yc2gtc2VydmVyLCB0ZWxuZXQtc2VydmVyLCBmaW5nZXItc2VydmVy
LCByZGlzdCwgcnN5bmMsIGRoY3Atc2VydmVyLCBodHRwLXNlcnZlci4KPj4+ICsKPj4+ICtkaGNw
LXNlcnZlciwgZG5zbWFzcSwgaHR0cC1zZXJ2ZXIsIG5mcy1rZXJuZWwtc2VydmVyLCBycGNiaW5k
LCByc3luYywKPj4+ICt0ZWxuZXQtc2VydmVyLCB2c2Z0cGQKPj4gSGkgUGV0ciwKPj4gVGhlc2Ug
cGFja2FnZSBuYW1lcyBhcmUgZnJvbSBEZWJpYW4vVWJ1bnR1LCBkbyB3ZSBuZWVkIHRvIG1lbnRp
b24gaXQ/Cj4gQWxsIHRoZXNlIHBhY2thZ2VzIGFyZSBhdCBsZWFzdCBpbiBEZWJpYW4vVWJ1bnR1
IGFuZCBvcGVuU1VTRS4gSU1ITyBvdGhlcgo+IGRpc3Ryb3MgaGF2ZSBzaW1pbGFyIG5hbWVzLiBF
eGNlcHRpb24gaXMgbmZzLWtlcm5lbC1zZXJ2ZXIsIHdoaWNoIGlzIGF0IGxlYXN0IG9uCj4gRmVk
b3JhL1JIRUwgbmZzLXNlcnZlci4gVGh1cyBzb21ldGhpbmcgbGlrZToKPgo+IGRoY3Atc2VydmVy
LCBkbnNtYXNxLCBodHRwLXNlcnZlciwgbmZzLWtlcm5lbC1zZXJ2ZXIgb3IgbmZzLXNlcnZlciwg
cnBjYmluZCwKPiByc3luYyx0ZWxuZXQtc2VydmVyLCB2c2Z0cGQKSGkgUGV0ciwKCklmIHRoZXNl
IG5hbWUgcmVwcmVzZW50IHBha2NhZ2UgbmFtZSwgdGhlcmUgYXJlIHNvbWUgZGlmZmVybmV0cyBi
ZXR3ZWVuIApEZWJpYW4vVWJ1bnR1L29wZW5TVVNFIGFuZCBGZWRvcmEvUkhFTDoKRGViaWFuL1Vi
dW50dS9vcGVuU1VTRTogaXNjLWRoY3Atc2VydmVyLCBkbnNtYXNx77yMYXBhY2hlMiwgCm5mcy1r
ZXJuZWwtc2VydmVyLCBycGNiaW5k77yMcnN5bmMsIHRlbG5ldGQgKyB4aW5ldGQsIHZzZnRwZApS
SEVML0ZlZG9yYTogZGhjcCwgZG5zbWFzce+8jGh0dHBkLCBuZnMtdXRpbHPvvIxycGNiaW5k77yM
cnN5bmMsIAp0ZWxuZXQtc2VydmVyLCB2c2Z0cGQKCkNvdWxkIHdlIGp1c3QgcmVwcmVzZW50IHNl
cnZpY2UgbmFtZToKZGhjcGQob3IgaXNjLWRoY3Atc2VydmVyKSwgZG5zbWFzcSwgaHR0cGQob3Ig
YXBhY2hlMiksIG5mcy1zZXJ2ZXIsIApycGNiaW5kLCB0ZWxuZXQuc29ja2V0KG9yIHhpbmV0ZCks
IHZzZnRwZAoKQlRXOiBJIGNhbm5vdCBmaW5kIHdoaWNoIHRlc3QgdXNlIHJzeW5jLCBkaWQgSSBt
aXNzIHNvbWV0aGluZz8KCj4+PiAgICBOb3RlOiBJZiBhbnkgb2YgdGhlIGFib3ZlIGRhZW1vbiBp
cyBub3QgcnVubmluZyBvbiBzZXJ2ZXIsIHRoZSB0ZXN0IHJlbGF0ZWQgdG8KPj4+ICAgIHRoYXQg
c2VydmljZSBydW5uaW5nIGZyb20gY2xpZW50IHdpbGwgZmFpbC4KPj4+IC0jIyMgRlRQIHNldHVw
Cj4+PiAtKiBJbiDigJwvZXRjL2Z0cHVzZXJz4oCdIFtvciB2aSAvZXRjL3ZzZnRwZC5mdHB1c2Vy
c10sIGNvbW1lbnQgdGhlIGxpbmUgY29udGFpbmluZwo+Pj4gLeKAnHJvb3TigJ0gc3RyaW5nLiBU
aGlzIGZpbGUgbGlzdHMgYWxsIHRob3NlIHVzZXJzIHdobyBhcmUgbm90IGdpdmVuIGFjY2VzcyB0
byBkbyBmdHAKPj4+ICsjIyMgRlRQIGFuZCB0ZWxuZXQgc2V0dXAKPj4+ICtCb3RoIHRlc3RzIHJl
cXVpcmUgZW52aXJvbm1lbnQgdmFyaWFibGVzIGBSSE9TVGAgKHJlbW90ZSBtYWNoaW5lKSwgYFJV
U0VSYAo+Pj4gKyhyZW1vdGUgdXNlcikgYW5kIGBQQVNTV0RgIChyZW1vdGUgcGFzc3dvcmQpLiBO
T1RFOiBgUkhPU1RgIHdpbGwgaW1wbHkgdHdvIGhvc3QKPj4+ICtjb25maWd1cmF0aW9lIGZvciBv
dGhlciB0ZXN0cy4KPj4+ICsKPj4+ICtJZiBgUkhPU1RgIGlzIHNldCB0byBgcm9vdGAsIGVpdGhl
ciBvZiB0aGVzZSBzdGVwcyBpcyByZXF1aXJlZDoKPj4+ICsKPj4+ICsqIEluIGAvZXRjL2Z0cHVz
ZXJzYCAob3IgYC9ldGMvdnNmdHBkLmZ0cHVzZXJzYCksIGNvbW1lbnQgdGhlIGxpbmUgY29udGFp
bmluZwo+Pj4gKyJyb290IiBzdHJpbmcuIFRoaXMgZmlsZSBsaXN0cyBhbGwgdGhvc2UgdXNlcnMg
d2hvIGFyZSBub3QgZ2l2ZW4gYWNjZXNzIHRvIGRvIGZ0cAo+Pj4gICAgb24gdGhlIGN1cnJlbnQg
c3lzdGVtLgo+PiBBcmUgdGhpcyBmaWxlIGZyb20gRGViaWFuL1VidW50dSBhcyB3ZWxsPwo+IEFn
YWluLCAvZXRjL2Z0cHVzZXJzIGlzIGF0IGxlYXN0IGZvciBvcGVuU1VTRSBhbmQgRGViaWFuL1Vi
dW50dS4KPiBGZWRvcmEvUkhFTCBoYXMgL2V0Yy92c2Z0cGQvZnRwdXNlcnMgYW5kIC9ldGMvdnNm
dHBkL3VzZXJfbGlzdAo+IC9ldGMvdnNmdHBkLmZ0cHVzZXJzIGxvb2tzIGxpa2UgdG8gYmUgb24g
UkhFTCA0LyBzb21lIG9sZCBGZWRvcmEuCj4KPiBUaHVzOgo+ICogSW4gYC9ldGMvZnRwdXNlcnNg
IChvciBgL2V0Yy92c2Z0cGQvZnRwdXNlcnNgIG9yIGAvZXRjL3ZzZnRwZC5mdHB1c2Vyc2ApLAo+
ICogY29tbWVudCB0aGUgbGluZSBjb250YWluaW5nCj4gLi4uCgpUaGlzIGNoYW5nZSBsb29rcyBn
b29kLiA6LSkKCj4gSSBhbHNvIHdvbmRlcmVkIGlmIHNldHVwIHNob3VsZCBtZW50aW9uIHNvbWV0
aGluZyByZWxhdGVkIHRvIHNpbmdsZSB0ZXN0LAo+IGJ1dCBpdCBkaWRuJ3QgaGFybS4gSSB3YXMg
dGhpbmtpbmcgd2hldGhlciBmdHAgdGVzdCBpcyB3b3J0aCB0byBrZWVwIChhbmQgdGh1cwo+IG5l
ZWQgdG8gYmUgcmV3cml0dGVuKSwgYnV0IHVuZGVyc3RhbmQgaXQncyB1c2VmdWwgYXMgYSBoaWdo
IGxldmVsIHNtb2tlIHRlc3QuCjEpIEl0IHNlZW1zIGJldHRlciB0byBtZW50aW9uIHNvbWV0aGlu
ZyByZWxhdGVkIHRvIHNpbmdsZSB0ZXN0LgoyKSBQZXJmZXIgdG8ga2VlcCBhbmQgcmV3cml0ZSBm
dHAgdGVzdC4KClRoYW5rcywKWGlhbyBZYW5nCj4gT0sgd2l0aCB0aGVzZSBjaGFuZ2VzPwo+Cj4g
S2luZCByZWdhcmRzLAo+IFBldHIKPgo+PiBPdGhlciB0aGFuIHRoaXMsIGl0IGlzIGdvb2QgdG8g
bWUuIDotKQo+PiBBY2tlZC1ieTogWGlhbyBZYW5nPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgo+
PiBUaGFua3MsCj4+IFhpYW8gWWFuZwo+Cj4gLgo+CgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
