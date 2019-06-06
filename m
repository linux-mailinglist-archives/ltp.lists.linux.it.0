Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1337710
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 16:45:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36EBC3EAA52
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 16:45:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BF7C43EA9D5
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 16:45:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 839A81000DF4
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 16:45:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 640DFAFA9;
 Thu,  6 Jun 2019 14:45:49 +0000 (UTC)
Date: Thu, 6 Jun 2019 16:45:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Christian Amann <camann@suse.com>
Message-ID: <20190606144549.GA14501@dell5510>
References: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
 <20190606134321.GA30964@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606134321.GA30964@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

SGkgQ3lyaWwsCgo+ID4gd2hlbiB1c2luZyB0aGUgVFNUX0dFVF9VTlVTRURfUE9SVCBtYWNybyB5
b3Ugc29tZXRpbWVzIGdldCBwb3J0cyBsb3dlcgo+ID4gdGhhbiAxMDI0IHdoaWNoIHdvdWxkIHJl
cXVpcmUgYSB0ZXN0Y2FzZSB0byBoYXZlIHRoZQo+ID4gQ0FQX05FVF9CSU5EX1NFUlZJQ0UgY2Fw
YWJpbGl0eSAob3Igc2ltcGx5IHJ1biBhcyByb290KS4KCj4gTG9va2luZyBhdCB0aGUgY29kZSBh
cyBmYXIgYXMgSSBjYW4gdGVsbCB0aGUgZnVuY3Rpb24gcmV0dXJucyB0aGUgcG9ydAo+IGluIHRo
ZSBuZXR3b3JrIGVuZGlhbml0eSwgd2hpY2ggaXMgYmlnIGVuZGlhbi4gSW50ZWwgQ1BVcyBhcmUg
bGl0dGxlCj4gZW5kaWFuLCBzbyBpZiB5b3Ugd2FudCB0byBwcmludCB0aGUgcG9ydCB5b3UgYWN0
dWFsbHkgaGF2ZSB0byB1c2UKPiBudG9ocygpIGZ1bmN0aW9uIHRvIGNvbnZlcnQgaXQgdG8gdGhl
IGhvc3QgZW5kaWFuaXR5LiBBbmQgaWYgeW91IGFyZQo+IHBhc3NpbmcgdGhhdCB2YWx1ZSBpbiB0
aGUgc29ja2FkZHJfaW4gc3RydWN0dXJlIHlvdSBtdXN0IG5vdCB1c2UgdGhlCj4gaHRvbnMoKSBz
aW5jZSB0aGUgdmFsdWUgaXMgYWxyZWFkeSBpbiB0aGUgY29ycmVjdCBieXRlIG9yZGVyLiBBbmQg
eWVzCj4gdGhpcyBpcyBob3JyaWJseSBjb25mdXNpbmcsIGJ1dCB0aGF0J3MgaG93IGl0IGlzLgpU
aGFua3MgZm9yIGRlYnVnZ2luZyB0aGUgcHJvYmxlbS4KCj4gSSBndWVzcyB0aGF0IHdlIHNob3Vs
ZCB3cml0ZSBkb3duIHRoaXMgcGllY2Ugb2YgaW5mb3JtYXRpb24gaW4gdGhlCj4gZG9jdW1lbnRh
dGlvbiwgYmVjYXVzZSBpdCBsb29rcyBsaWtlIHRoZSB0c3RfZ2V0X3VudXNlZF9wb3J0IHNoZWxs
Cj4gaGVscGVyIGRvZXMgdGhpcyBpbmNvcnJlY3RseSBhbmQgcHJpbnRzIHRoZSByYXcgdmFsdWUg
aW5zdGVhZCBvZgo+IGNvbnZlcnRpbmcgaXQgd2l0aCBudG9ocygpLgpDb3JyZWN0LCBJJ3ZlIHNl
bnQgYSBwYXRjaCBmaXhpbmcgaXQgZm9yIHNoZWxsIHRlc3RzIFsxXS4KQXMgSSBub3RlZCB0aGVy
ZSwgdGhpcyBwcm9ibGVtIHdhcyBldmVuIG9uIHZlcnNpb24gZm9yIG9sZCBBUEkuCgpOb3Qgc3Vy
ZSBhYm91dCBkb2NzIGFzIHRoZXJlIGlzIG5vIGRvY3MgZm9yIG5ldHdvcmsgQVBJIHNoZWxsL0Mg
ZnVuY3Rpb25zIHlldApCdXQgZXZlbiB0aGUgcHJvYmxlbSBmb3Igc2hlbGwgd2FzIGZpeGVkIGJ5
IHRoYXQgcGF0Y2ggaXQnZCBiZSB3b3J0aCB0byBhZGQgbm90ZQphYm91dCBieXRlIG9yZGVyIHRv
IEMgY29kZSB0c3RfZ2V0X3VudXNlZF9wb3J0KCkgYW5kL29yIGhlYWRlciBkZWZpbmluZwpUU1Rf
R0VUX1VOVVNFRF9QT1JUKCkgZGV2ZWxvcGVycyB1c2luZyBpdCBpbiBDLgoKS2luZCByZWdhcmRz
LApQZXRyCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMTExMTY3LwoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
