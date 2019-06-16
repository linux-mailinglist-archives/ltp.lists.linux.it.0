Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B99473A6
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 09:34:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6B383EA3FB
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 09:34:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7F99E3EA3FB
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:34:09 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6C453600D79
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:34:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0AE4685362;
 Sun, 16 Jun 2019 07:34:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F294877DC0;
 Sun, 16 Jun 2019 07:34:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFF894A460;
 Sun, 16 Jun 2019 07:34:05 +0000 (UTC)
Date: Sun, 16 Jun 2019 03:34:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <151498464.28356667.1560670442630.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190613151419.GE29926@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
 <20190613141714.GC29926@rei.lan>
 <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
 <20190613151419.GE29926@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.16, 10.4.195.2]
Thread-Topic: syscalls/ioctl_ns0[156]: align stack and wait for child
Thread-Index: +8JAuLyFD7rTr+xUlhGR4BsZmwnjRw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Sun, 16 Jun 2019 07:34:06 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/ioctl_ns0[156]: align stack and
 wait for child
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGkhCj4gPiA+IElmIEkgcmVtZW1iZXIg
Y29ycmVjdGx5IGF0IHNvbWUgcG9pbnQgd2UgZGVjaWRlZCB0byBjbGVhbiB1cCBhZnRlciB0ZXN0
cwo+ID4gPiBwcm9wZXJseSBzbyB0aGF0IHdlIGRvbid0IHVwc2V0IHZhcmlvdXMgZGVidWdnaW5n
IHRvb2xzLCBpLmUuIGNvdmVyaXR5LAo+ID4gPiB2YWxncmluZCwgZXRjLiBhbmQgSSB0aGluayB0
aGF0IHlvdSB3ZXJlIHBhcnQgb2YgdGhhdCBkaXNjdXNzaW9uLgo+ID4gCj4gPiBJIHJlY2FsbCBJ
IHN0YXJ0ZWQgd2l0aCB0aGF0IHBvc2l0aW9uIChmcmVlIGFsbCksIGFuZCBJIHRob3VnaHQgeW91
Cj4gPiB0dXJuZWQgbWUgYXJvdW5kIGFmdGVyIHRoaXMgbWFueSB5ZWFycyA6LSkuCj4gCj4gV2Vs
bCBJIGRpZG4ndCBjYXJlIHRoYXQgbXVjaCwgYnV0IEkgZ3Vlc3MgdGhhdCBJIGxlYW4gc2xpZ2h0
bHkgdG8gZnJlZQo+IHRoZSBtZW1vcnkgOi0pLgoKT0ssIHNvIHNob3VsZCBJIHJlcG9zdCBvciBp
cyB0aGlzIGdvb2QgdG8gZ28gd2l0aCBmcmVlIGFkZGVkIHRvIGNsZWFudXA/Cgo+IAo+ID4gRG8g
d2UgaGF2ZSBhbnl0aGluZyBhYm91dCB0aGlzIGluIHN0eWxlIGd1aWRlPyBJIG9ubHkgZm91bmQg
YnJpZWYgbWVudGlvbgo+ID4gaW4gImRvbid0IGNhbGwgY2xlYW51cCBmcm9tIHNldHVwIiBzZWN0
aW9uLCB3aGljaCBpc24ndCBldmVuIHBvc3NpYmxlIHdpdGgKPiA+IG5ld2xpYi4KPiAKPiBJIGRv
bid0IHRoaW5rIHNvLiBJIGd1ZXNzIHRoYXQgd2Ugc2hvdWxkIHdyaXRlIHNvbWV0aGluZyBkb3du
LCBvbmNlIHdlCj4gZGVjaWRlIHdoYXQgaXMgdGhlIHByZWZlcmVkIG9wdGlvbi4KPiAKPiA+IC4u
Lgo+ID4gWW91IGRvbid0IG5lZWQgdG8gY2xlYW4gdXAgdGhlIGZvbGxvd2luZzoKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiA+ICAqICttYWxsb2MoMykrJ2Vk
IG1lbW9yeS4KPiA+ICAqIFJlYWQtb25seSBmaWxlIGRlc2NyaXB0b3JzIGluIHBlcnNpc3RlbnQg
cGF0aHMgKGkuZS4gbm90Cj4gPiAgICB0ZW1wb3JhcnkgZGlyZWN0b3JpZXMpLgo+IAo+IExvb2tz
IGxpa2UgdGhpcyBpcyB0ZXJyaWJseSBvdXRkYXRlZCwgYXQgbGVhc3QgSSB0ZW5kIHRvIHRlbGwg
cGVvcGxlIHRvCj4gY2xvc2UgYWxsIGZpbGVkZXNjcmlwdG9ycyB0byBtYWtlIHRoaW5ncyBzaW1w
bGVyLgo+IAo+IC0tCj4gQ3lyaWwgSHJ1YmlzCj4gY2hydWJpc0BzdXNlLmN6Cj4gCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
