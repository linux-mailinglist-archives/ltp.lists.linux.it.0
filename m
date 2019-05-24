Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C82957C
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 12:09:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEE03294AE2
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 12:09:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B62D53EA16D
 for <ltp@lists.linux.it>; Fri, 24 May 2019 12:08:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E0438141CE74
 for <ltp@lists.linux.it>; Fri, 24 May 2019 12:08:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30A90AF56;
 Fri, 24 May 2019 10:08:55 +0000 (UTC)
Date: Fri, 24 May 2019 12:08:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190524100853.GA17393@dell5510>
References: <20190524095317.10240-1-pvorel@suse.cz>
 <20190524095806.GA19303@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524095806.GA19303@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] net: Disable building tst_get_unused_port in old
	API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+ID4gQ29tbWl0IGZhNmE0ZTcwOCBtb3ZlZCB0c3RfZ2V0X3VudXNlZF9wb3J0IGludG8g
bmV3IEFQSSwgYnV0IGxlZnQgY29kZQo+ID4gaW4gTWFrZWZpbGUgYnVpbHQgaXQgYWxzbyBmb3Ig
b2xkIEFQSS4gSXQgd2FzIHVwIHRvIG1ha2Ugd2hpY2ggb2YgdGhlc2UKPiA+IHdhcyBjb3BpZWQg
bGFzdCBhbmQgcmVtYWluIGluc3RhbGxlZC4KCj4gPiBBbHNvIHJlbW92ZSBjb21wYXJpc29uIGZv
ciB0c3RfZ2V0X3VudXNlZF9wb3J0IGZyb20gbHRwYXBpY21kLmMuCgo+ID4gRml4ZXM6IGZhNmE0
ZTcwOCAoIm5ldDogSW50cm9kdWNlIFRTVF9HRVRfVU5VU0VEX1BPUlQoKSBtYWNybyBpbnRvIEMg
QVBJIikKCj4gU29ycnkgZm9yIG5vdCBjYXRjaGluZyB0aGF0IGR1cmluZyByZXZpZXcsIHRoaXMg
aXMgb2J2aW91c2x5IGZpbmUsCj4gYWNrZWQuClRoYW5rcyBmb3IgYSByZXZpZXcsIG1lcmdlZC4K
CktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
