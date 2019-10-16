Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E6D8D22
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 12:01:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDA033C22C9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 12:01:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 751823C1CB7
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 12:01:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EF5EE1401822
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 12:01:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 315B8ADAA;
 Wed, 16 Oct 2019 10:01:02 +0000 (UTC)
References: <20191016080146.18657-1-liwang@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20191016080146.18657-1-liwang@redhat.com>
Date: Wed, 16 Oct 2019 12:01:02 +0200
Message-ID: <87pnixvwkh.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] include: undefine _LINUX_TYPES_H if including
 old sys/capability.h
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4gd3JpdGVzOgoKPiBJbiBzb21lIG9m
IHRoZSBsaWJjYXAtZGV2ZWwoMS45Nn4yLjE2KSB2ZXJzaW9ucywgaXQgZGVmaW5lcyB0aGUgX0xJ
TlVYX1RZUEVTX0gKPiBtYWNybyB0aGF0IG1ha2VzIGx0cC1saWIgY2FuIG5vdCBpbmNsdWRlIGxp
bnV4L3R5cGVzLmggZXNzZW50aWFsbHkuCj4KPiAgICAgIyBjYXQgLW4gL3Vzci9pbmNsdWRlL3N5
cy9jYXBhYmlsaXR5LmgKPiAgICAgLi4uCj4gICAgIDI1ICAvKgo+ICAgICAyNiAgICogTWFrZSBz
dXJlIHdlIGNhbiBiZSBpbmNsdWRlZCBmcm9tIHVzZXJsYW5kIGJ5IHByZXZlbnRpbmcKPiAgICAg
MjcgICAqIGNhcGFiaWxpdHkuaCBmcm9tIGluY2x1ZGluZyBvdGhlciBrZXJuZWwgaGVhZGVycwo+
ICAgICAyOCAgICovCj4gICAgIDI5ICAjZGVmaW5lIF9MSU5VWF9UWVBFU19ICj4KPiBUbyBnZXQg
cmlkIG9mIHRoaXMgY29tcGlsaW5nIGVycm9ycyBvbiByaGVsNihsaWJjYXAtZGV2ZWwtMi4xNikg
c2VyaWVzIHBsYXRmb3JtLAo+IGhlcmUgdW5kZWZpbmUgX0xJTlVYX1RZUEVTX0ggaWYgdGVzdCBp
bmNsdWRlZCB0aGF0IG9sZCBzeXMvY2FwYWJpbGl0eS5oLgo+Cj4gICA9PSBFcnJvciBsb2cgPT0K
PiAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL3RzdF9uZXRsaW5rLmg6MjYsCj4g
ICAgICAgICAgICAgICAgICBmcm9tIHRzdF9jcnlwdG8uYzoxMzoKPiAgIC91c3IvaW5jbHVkZS9s
aW51eC9uZXRsaW5rLmg6NDU6IGVycm9yOiBleHBlY3RlZCBzcGVjaWZpZXItcXVhbGlmaWVyLWxp
c3QgYmVmb3JlIOKAmF9fdTE24oCZCj4gICAvdXNyL2luY2x1ZGUvbGludXgvbmV0bGluay5oOjEz
NTogZXJyb3I6IGV4cGVjdGVkIHNwZWNpZmllci1xdWFsaWZpZXItbGlzdCBiZWZvcmUg4oCYX191
MTbigJkKPiAgIHRzdF9jcnlwdG8uYzogSW4gZnVuY3Rpb24g4oCYdHN0X2NyeXB0b19yZWN2X2Fj
a+KAmToKPiAgIHRzdF9jcnlwdG8uYzo0NjogZXJyb3I6IOKAmHN0cnVjdCBubG1zZ2hkcuKAmSBo
YXMgbm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNnX3NlceKAmQo+ICAgdHN0X2NyeXB0by5jOjQ3OiBl
cnJvcjog4oCYc3RydWN0IG5sbXNnaGRy4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYbmxtc2df
dHlwZeKAmQo+ICAgdHN0X2NyeXB0by5jOjQ3OiBlcnJvcjog4oCYc3RydWN0IG5sbXNnaGRy4oCZ
IGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYbmxtc2dfc2Vx4oCZCj4gICB0c3RfY3J5cHRvLmM6NTU6
IGVycm9yOiDigJhzdHJ1Y3Qgbmxtc2doZHLigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhubG1z
Z190eXBl4oCZCj4gICB0c3RfY3J5cHRvLmM6NTg6IGVycm9yOiDigJhzdHJ1Y3Qgbmxtc2doZHLi
gJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhubG1zZ190eXBl4oCZCj4gICB0c3RfY3J5cHRvLmM6
NTg6IGVycm9yOiDigJhzdHJ1Y3Qgbmxtc2doZHLigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhu
bG1zZ19zZXHigJkKPiAgIHRzdF9jcnlwdG8uYzogSW4gZnVuY3Rpb24g4oCYdHN0X2NyeXB0b19h
ZGRfYWxn4oCZOgo+ICAgLi4uCj4gICBtYWtlOiAqKiogW3RzdF9jcnlwdG8ub10gRXJyb3IgMQo+
Cj4gUmVwb3J0ZWQtYnk6IFBpbmcgRmFuZyA8cGlmYW5nQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Cj4gQ2M6IFBpbmcgRmFuZyA8cGlmYW5n
QHJlZGhhdC5jb20+Cj4gQ2M6IFJpY2hhcmQgUGFsZXRob3JwZSA8cnBhbGV0aG9ycGVAc3VzZS5j
b20+Cj4gQWNrZWQtYnk6IFJpY2hhcmQgUGFsZXRob3JwZSA8cnBhbGV0aG9ycGVAc3VzZS5jb20+
Cj4gLS0tCj4gIGluY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmggfCAgOCArKysrKysrKwo+ICBtNC9s
dHAtY2FwLm00ICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9sYXBpL2NhcGFiaWxpdHkuaCBiL2luY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmgKPiBp
bmRleCBkYWMyMzNkODQuLjg4MzNmMDYwNSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xhcGkvY2Fw
YWJpbGl0eS5oCj4gKysrIGIvaW5jbHVkZS9sYXBpL2NhcGFiaWxpdHkuaAo+IEBAIC0xMCw2ICsx
MCwxNCBAQAo+ICAKPiAgI2lmZGVmIEhBVkVfU1lTX0NBUEFCSUxJVFlfSAo+ICAjIGluY2x1ZGUg
PHN5cy9jYXBhYmlsaXR5Lmg+Cj4gKy8qKgo+ICsgKiBTb21lIG9sZCBsaWJjYXAtZGV2ZWwoMS45
Nn4yLjE2KSBkZWZpbmUgX0xJTlVYX1RZUEVTX0ggaW4KPiArICogc3lzL2NhcGFiaWxpdHkuaCB0
aGF0IG1ha2VzIGx0cC1saWIgY2Fubid0IGluY2x1ZGUgbGludXgvdHlwZXMuaAo+ICsgKiBlc3Nl
bnRpYWxseS4gSGVyZSB1bmRlZmluZSBpdCBpZiBpbmNsdWRlIHN1Y2ggb2xkIGhlYWRlci1maWxl
Lgo+ICsgKi8KPiArIyBpZm5kZWYgSEFWRV9ORVdFUl9MSUJDQVAKPiArIyAgdW5kZWYgX0xJTlVY
X1RZUEVTX0gKPiArIyBlbmRpZgo+ICAjZW5kaWYKPiAgCj4gICNpZm5kZWYgQ0FQX05FVF9SQVcK
PiBkaWZmIC0tZ2l0IGEvbTQvbHRwLWNhcC5tNCBiL200L2x0cC1jYXAubTQKPiBpbmRleCAwMmQz
Y2FjOGMuLjQ5ODFlODQzZCAxMDA2NDQKPiAtLS0gYS9tNC9sdHAtY2FwLm00Cj4gKysrIGIvbTQv
bHRwLWNhcC5tNAo+IEBAIC0xLDYgKzEsNiBAQAo+ICBkbmwgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiAgZG5sIENvcHlyaWdodCAoYykgQ2lzY28gU3lzdGVtcyBJ
bmMuLCAyMDA5Cj4gLWRubCBDb3B5cmlnaHQgKGMpIExpbnV4IFRlc3QgUHJvamVjdCwgMjAxMAo+
ICtkbmwgQ29weXJpZ2h0IChjKSBMaW51eCBUZXN0IFByb2plY3QsIDIwMTkKPiAgZG5sIEF1dGhv
cjogTmdpZSBDb29wZXIgPHlhbmV1cmFiZXlhQGdtYWlsLmNvbT4KPiAgCj4gIEFDX0RFRlVOKFtM
VFBfQ0hFQ0tfQ0FQQUJJTElUWV9TVVBQT1JUXSxbCj4gQEAgLTE0LDQgKzE0LDE5IEBAIGlmIHRl
c3QgIngkY2FwX2xpYnMiICE9IHg7IHRoZW4KPiAgCUFDX0RFRklORShIQVZFX0xJQkNBUCkKPiAg
ZmkKPiAgQUNfU1VCU1QoQ0FQX0xJQlMsJGNhcF9saWJzKQo+ICsKPiArQUhfVEVNUExBVEUoSEFW
RV9ORVdFUl9MSUJDQVAsCj4gK1tEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSBuZXdlciBsaWJjYXAt
MiBpbnN0YWxsZWQuXSkKPiArQUNfQ09NUElMRV9JRkVMU0UoW0FDX0xBTkdfU09VUkNFKFsKPiAr
I2luY2x1ZGUgPHN5cy9jYXBhYmlsaXR5Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+
ICtpbnQgbWFpbih2b2lkKSB7Cj4gKwlfX3UxNiBhOwo+ICsJX191MzIgYjsKPiArCXJldHVybiAw
Owo+ICt9XSldLFtoYXNfbmV3ZXJfbGliY2FwPSJ5ZXMiXSkKPiArCj4gK2lmIHRlc3QgIngkaGFz
X25ld2VyX2xpYmNhcCIgPSB4eWVzOyB0aGVuCj4gKwlBQ19ERUZJTkUoSEFWRV9ORVdFUl9MSUJD
QVApCj4gK2ZpCj4gIF0pCgpBY2suCgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
