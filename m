Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2261D4180
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:39:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4094A3C2278
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:39:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 701003C1480
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:39:37 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 98529200A03
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:39:36 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 057F19F62F;
 Fri, 11 Oct 2019 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570801174; bh=ywPqnmdKdV2a3hpYw4Al1eplyPslUHP3LxMXTXJreok=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ZwqhcglEpHE9pcHkDf+la9rMuxKBYQIsBlGjx1c+HUJojqm6ee5v11dBghKLMp7mC
 9W4RcpNfSJ0G+KzukbrV102OIo+jAncXyJZ9jQq9/UCLG1pFl9goaufJ/KS50sCdxf
 P7BtJZnKW/8JeQW470JIRqmvhS2ZGqOzIJqWt61M=
To: cfamullaconrad@suse.com, Petr Vorel <pvorel@suse.cz>
References: <20191011090737.17997-1-lkml@jv-coder.de>
 <20191011100604.GA11441@dell5510> <1570799029.4238.15.camel@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2dc10bff-8a64-0054-269a-d9d748f10943@jv-coder.de>
Date: Fri, 11 Oct 2019 15:39:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1570799029.4238.15.camel@suse.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Rename tst_test_* to tst_require_*
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

Cj4gT24gRnJpLCAyMDE5LTEwLTExIGF0IDEyOjA2ICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgo+
PiBIaSwKPj4KPj4gQ2M6IExpIGFuZCBDbGVtZW5zCj4+Cj4+PiB0aGVzZSBwYXRjaGVzIHJlbmFt
ZSB0c3RfdGVzdF8qIHRvIHRzdF9yZXF1aXJlXyosIHRvIGJldHRlcgo+Pj4gZGVzY3JpYmUKPj4+
IHRoZWlyIHVzZS4gVGhlcmUgaXMgYWxzbyB0c3RfcmVxdWlyZV9yb290LCB0aGF0IGhhcyB0aGUg
c2FtZQo+Pj4gYmVoYXZpb3I6IEl0IGFsc28gY2FsbHMgdHN0X2JyayBpbiBjYXNlIG9mIGEgZmFp
bGluZyByZXF1aXJlbWVudC4KPj4+IFlvdSBjYW4gYWxzbyBnZXQgdGhpcyBwYXRjaCBmcm9tIHRo
ZSBmb2xsb3dpbmcgcmVwbzoKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9Nb2ZYL2x0cC9jb21taXRz
L3JlbmFtZV90c3RfdGVzdC10c3RfcmVxdWlyZQo+PiBzb3JyeSBmb3Igbm90IHRoaW5raW5nIGZp
cnN0LCBJIHdvbmRlciBpZiB3ZSB3YW50IHRvIHN5bmMKPj4gdHN0X3Rlc3RfKiAoZnVuY3Rpb24g
bmFtZSkgdnMgJFRTVF9ORUVEU18qICh0ZXN0IEFQSSB2YXJpYWJsZSBuYW1lKSwKPj4gZS5nLjog
dHN0X3JlcXVpcmVfZHJpdmVycyAkVFNUX05FRURTX0RSSVZFUlMKPiBJIGZ1bGx5IGFncmVlIHdp
dGggUGV0ciB0aGF0IHdlIG11c3QgYmUgY29uc2lzdGVudCBpbiBuYW1pbmcgYmV0d2Vlbgo+IHZh
cmlhYmxlLSBhbmQgZnVuY3Rpb24tbmFtZS4KQWN0dWFsbHkgSSBhbSBtb3JlIHdpdGggY3lyaWwn
cyByZWFzb25pbmcsIHRoYXQgb25lIGlzIG1ldGFkYXRhIGFuZCBvbmUgCmlzIGZ1bmN0aW9uIGNh
bGwgaGVyZS4KSXQgd2Fzbid0IGNvbnNpc3RlbnQgaW4gdGhlIHBhc3QuIFRoZSByZXF1aXJlIGlz
IG1vcmUgbGlrZSBhbiBpbXBlcmF0aXZlIApoZXJlIGFuZCB0aGUgbmVlZHMgaXMKZGVzY3JpcHRp
dmUuCkknbSBhbHNvIG5vIG5hdGl2ZSBzcGVha2VyLCBidXQgaW4gbXkgb3Bpbm9uIG5lZWRpbmcg
YSBjb21tYW5kIHNvdW5kcyBhIApiaXQgc3RyYW5nZS4KT25lIHRoaW5nIEkgZm91bmQgaXMgdGhh
dCBhIG5lZWQgaXMgcmVxdWlyZWQgZm9yIGxpdmluZywgd2hpbGUgYSAKcmVxdWlyZW1lbnQgbXVz
dCBiZQpmdWxmaWxsZWQsIGZvciBzb21ldGhpbmcgdG8gaGFwcGVuLiBXaXRoIHRoaXMgZGVmaW5p
dGlvbiByZXF1aXJlbWVudCAKZml0cy4gVGhlcmUgaXMgYWxzbyB0aGUgdGVybQpyZXF1aWVyZW1l
bnQgaW4gc29mdHdhcmUgZW5naW5lZXJpbmcgYW5kIG5vIHRlcm0gIm5lZWRtZW50IgoKQnV0IHN0
cmFuZ2VseSBJIHN0aWxsIGhhdmUgbm8gcHJvYmxlbSB3aXRoIFRTVF9ORUVEU18qLCBidXQgSSB3
b3VsZCBhbHNvIApiZSBvayB3aXRoClRTVF9SRVFVSVJFU18uIEFjdHVhbGx5IEknZCBwcm9wYWJs
eSBjaG9zZSBpdCwgaWYgSSB3YXMgZGVzaWduaW5nIHRoZSAKbGlicmFyeS4KCkkgZG8gbm90IHJl
YWxseSBsaWtlIHJlbmFtaW5nIHRzdF90ZXN0XyogdG8gdGVzdF9uZWVkc18qLiBOZWVkcyBkb2Vz
IG5vdCAKc291bmQKc3Ryb25nIGVub3VnaCB0byBtZSBpbiB0aGF0IGNvbnRleHQuwqAgQnV0IEkg
anVzdCBtYWRlIGEgcXVpY2sgc2VhcmNoIGZvciAKIm5lZWRzXyIKYW5kIHRoZXJlIGlzIHNvIG11
Y2ggbmVlZHMgaW4gdGhlIGMgbGlicmFyeSBhcyB3ZWxsLCB0aGF0IHRvdWNoaW5nIGFsbCAKb2Yg
dGhpcyBpcyBtYXliZQp0byBtdWNoLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
