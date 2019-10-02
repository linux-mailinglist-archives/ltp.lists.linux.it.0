Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B990EC4918
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Oct 2019 10:03:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C429E3C23C4
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Oct 2019 10:03:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3949F3C2219
 for <ltp@lists.linux.it>; Wed,  2 Oct 2019 10:03:19 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 70B191001569
 for <ltp@lists.linux.it>; Wed,  2 Oct 2019 10:02:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3137B2A09A1;
 Wed,  2 Oct 2019 08:03:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3AFA6013A;
 Wed,  2 Oct 2019 08:03:14 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97D574E589;
 Wed,  2 Oct 2019 08:03:14 +0000 (UTC)
Date: Wed, 2 Oct 2019 04:03:14 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <1944770230.3074247.1570003394396.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191001184750.20995-1-petr.vorel@gmail.com>
References: <20191001184750.20995-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.2]
Thread-Topic: pkeys: Fix uclibc build caused by conflicting signature
Thread-Index: etHa0NFtgAGpzrrViDq1jJRXInqUJw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 02 Oct 2019 08:03:15 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pkeys: Fix uclibc build caused by conflicting
 signature
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBSZW1vdmluZyBzdGF0aWMgZml4ZXMgdGhl
IHByb2JsZW0uCgpJJ2QgcHJlZmVyIHdlIHJlbmFtZSB0ZXN0IGZ1bmN0aW9uczoKCiNpZm5kZWYg
SEFWRV9QS0VZX01QUk9URUNUCnN0YXRpYyBpbmxpbmUgaW50IG15X3BrZXlfYWxsb2MoKQojZWxz
ZQojZGVmaW5lIG15X3BrZXlfYWxsb2MgcGtleV9hbGxvYwojZW5kaWYKCm15X3BrZXlfYWxsb2Mo
KQoKPiAKPiB1Q2xpYmMgZGVmaW5lcyBwa2V5X3thbGxvYyxmcmVlLG1wcm90ZWN0fSBzaWduYXR1
cmVzIGluCj4gPGJpdHMvbW1hbi1zaGFyZWQuaD4sIHdoaWNoIGlzIGluY2x1ZGVkIGJ5IDxiaXRz
L21tYW4tbGludXguaD4uICBCZWNhdXNlCj4gaXQgZG9lcyBub3QgaW1wbGVtZW50IHRoZW0sIG91
ciBpbXBsZW1lbnRhdGlvbiBzaWduYXR1cmUgY29uZmxpY3RzLCBhcwo+IGl0IHVzZXMgc3RhdGlj
Lgo+IAo+IEZpeGVkIGJ1aWxkIGVycm9yOgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwa2V5MDEu
YzozMjowOgo+IHBrZXkuaDoxODoxOTogZXJyb3I6IHN0YXRpYyBkZWNsYXJhdGlvbiBvZiDigJhw
a2V5X21wcm90ZWN04oCZIGZvbGxvd3Mgbm9uLXN0YXRpYwo+IGRlY2xhcmF0aW9uCj4gIHN0YXRp
YyBpbmxpbmUgaW50IHBrZXlfbXByb3RlY3Qodm9pZCAqYWRkciwgc2l6ZV90IGxlbiwgaW50IHBy
b3QsIGludCBwa2V5KQo+ICAgICAgICAgICAgICAgICAgICBeCj4gSW4gZmlsZSBpbmNsdWRlZCBm
cm9tCj4gL29wdC9ici10ZXN0LXBrZy9ici1hcm0tZnVsbC9ob3N0L2FybS1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjZ251ZWFiaS9zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvbW1hbi1saW51eC5oOjEx
NTowLAo+ICAgICAgICAgICAgICAgICAgZnJvbQo+ICAgICAgICAgICAgICAgICAgL29wdC9ici10
ZXN0LXBrZy9ici1hcm0tZnVsbC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFi
aS9zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvbW1hbi5oOjQwLAo+ICAgICAgICAgICAgICAgICAg
ZnJvbQo+ICAgICAgICAgICAgICAgICAgL29wdC9ici10ZXN0LXBrZy9ici1hcm0tZnVsbC9ob3N0
L2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaS9zeXNyb290L3Vzci9pbmNsdWRlL3N5
cy9tbWFuLmg6NDEsCj4gICAgICAgICAgICAgICAgICBmcm9tIHBrZXkwMS5jOjI5Ogo+IC9vcHQv
YnItdGVzdC1wa2cvYnItYXJtLWZ1bGwvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2du
dWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL21tYW4tc2hhcmVkLmg6NzM6NToKPiBub3Rl
OiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiDigJhwa2V5X21wcm90ZWN04oCZIHdhcyBoZXJlCj4g
IGludCBwa2V5X21wcm90ZWN0ICh2b2lkICpfX2FkZHIsIHNpemVfdCBfX2xlbiwgaW50IF9fcHJv
dCwgaW50IF9fcGtleSkKPiAgX19USFJPVzsKPiAgICAgIF4KPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gcGtleTAxLmM6MzI6MDoKPiAKPiBGb3VuZCB3aXRoIHRlc3QtcGtnIHRvb2wgZnJvbSBCdWls
ZHJvb3QgZGlzdHJpYnV0aW9uLgo+IAo+IEZpeGVzOiA5MGMyZGM4OWYgKCJwa2V5OiBhZGQgdGVz
dCBmb3IgbWVtb3J5IHByb3RlY3Rpb24ga2V5cyIpCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBW
b3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+Cj4gLS0tCj4gIHRlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvcGtleXMvcGtleS5oIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9wa2V5cy9wa2V5LmgKPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGtl
eXMvcGtleS5oCj4gaW5kZXggZDYyMzI0NGViLi4xOWM4NDQ3ZWIgMTAwNjQ0Cj4gLS0tIGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wa2V5cy9wa2V5LmgKPiArKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3BrZXlzL3BrZXkuaAo+IEBAIC0xNSwxNyArMTUsMTcgQEAKPiAgI2VuZGlm
Cj4gIAo+ICAjaWZuZGVmIEhBVkVfUEtFWV9NUFJPVEVDVAo+IC1zdGF0aWMgaW5saW5lIGludCBw
a2V5X21wcm90ZWN0KHZvaWQgKmFkZHIsIHNpemVfdCBsZW4sIGludCBwcm90LCBpbnQgcGtleSkK
PiAraW5saW5lIGludCBwa2V5X21wcm90ZWN0KHZvaWQgKmFkZHIsIHNpemVfdCBsZW4sIGludCBw
cm90LCBpbnQgcGtleSkKPiAgewo+ICAJcmV0dXJuIHRzdF9zeXNjYWxsKF9fTlJfcGtleV9tcHJv
dGVjdCwgYWRkciwgbGVuLCBwcm90LCBwa2V5KTsKPiAgfQo+ICAKPiAtc3RhdGljIGlubGluZSBp
bnQgcGtleV9hbGxvYyh1bnNpZ25lZCBpbnQgZmxhZ3MsIHVuc2lnbmVkIGludCBhY2Nlc3Nfcmln
aHRzKQo+ICtpbmxpbmUgaW50IHBrZXlfYWxsb2ModW5zaWduZWQgaW50IGZsYWdzLCB1bnNpZ25l
ZCBpbnQgYWNjZXNzX3JpZ2h0cykKPiAgewo+ICAJcmV0dXJuIHRzdF9zeXNjYWxsKF9fTlJfcGtl
eV9hbGxvYywgZmxhZ3MsIGFjY2Vzc19yaWdodHMpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW5saW5l
IGludCBwa2V5X2ZyZWUoaW50IHBrZXkpCj4gK2lubGluZSBpbnQgcGtleV9mcmVlKGludCBwa2V5
KQo+ICB7Cj4gIAlyZXR1cm4gdHN0X3N5c2NhbGwoX19OUl9wa2V5X2ZyZWUsIHBrZXkpOwo+ICB9
Cj4gLS0KPiAyLjIzLjAKPiAKPiAKPiAtLQo+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+IAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
