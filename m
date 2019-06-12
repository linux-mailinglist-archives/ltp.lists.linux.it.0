Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9442A9C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 17:16:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D68423EAE3A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 17:16:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8B7EC3EAE2A
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 17:16:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D2F2E1401A05
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 17:16:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F12ADAF9A;
 Wed, 12 Jun 2019 15:16:49 +0000 (UTC)
Date: Wed, 12 Jun 2019 17:16:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yann Sionneau <ysionneau@kalray.eu>
Message-ID: <20190612151649.GB3048@rei.lan>
References: <1559834477-21724-1-git-send-email-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559834477-21724-1-git-send-email-ysionneau@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] Fix use of results after being unmapped
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

SGkhCllvdSBhcmUgbWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lIGhlcmUsIHNlZToKCmh0dHBz
Oi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTcvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNo
ZXMuaHRtbCNkZXZlbG9wZXItcy1jZXJ0aWZpY2F0ZS1vZi1vcmlnaW4tMS0xCgo+IC0tLQo+ICBs
aWIvdHN0X3Rlc3QuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi90c3RfdGVzdC5jIGIvbGli
L3RzdF90ZXN0LmMKPiBpbmRleCA5NWYzODlkLi43M2VjYTU4IDEwMDY0NAo+IC0tLSBhL2xpYi90
c3RfdGVzdC5jCj4gKysrIGIvbGliL3RzdF90ZXN0LmMKPiBAQCAtMTM4LDYgKzEzOCw3IEBAIHN0
YXRpYyB2b2lkIGNsZWFudXBfaXBjKHZvaWQpCj4gIAlpZiAocmVzdWx0cykgewo+ICAJCW1zeW5j
KCh2b2lkKilyZXN1bHRzLCBzaXplLCBNU19TWU5DKTsKPiAgCQltdW5tYXAoKHZvaWQqKXJlc3Vs
dHMsIHNpemUpOwo+ICsJCXJlc3VsdHMgPSBOVUxMOwo+ICAJfQo+ICB9Cj4gIAo+IEBAIC05MjEs
MTAgKzkyMiwxMSBAQCBzdGF0aWMgdm9pZCBkb19jbGVhbnVwKHZvaWQpCj4gIAlpZiAodHN0X3Rl
c3QtPnNhdmVfcmVzdG9yZSkKPiAgCQl0c3Rfc3lzX2NvbmZfcmVzdG9yZSgwKTsKPiAgCj4gLQlj
bGVhbnVwX2lwYygpOwo+IC0KPiAgCWlmICh0c3RfdGVzdC0+cmVzdG9yZV93YWxsY2xvY2spCj4g
IAkJdHN0X3dhbGxjbG9ja19yZXN0b3JlKCk7Cj4gKwo+ICsJY2xlYW51cF9pcGMoKTsKPiArCS8q
IERvIG5vdCB1c2UgJ3Jlc3VsdHMnIGFmdGVyIGNsZWFudXBfaXBjKCk6IGl0IGhhcyBiZWVuIHVu
bWFwcGVkLiAqLwoKQWN0dWFsbHkgd2UgY2FuIHJlbW92ZSB0aGlzIGNvbW1lbnQgc2luY2UgYWZ0
ZXIgc2V0dGluZyByZXN1bHRzIHRvIE5VTEwKd2Ugd2lsbCBub3QgY3Jhc2ggYW55bW9yZS4KCi0t
IApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
