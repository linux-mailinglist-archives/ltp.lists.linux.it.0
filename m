Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF32B5AFE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 09:33:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85EB93C4F20
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 09:33:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 37C2D3C4F08
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 09:33:12 +0100 (CET)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 88749200AF1
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 09:33:11 +0100 (CET)
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1A42724000A;
 Tue, 17 Nov 2020 08:33:08 +0000 (UTC)
Date: Tue, 17 Nov 2020 09:33:06 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201117093306.15a64998@kmaincent-XPS-13-7390>
In-Reply-To: <20201116184825.GB171432@pevik>
References: <20201116101840.15433-1-kory.maincent@bootlin.com>
 <20201116184143.GA171432@pevik> <20201116184825.GB171432@pevik>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/host: update to new api
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
Cc: ltp@lists.linux.it, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gUGV0ciwKCk9uIE1vbiwgMTYgTm92IDIwMjAgMTk6NDg6MjUgKzAxMDAKUGV0ciBWb3Jl
bCA8cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgoKPiA+ID4gKyAgICAgICAgICAgIEVYUEVDVF9QQVNT
IGhvc3QgJHJob3N0X2FkZHIgXD4vZGV2L251bGwgMj4mMSAgCj4gPiBXZSBuZWVkIHRvIHJlZGly
ZWN0IGFsc28gc2Vjb25kID4gYW5kICY6Cj4gPiBFWFBFQ1RfUEFTUyBob3N0ICRyaG9zdF9hZGRy
IFw+L2Rldi9udWxsIDJcPlwmMSAgCj4gCj4gQlRXIDI+JjEgZG9lcyBub3QgbWFrZSBzZW5zZSBp
biB0aGlzIGNvbnRleHQgKGl0J3MgYSByZWRpcmVjdGlvbiBvZiBlcnJvcgo+IG1lc3NhZ2Ugb2Yg
RVhQRUNUX1BBU1MgZnVuY3Rpb24sIHdoaWNoIHdvdWxkIGJlIHRvIHN0ZG91dC4KPiBJIGFsc28g
bm90aWNlZCB0aGlzIHBhcnQgb2YgdHJhY2Vyb3V0ZTAxLnNoIGlzIGFsc28gd3Jvbmc6Cj4gRVhQ
RUNUX1BBU1MgdHJhY2Vyb3V0ZSAkaXAgJGJ5dGVzIC1uIC1tIDIgJG9wdHMgXD5vdXQubG9nIDI+
JjEKPiAKPiBJdCBzaG91bGQgYmU6Cj4gRVhQRUNUX1BBU1MgdHJhY2Vyb3V0ZSAkaXAgJGJ5dGVz
IC1uIC1tIDIgJG9wdHMgXD5vdXQubG9nIDJcPlwmMQo+IAo+IEJ1dCBJTUhPIGl0J2QgYmUgYmV0
dGVyIGluIGJvdGggY2FzZXMgdG8ga2VlcCBzdGRlcnIgbm90IHJlZGlyZWN0ZWQKPiAoZG9uJ3Qg
aGlkZSBwcm9ibGVtcykuIFRoZXJlZm9yZSwgdW5sZXNzIHlvdSdyZSBhZ2FpbnN0IGl0LCBJJ2xs
IHJlbW92ZQo+IHJlZGlyZWN0aW9uIGZyb20gdHJhY2Vyb3V0ZTAxLnNoLgoKWWVzLCB5b3VyIHJp
Z2h0LgpJIGFtIG5ldyB0byBMVFAgc28gSSBzdGlsbCBtYWtlIHNvbWUgb2J2aW91cyBtaXN0YWtl
cywgdGhhbmsgeW91IGZvciB0YWtpbmcKdGltZSB0byBjb3JyZWN0IG1lLgpUaGUgc2ltcGxpZmll
ZCB2YXJpYW50IHdpdGhvdXQgc3RkZXJyIHJlZGlyZWN0aW9uIHNlZW1zIG9rYXkgdG8gbWUuCgpS
ZWdhcmRzLAoKS8O2cnkKCgotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
