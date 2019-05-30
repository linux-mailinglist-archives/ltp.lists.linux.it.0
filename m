Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229A30282
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 21:00:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD7863EA690
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 21:00:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 38D7D3EA179
 for <ltp@lists.linux.it>; Thu, 30 May 2019 21:00:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C6A221A01117
 for <ltp@lists.linux.it>; Thu, 30 May 2019 21:00:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E82F3AE2E;
 Thu, 30 May 2019 19:00:16 +0000 (UTC)
Date: Thu, 30 May 2019 21:00:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190530190012.GA32123@x230>
References: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] TST_GET_UNUSED_PORT returns ports < 1024
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

SGkgQ2hyaXN0aWFuLAoKPiBIaSwKCj4gd2hlbiB1c2luZyB0aGUgVFNUX0dFVF9VTlVTRURfUE9S
VCBtYWNybyB5b3Ugc29tZXRpbWVzIGdldCBwb3J0cyBsb3dlcgo+IHRoYW4gMTAyNCB3aGljaCB3
b3VsZCByZXF1aXJlIGEgdGVzdGNhc2UgdG8gaGF2ZSB0aGUKPiBDQVBfTkVUX0JJTkRfU0VSVklD
RSBjYXBhYmlsaXR5IChvciBzaW1wbHkgcnVuIGFzIHJvb3QpLgpUaGF0IHN1cnByaXNlZCBtZS4g
SSB0aG91Z2h0IHVzaW5nIGJpbmQoKSB3aXRoIG5vbi1yb290IHVzZXIgZG9lc24ndCBkbyB0aGF0
LApidXQgbmVlZCB0byBjaGVjayB0aGUgaW1wbGVtZW50YXRpb24gaW4gdGhlIGtlcm5lbC4KCj4g
T2YgY291cnNlIHlvdSBjb3VsZCB3cml0ZSBhIHdyYXBwZXIgbGlrZSB0aGUgZm9sbG93aW5nIHRv
IGF2b2lkIHRoYXQKPiBpc3N1ZSwgYnV0IGluIG15IG9waW5pb24gaXQgd291bGQgYmUgbmljZSB0
byBoYXZlIHRoZSBvcHRpb24gdG8gZ2V0Cj4gbm9uLXJvb3QgcG9ydHMgZGlyZWN0bHkgZnJvbSB0
aGUgbGlicmFyeS4KCj4gLyogV3JhcHBlciB0byB0byBnZXQgYSBub24tcm9vdCBwb3J0IGlmIG5l
Y2Vzc2FyeSAqLwo+IHN0YXRpYyBpbnQgZ2V0X3BvcnQodWlkX3QgdWlkKQo+IHsKPiDCoMKgwqDC
oMKgwqDCoCBzdGF0aWMgaW50IGNvdW50ID0gMTA7Cj4gwqDCoMKgwqDCoMKgwqAgaW50IHBvcnQ7
Cgo+IMKgwqDCoMKgwqDCoMKgIHBvcnQgPSBUU1RfR0VUX1VOVVNFRF9QT1JUKEFGX0lORVQsIFNP
Q0tfU1RSRUFNKTsKPiDCoMKgwqDCoMKgwqDCoCBpZiAocG9ydCA8IDEwMDAgJiYgdWlkICE9IDAp
IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFjb3VudCkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9icmsoVEJST0ssICJD
b3VsZCBub3QgZ2V0IGZpdHRpbmcgcG9ydCIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb3VudC0tOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZ2V0
X3BvcnQodWlkKTsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHBv
cnQ7Cj4gfQoKPiBLaW5kIHJlZ2FyZHMsCgo+IENocmlzdGlhbgoKCktpbmQgcmVnYXJkcywKUGV0
cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
