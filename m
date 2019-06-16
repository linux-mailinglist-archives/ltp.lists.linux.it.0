Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FE47379
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 09:05:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 924353EB062
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 09:05:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9D4A43EA4C8
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:04:59 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A8FE61A00445
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:04:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50A2CC057F3D;
 Sun, 16 Jun 2019 07:04:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05AEE2968E;
 Sun, 16 Jun 2019 07:04:49 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9B6D1806B15;
 Sun, 16 Jun 2019 07:04:46 +0000 (UTC)
Date: Sun, 16 Jun 2019 03:04:43 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <847341899.28355719.1560668683548.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cCvaPKa480Y3L5+V8ihRtwcTYZPo5ebU7Ss8tfRDXkuQ@mail.gmail.com>
References: <1552978181-27748-1-git-send-email-sumit.garg@linaro.org>
 <1552978181-27748-4-git-send-email-sumit.garg@linaro.org>
 <1142529550.28348566.1560640103965.JavaMail.zimbra@redhat.com>
 <CAEemH2cCvaPKa480Y3L5+V8ihRtwcTYZPo5ebU7Ss8tfRDXkuQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.16, 10.4.195.13]
Thread-Topic: syscalls/tgkill03: add new test
Thread-Index: jGUMuA6OTGIZwdA6ZuwroKg4FIUciQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Sun, 16 Jun 2019 07:04:55 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: daniel thompson <daniel.thompson@linaro.org>, LTP List <ltp@lists.linux.it>,
 Greg Hackmann <ghackmann@google.com>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/tgkill03: add new test
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gU3VuLCBKdW4gMTYsIDIwMTkgYXQg
NzowOCBBTSBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPgo+
ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiArc3RhdGljIHZvaWQgc2V0dXAo
dm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgc2lnc2V0X3Qgc2lndXNyMTsKPiA+ID4gKyAgICAg
cHRocmVhZF90IGRlZnVuY3RfdGhyZWFkOwo+ID4gPiArCj4gPiA+ICsgICAgIHNpZ2VtcHR5c2V0
KCZzaWd1c3IxKTsKPiA+ID4gKyAgICAgc2lnYWRkc2V0KCZzaWd1c3IxLCBTSUdVU1IxKTsKPiA+
ID4gKyAgICAgcHRocmVhZF9zaWdtYXNrKFNJR19CTE9DSywgJnNpZ3VzcjEsIE5VTEwpOwo+ID4g
PiArCj4gPiA+ICsgICAgIHBhcmVudF90Z2lkID0gZ2V0cGlkKCk7Cj4gPiA+ICsgICAgIHBhcmVu
dF90aWQgPSBzeXNfZ2V0dGlkKCk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgU0FGRV9QVEhSRUFEX0NS
RUFURSgmY2hpbGRfdGhyZWFkLCBOVUxMLCBjaGlsZF90aHJlYWRfZnVuYywgTlVMTCk7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgVFNUX0NIRUNLUE9JTlRfV0FJVCgwKTsKPiA+Cj4gPiBJJ20gc2VlaW5n
IHJlcG9ydHMgb2YgdGhpcyB0ZXN0IGZhaWxpbmcgb24gczM5MHg6Cj4gPgo+ID4gc3RfdGVzdC5j
OjEwOTY6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCj4gPiB0Z2tpbGwwMy5j
OjkyOiBQQVNTOiBJbnZhbGlkIHRnaWQgZmFpbGVkIGFzIGV4cGVjdGVkOiBFSU5WQUwKPiA+IHRn
a2lsbDAzLmM6OTI6IFBBU1M6IEludmFsaWQgdGlkIGZhaWxlZCBhcyBleHBlY3RlZDogRUlOVkFM
Cj4gPiB0Z2tpbGwwMy5jOjkyOiBQQVNTOiBJbnZhbGlkIHNpZ25hbCBmYWlsZWQgYXMgZXhwZWN0
ZWQ6IEVJTlZBTAo+ID4gdGdraWxsMDMuYzo5NjogRkFJTDogRGVmdW5jdCB0aWQgc2hvdWxkIGhh
dmUgZmFpbGVkIHdpdGggRVNSQ0g6IFNVQ0NFU1MKPiA+IHRna2lsbDAzLmM6OTI6IFBBU1M6IERl
ZnVuY3QgdGdpZCBmYWlsZWQgYXMgZXhwZWN0ZWQ6IEVTUkNICj4gPiB0Z2tpbGwwMy5jOjk5OiBQ
QVNTOiBWYWxpZCB0Z2tpbGwgY2FsbCBzdWNjZWVkZWQKPiA+Cj4gPiBhbmQgSSBzdXNwZWN0IHRo
aXMgcGllY2U6Cj4gPgo+ID4gPiArCj4gPiA+ICsgICAgIFNBRkVfUFRIUkVBRF9DUkVBVEUoJmRl
ZnVuY3RfdGhyZWFkLCBOVUxMLCBkZWZ1bmN0X3RocmVhZF9mdW5jLAo+ID4gTlVMTCk7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgU0FGRV9QVEhSRUFEX0pPSU4oZGVmdW5jdF90aHJlYWQsIE5VTEwpOwo+
ID4gPiArfQo+ID4KPiA+IGdsaWJjIHB0aHJlYWRfam9pbigpIHdhaXRzIGZvciBDTE9ORV9DSElM
RF9DTEVBUlRJRCB0byBjbGVhciB0aWQsCj4gPiBhbmQgdGhlbiByZXN1bWVzLiBXaGljaCBrZXJu
ZWwgZG9lcyBhdDoKPiA+ICAgZG9fZXhpdAo+ID4gICAgIGV4aXRfbW0KPiA+ICAgICAgIG1tX3Jl
bGVhc2UKPiA+ICAgICAgICAgcHV0X3VzZXIoMCwgdHNrLT5jbGVhcl9jaGlsZF90aWQpOwo+ID4K
PiA+IHNvIHRoZXJlJ3Mgc3RpbGwgd29yayB0byBiZSBkb25lIGFmdGVyIHRoYXQsIGFuZCBJIHN1
c3BlY3QgdGlkIGlzIHN0aWxsCj4gPiB2YWxpZAo+ID4gd2hpbGUgdGhhdCBoYXBwZW5zLgo+ID4K
PiA+IE15IGZpcnN0IGlkZWE6IHdhaXQgdW50aWwgL3Byb2MvcGlkL3Rhc2svPHRpZD4gZGlzYXBw
ZWFycy4KPiA+Cj4gCj4gVGhlIGFuYXlzaXMgaXMgcHJvYmFibHkgcmlnaHQsIGJ1dCB0aGlzIGlk
ZWEgZG9lc24ndCB3b3JrIGZvciBtZS4gU2VlbXMKPiAvcHJvYy9waWQvdGFzay88dGlkPiBpcyBu
b3QgdGhlIGtleSBwb2ludCB0byBjb25maXJtIHRoYXQgdGlkIGhhcyBiZWVuCj4gY2xlYXIuCj4g
Cj4gSSBqdXN0IGhhdmUgYSB0cnkgYXMgYmVsb3c6Cj4gCj4gPT09PT09PT09PT0KPiAjIGZvciBp
IGluIGBzZXEgMTAwMGA7IGRvIGVjaG8gImkgPSAkaSIgJiYgLi90Z2tpbGwwMyB8fCBicmVhazsg
ZG9uZQo+IC4uLgo+IGkgPSA5Ngo+IHRzdF90ZXN0LmM6MTExMjogSU5GTzogVGltZW91dCBwZXIg
cnVuIGlzIDBoIDA1bSAwMHMKPiB0Z2tpbGwwMy5jOjEwNjogRkFJTDogRGVmdW5jdCB0aWQgc2hv
dWxkIGhhdmUgZmFpbGVkIHdpdGggRVNSQ0g6IFNVQ0NFU1MKPiAKPiA9PT09PT09PT09PQo+IC0t
LSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rna2lsbDAzLmMKPiArKysgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Rna2lsbC90Z2tpbGwwMy5jCj4gQEAgLTUsNiArNSw3
IEBACj4gICAqIFRlc3Qgc2ltcGxlIHRna2lsbCgpIGVycm9yIGNhc2VzLgo+ICAgKi8KPiAKPiAr
I2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICNpbmNsdWRlIDxwdGhyZWFkLmg+Cj4gICNpbmNsdWRlIDxw
d2QuaD4KPiAgI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+IEBAIC0xOSw2ICsyMCw3IEBAIHN0YXRp
YyBwaWRfdCBwYXJlbnRfdGdpZDsKPiAgc3RhdGljIHBpZF90IHBhcmVudF90aWQ7Cj4gIHN0YXRp
YyBwaWRfdCBjaGlsZF90aWQ7Cj4gIHN0YXRpYyBwaWRfdCBkZWZ1bmN0X3RpZDsKPiArY2hhciBi
dWZbMTAyNF07Cj4gCj4gIHN0YXRpYyBjb25zdCBpbnQgaW52YWxpZF9waWQgPSAtMTsKPiAKPiBA
QCAtMzUsNiArMzcsOCBAQCBzdGF0aWMgdm9pZCAqZGVmdW5jdF90aHJlYWRfZnVuYyh2b2lkICph
cmcpCj4gIHsKPiAgICAgICAgIGRlZnVuY3RfdGlkID0gc3lzX2dldHRpZCgpOwo+IAo+ICsgICAg
ICAgc3ByaW50ZihidWYsICIvcHJvYy9waWQvdGFzay8lZCIsIGRlZnVuY3RfdGlkKTsKCkhvdyBh
Ym91dD8KICAgICAgICAgIHNwcmludGYoYnVmLCAiL3Byb2MvJWQvdGFzay8lZCIsIGdldHBpZCgp
LCBkZWZ1bmN0X3RpZCk7CgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
