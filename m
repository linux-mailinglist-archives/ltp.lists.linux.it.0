Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE22D6EE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 09:49:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4291B3EA1DC
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 09:49:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 412EB3EA18F
 for <ltp@lists.linux.it>; Wed, 29 May 2019 09:49:05 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 45163200FF7
 for <ltp@lists.linux.it>; Wed, 29 May 2019 09:49:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4EF513082B5A;
 Wed, 29 May 2019 07:49:02 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD33960C18;
 Wed, 29 May 2019 07:49:01 +0000 (UTC)
Date: Wed, 29 May 2019 15:49:00 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190529074900.c656afgiwcb7bhta@XZHOUW.usersys.redhat.com>
References: <20190524122357.GA28108@dell5510>
 <20190525115112.15399-1-xzhou@redhat.com>
 <20190527120945.GA25513@dell5510>
 <20190527133859.mun7h2xlzjdcwlqv@XZHOUW.usersys.redhat.com>
 <20190527153632.GA20053@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527153632.GA20053@dell5510>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 29 May 2019 07:49:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4 1/2] OVL_MNT: add helpers to setup overlayfs
	mountpoint
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

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDU6MzY6MzJQTSArMDIwMCwgUGV0ciBWb3JlbCB3cm90
ZToKPiBIaSBBbWlyLCBNdXJwaHksCj4gCj4gPiA+IFRPRE86Cj4gPiA+IEknbSBzdGlsbCBub3Qg
c3VyZSBhYm91dCBvdmxfbW91bnRlZC4gVGhlcmUgaXMgc3RhdGljIGludCBtbnRwb2ludF9tb3Vu
dGVkIGluCj4gPiA+IGxpYi90c3RfdGVzdC5jLCB3aGljaCBkb2VzIHVtb3VudC4gIHRzdF90ZXN0
LT5tbnRwb2ludCwgSSBndWVzcyB3ZSBzaG91bGQgdXNlCj4gPiA+IGl0LiBXRFlUPwo+IAo+ID4g
bW50cG9pbnRfbW91bnRlZCBpcyB0cmFja2luZyBtb3VudCBzdGF0dXMgb2YgYSBzZXBhcmF0ZWQg
bW91bnRwb2ludCB3aGljaAo+ID4gaXMgdGhlIGJhc2UgZm9yIGNyZWF0aW5nIG92ZXJsYXkgZGly
cyBhbmQgb3ZlcmxheSBtb3VudHBvaW50LiBUaGlzIHNlcGFyYXRlZAo+ID4gbW91bnRwb2ludCBp
cyBzZXR1cCBmcm9tIHNjcmF0Y2gsIGdyYWIgZGV2LCBtZmtzIGV0Yy4gSXQncyBzZXBhcmF0ZWQg
ZnJvbQo+ID4gcnVubHRwIC1kIERJUi4gVGhpcyBpcyB3aHkgdGhpcyBwYXRjaCBpcyBuZWVkZWQu
Cj4gCj4gPiBPdmVybGF5ZnMgaXMgbW91bnRlZCBvbiB0aGlzIHNlcGFyYXRlZCBtb3VudHBvaW50
LiBUZXN0Y2FzZXMgbmVlZCB0byB1bW91bnQKPiA+IG92ZXJsYXlmcyBpbiBjbGVhbnVwIGlmIHNl
dHVwIG92ZXJsYXkgc3VjY2Vzc2Z1bGx5LiBUaGF0J3Mgd2h5IG92bF9tb3VudGVkCj4gPiBpcyBu
ZWVkZWQuCj4gCj4gPiBIb3cgYWJvdXQgU0FGRV9VTU9VTlRfT1ZFUkxBWSBpZ25vcmluZyBFSU5W
QUwgPwo+IEkgZG9uJ3Qgc2VlIG11Y2ggYmVuZWZpdHMsIHdoZW4gd2UgaGF2ZSBTQUZFX1VNT1VO
VCgpLiAgTW9yZSB1c2VmdWwgbG9va3MgdG8gbWUKPiBmb3Igc2ltcGxlIGNhc2VzIG1vdmUgb3Zs
X21vdW50ZWQgYW5kIFNBRkVfVU1PVU5UKE9WTF9NTlQpICB0byBsaWJyYXJ5ICh0aGUgb25seQo+
IHRoaW5nIG5lZWRlZCB3b3VsZCBiZSBzb21lIGZsYWcgZm9yIHN0cnVjdCB0c3RfdGVzdCBlLmcu
IC5tb3VudF9vdmVybGF5ID0gMSkuCgpBZnRlciBzb21lIGRpZ2dpbmcsIEkgdGhpbmsgcHV0dGlu
ZyBvdmxfbW91bnRlZCBhbmQgVU1PVU5UIHRvIGxpYnJhcnkgaXMKZ29vZCBidXQgY3JlYXRpbmcg
ZGlycyBhbmQgTU9VTlQgaW4gbGlicmFyeSBiZW5lZml0cyBsZXNzLiBCZWNhdXNlIHNwbGl0dGlu
ZwpjcmVhdGluZyBkaXJzIGFuZCBNT1VOVCB3YXMgaW50ZW5kZWQgdG8gYmUgbW9yZSBmbGV4aWJs
ZSBvbiB0aGlzLiBBbHNvLAppbm90aWZ5MDcvOCBuZWVkcyB0byBjcmVhdGUgZXh0cmEgZGlycyBi
ZWZvcmUgbW91bnRpbmcuIFNvIGV4ZWN2ZWF0MDMgaXMKdGhlIG9ubHkgb25lIGNhc2UgdG8gYmVu
ZWZpdCBmcm9tIGNyZWF0aW5nIGRpcnMgYW5kIE1PVU5UIGluIHRoZSBsaWJyYXJ5LgoKVGhhbmtz
IQoKPiAKPiA+IFRoYW5rcyEKPiA+IE0KPiAKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
