Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB51E1B05
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 08:12:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 828243C325E
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 08:12:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 876823C22C0
 for <ltp@lists.linux.it>; Tue, 26 May 2020 08:12:05 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id CBA061001443
 for <ltp@lists.linux.it>; Tue, 26 May 2020 08:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590473523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91QRRudgUThBTMo6x370+BGtsGmn5ssINYu8h8DkEv0=;
 b=Y8yiKeJGwjqt5vR+t9jRLU485xV1AaUa8zrXvXNDMPwKlu1nLEVcMuk80+7Ut1spu4D1UN
 rTFV9uCjEsQt57MCq2Vun+besazpsiPPT5UC03vlowp9sGxg0W+19KmOJ/gQSqMK4ZutvA
 roVOtG+60pBImsSTWDeYiHQCY8veM9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-EfktvXx9Odin2VjPR4acCA-1; Tue, 26 May 2020 02:12:00 -0400
X-MC-Unique: EfktvXx9Odin2VjPR4acCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEF5B80B700
 for <ltp@lists.linux.it>; Tue, 26 May 2020 06:11:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B81E410013D2
 for <ltp@lists.linux.it>; Tue, 26 May 2020 06:11:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CFF41809541;
 Tue, 26 May 2020 06:11:59 +0000 (UTC)
Date: Tue, 26 May 2020 02:11:59 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwan@redhat.com>
Message-ID: <218996157.13586289.1590473519056.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dCnkczxB2jWrGprRGQ=F7PB=o53MmUNDrcfhB34z4P9A@mail.gmail.com>
References: <cki.5639E3C778.X5N9P4R7GB@redhat.com>
 <2102236949.13452256.1590328678642.JavaMail.zimbra@redhat.com>
 <CAEemH2dNB3Ktt5LeBLxMKekv7-gj4d=EkQouYmO1SgbyzjLEaw@mail.gmail.com>
 <1440024610.13546915.1590416134343.JavaMail.zimbra@redhat.com>
 <CAEemH2dCnkczxB2jWrGprRGQ=F7PB=o53MmUNDrcfhB34z4P9A@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Waiting for review: Test report for
 kernel 5.6.14-dbf782f.cki (stable-queue)
Thread-Index: WvbHRLEM9EEgKv3dutR7YUJUmM1ldw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Waiting_for_review=3A_Test_rep?=
 =?utf-8?q?ort_for_kernel_5=2E6=2E14-dbf782f=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, skt-results-master@redhat.com,
 CKI Project <cki-project@redhat.com>, LTP List <ltp@lists.linux.it>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gTW9uLCBNYXkgMjUsIDIwMjAgYXQg
MTA6MTUgUE0gSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+ID4K
PiA+IC4uLgo+IAo+IAo+ID4gPiA+ID4gICAgIHMzOTB4Ogo+ID4gPiA+ID4gICAgICDinYwgTFRQ
Cj4gPiA+ID4KPiA+ID4gPiBATGksIGFueSB0aG91Z2h0cyBvbiBodWdldGxiIFRCUk9LcyBoZXJl
PyBJIHRob3VnaHQgeW91IHNhaWQKPiA+ID4gPiAncmVxdWVzdF9odWdlcGFnZXMnCj4gPiA+ID4g
d2FzIG5vdCBzdXBwb3NlZCB0byBiZSBoYXJkIHRlc3QgcmVxdWlyZW1lbnQuCj4gPiA+ID4KPiA+
ID4KPiA+ID4gVGhlIGh1Z2VtbWFwMDUuYyBkb2Vzbid0IGdvZXMgdGhlIG5ldyAncmVxdWVzdF9o
dWdlcGFnZXMnIHdheSBpbiB0aGUgaHVnZQo+ID4gPiBwYWdlIHJlc2VydmluZy4gaXQgdHJpZXMg
dG8gcmVzZXJ2ZSAxMjggaHBhZ2VzIGFuZCBvdmVyY29tbWl0cyAxOTIgaHBhZ2VzCj4gPiA+IGlu
IGhhcmQgY29kaW5nLCBhbmQgcHJvYmFibHkgdG91Y2ggdGhlIG1lbW9yeSBhdmFpbGFibGUgdXBs
aW1pdCBvbiBzMzkweC4KPiA+ID4gc3RhdGljIGxvbmcgc2l6ZSA9IDEyOCwgbGVuZ3RoID0gMzg0
Owo+ID4gPiAuLi4KPiA+ID4gYWRkciA9IFNBRkVfTU1BUChBRERSLCAobGVuZ3RoIC8gMiAqIGh1
Z2VwYWdlc2l6ZSksIFBST1RFQ1RJT04sIEZMQUdTLAo+ID4gZmQsCj4gPiA+IDApOwo+ID4gPgo+
ID4gPiBXZSBjb3VsZCBjb252ZXJ0IHRoaXMgdG8gdXNlIHRoZSBuZXcgcmVxdWVzdF9odWdlcGFn
ZXMgQVBJIGFuZCBkbyB0aGUKPiA+ID4gcmVxdWVzdGVkIG51bWJlciBvZiBodWdlIHBhZ2UgY2hl
Y2tpbmcgYXQgc2V0dXAoKSB0byBtYWtlIHN1cmUgdGhlIHN5c3RlbQo+ID4gPiBvbmx5IHJ1bm5p
bmcgaW4gYSByZWFzb25hYmxlIHNpdHVhdGlvbi4KPiA+Cj4gPiBTb3JyeSwgSSBkaWRuJ3QgbWFr
ZSBpdCBjbGVhciBJIHdhcyB0YWxraW5nIGFib3V0IGh1Z2VtbWFwMDYuIFRoZSBwYXRjaCBpcwo+
ID4gT0ssCj4gPiBzaW5jZSBpdCBtYWtlcyBib3RoIHVzZSByZXF1ZXN0X2h1Z2VwYWdlcyBBUEku
IEJ1dCBzaG91bGQgd2UgYWxzbyBkbwo+ID4gc29tZXRoaW5nCj4gPiB3aXRoIHRoaXMgVEJST0s/
Cj4gPgo+IAo+IEl0IHNlZW1zIHVua2luZCBhbmQgdXNlbGVzcyB0byBleGl0IHdpdGggVEJST0sg
d2hlbiBmYWlsZWQgdG8gcmVzZXJ2ZSB3aXRoCj4gODAlIG1heF9ocGFnZXMgYWdhaW4uIEknbSB0
aGlua2luZyBpZiBpdCBjb3VsZCBiZSBkaXJlY3RseSByZXBsYWNlZCBieQo+IFRDT05GIHRvIHNr
aXAgdGhlIHdob2xlIHRlc3Q/CgpJIHRoaW5rIGl0IGNhbiBmYWlsIGV2ZW4gd2hlbiByZXF1ZXN0
IGlzIGxlc3MgdGhhbiA4MCUsIHdoZW4gbWVtb3J5IGlzIHRvbyBmcmFnbWVudGVkLgpJIGFncmVl
IHdpdGggVENPTkYsIGJ1dCBJJ2Qga2VlcCBudW1iZXJzICh2YWwsIHRzdF9odWdlcGFnZXMpIGlu
IG91dHB1dCwgc28gd2Uga25vdwpob3cgY2xvc2UgaXQgd2FzIHRvIHRoZSByZXF1ZXN0ZWQgbnVt
YmVyLgoKPiAKPiAtLS0gYS9saWIvdHN0X2h1Z2VwYWdlLmMKPiArKysgYi9saWIvdHN0X2h1Z2Vw
YWdlLmMKPiBAQCAtNDMsNyArNDMsNyBAQCB1bnNpZ25lZCBsb25nIHRzdF9yZXF1ZXN0X2h1Z2Vw
YWdlcyh1bnNpZ25lZCBsb25nIGhwYWdlcykKPiAgICAgICAgIFNBRkVfRklMRV9QUklOVEYoUEFU
SF9OUl9IUEFHRVMsICIlbHUiLCB0c3RfaHVnZXBhZ2VzKTsKPiAgICAgICAgIFNBRkVfRklMRV9T
Q0FORihQQVRIX05SX0hQQUdFUywgIiVsdSIsICZ2YWwpOwo+ICAgICAgICAgaWYgKHZhbCAhPSB0
c3RfaHVnZXBhZ2VzKQo+IC0gICAgICAgICAgICAgICB0c3RfYnJrKFRCUk9LLCAibnJfaHVnZXBh
Z2VzID0gJWx1LCBidXQgZXhwZWN0ICVsdSIsIHZhbCwKPiB0c3RfaHVnZXBhZ2VzKTsKPiArICAg
ICAgICAgICAgICAgdHN0X2JyayhUQ09ORiwgIk5vdCBlbm91Z2ggaHVnZXBhZ2VzIGZvciB0ZXN0
aW5nLiIpOwo+IAo+ICAgICAgICAgdHN0X3JlcyhUSU5GTywgIiVsdSBodWdlcGFnZShzKSByZXNl
cnZlZCIsIHRzdF9odWdlcGFnZXMpOwo+ICBvdXQ6Cj4gCj4gCj4gPgo+ID4gICAgIHRzdF9odWdl
cGFnZS5jOjQ2OiBCUk9LOiBucl9odWdlcGFnZXMgPSAxNzEsIGJ1dCBleHBlY3QgMjU1Cj4gPgo+
ID4KPiAKPiAtLQo+IFJlZ2FyZHMsCj4gTGkgV2FuZwo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
