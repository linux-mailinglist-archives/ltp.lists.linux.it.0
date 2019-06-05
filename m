Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392935E9F
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:06:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E93D23EA6FA
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:06:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 34D6C3EA3C0
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:06:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D24126019D3
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:06:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35342AC10;
 Wed,  5 Jun 2019 14:06:40 +0000 (UTC)
Date: Wed, 5 Jun 2019 16:06:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Murphy Zhou <jencce.kernel@gmail.com>
Message-ID: <20190605140638.GA25618@rei>
References: <5CF750DF.9040006@cn.fujitsu.com>
 <20190605053312.17369-1-jencce.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605053312.17369-1-jencce.kernel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/preadv2/preadv203: set mount_device
	flag
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

SGkhCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVh
ZHYyMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYwo+
IGluZGV4IDgxMGQxZThkYi4uZTRmNjhhNTFiIDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYwo+IEBAIC0yNjEsNiArMjYxLDcgQEAgc3RhdGlj
IHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICAJLmNsZWFudXAgPSBjbGVhbnVwLAo+ICAJLnRl
c3RfYWxsID0gdmVyaWZ5X3ByZWFkdjIsCj4gIAkubW50cG9pbnQgPSBNTlRQT0lOVCwKPiArCS5t
b3VudF9kZXZpY2UgPSAxLAo+ICAJLmFsbF9maWxlc3lzdGVtcyA9IDEsCj4gIAkubmVlZHNfdG1w
ZGlyID0gMSwKPiAgCS5uZWVkc19yb290ID0gMSwKCldoYXQgYSBzaWxseSBtaXN0YWtlIG9mIG1p
bmUsIHRoYW5rcyBmb3IgZml4aW5nIHRoYXQuCgpVbmZvcnR1bmF0ZWx5IGl0IHNlZW1zIHRoYXQg
dGhpcyBicmVha3MgdGhlIHRlc3Qgb24gYSBzdWJzZXQgb2YKZmlsZXN5c3RlbXMuIEZvciBtZSBp
dCBmYWlscyB3aGVuIGZpbGVzIGFyZSB3cml0dGVuIGluIHRoZSB0ZXN0IHNldHVwLApndWVzcyB0
aGF0IHdyaXRpbmcgMTAwMCBmaWxlcyB3aXRoIDY2IGJsb2NrcyBvZiBzaXplIDQxMjMgaXMgYWJv
dXQgMjM2TUIKaXMgdG9vIG11Y2ggZm9yIHRoZSBkZWZhdWx0IDI1Nk1CIGxvb3AgZGV2aWNlLgoK
SSB3aWxsIGxvb2sgaW50byB0aGF0IGFuZCBzZW5kIGEgcGF0Y2ggbGF0ZXIgb24uCgotLSAKQ3ly
aWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
