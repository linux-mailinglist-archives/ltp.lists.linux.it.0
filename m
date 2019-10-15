Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C163D76F9
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 15:03:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 558F63C220F
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 15:03:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D53FB3C1C94
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 15:03:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4557C1A00E2D
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 15:03:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A948B3D6;
 Tue, 15 Oct 2019 13:02:59 +0000 (UTC)
References: <20191015101534.17691-1-liwang@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20191015101534.17691-1-liwang@redhat.com>
Date: Tue, 15 Oct 2019 15:02:59 +0200
Message-ID: <87sgnuw48s.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] include: undefine _LINUX_TYPES_H if including
 sys/capability.h
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
TlVYX1RZUEVTX0gKPiBtYWNybyB0byBtYWtlIGx0cC1saWIgY2Fubid0IGluY2x1ZGUgbGludXgv
dHlwZXMuaCBlc3NlbnRpYWxseS4KPgo+ICAgICAjIGNhdCAtbiAvdXNyL2luY2x1ZGUvc3lzL2Nh
cGFiaWxpdHkuaAo+ICAgICAuLi4KPiAgICAgMjUgIC8qCj4gICAgIDI2ICAgKiBNYWtlIHN1cmUg
d2UgY2FuIGJlIGluY2x1ZGVkIGZyb20gdXNlcmxhbmQgYnkgcHJldmVudGluZwo+ICAgICAyNyAg
ICogY2FwYWJpbGl0eS5oIGZyb20gaW5jbHVkaW5nIG90aGVyIGtlcm5lbCBoZWFkZXJzCj4gICAg
IDI4ICAgKi8KPiAgICAgMjkgICNkZWZpbmUgX0xJTlVYX1RZUEVTX0gKPgo+IFRvIGdldCByaWQg
b2YgdGhpcyBjb21waWxpbmcgZXJyb3JzIG9uIHJoZWw2KGxpYmNhcC1kZXZlbC0yLjE2KSBzZXJp
ZXMgcGxhdGZvcm0sCj4gaGVyZSB1bmRlZmluZSBfTElOVVhfVFlQRVNfSCBpZiBpbmNsdWRlZCB0
aGF0IHN5cy9jYXBhYmlsaXR5LmguCj4KPiAgID09IEVycm9yIGxvZyA9PQo+ICAgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC4uL2luY2x1ZGUvdHN0X25ldGxpbmsuaDoyNiwKPiAgICAgICAgICAgICAg
ICAgIGZyb20gdHN0X2NyeXB0by5jOjEzOgo+ICAgL3Vzci9pbmNsdWRlL2xpbnV4L25ldGxpbmsu
aDo0NTogZXJyb3I6IGV4cGVjdGVkIHNwZWNpZmllci1xdWFsaWZpZXItbGlzdCBiZWZvcmUg4oCY
X191MTbigJkKPiAgIC91c3IvaW5jbHVkZS9saW51eC9uZXRsaW5rLmg6MTM1OiBlcnJvcjogZXhw
ZWN0ZWQgc3BlY2lmaWVyLXF1YWxpZmllci1saXN0IGJlZm9yZSDigJhfX3UxNuKAmQo+ICAgdHN0
X2NyeXB0by5jOiBJbiBmdW5jdGlvbiDigJh0c3RfY3J5cHRvX3JlY3ZfYWNr4oCZOgo+ICAgdHN0
X2NyeXB0by5jOjQ2OiBlcnJvcjog4oCYc3RydWN0IG5sbXNnaGRy4oCZIGhhcyBubyBtZW1iZXIg
bmFtZWQg4oCYbmxtc2dfc2Vx4oCZCj4gICB0c3RfY3J5cHRvLmM6NDc6IGVycm9yOiDigJhzdHJ1
Y3Qgbmxtc2doZHLigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhubG1zZ190eXBl4oCZCj4gICB0
c3RfY3J5cHRvLmM6NDc6IGVycm9yOiDigJhzdHJ1Y3Qgbmxtc2doZHLigJkgaGFzIG5vIG1lbWJl
ciBuYW1lZCDigJhubG1zZ19zZXHigJkKPiAgIHRzdF9jcnlwdG8uYzo1NTogZXJyb3I6IOKAmHN0
cnVjdCBubG1zZ2hkcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNnX3R5cGXigJkKPiAg
IHRzdF9jcnlwdG8uYzo1ODogZXJyb3I6IOKAmHN0cnVjdCBubG1zZ2hkcuKAmSBoYXMgbm8gbWVt
YmVyIG5hbWVkIOKAmG5sbXNnX3R5cGXigJkKPiAgIHRzdF9jcnlwdG8uYzo1ODogZXJyb3I6IOKA
mHN0cnVjdCBubG1zZ2hkcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNnX3NlceKAmQo+
ICAgdHN0X2NyeXB0by5jOiBJbiBmdW5jdGlvbiDigJh0c3RfY3J5cHRvX2FkZF9hbGfigJk6Cj4g
ICAuLi4KPiAgIG1ha2U6ICoqKiBbdHN0X2NyeXB0by5vXSBFcnJvciAxCj4KPiBSZXBvcnRlZC1i
eTogUGluZyBGYW5nIDxwaWZhbmdAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5n
IDxsaXdhbmdAcmVkaGF0LmNvbT4KPiBDYzogUGluZyBGYW5nIDxwaWZhbmdAcmVkaGF0LmNvbT4K
PiBDYzogUmljaGFyZCBQYWxldGhvcnBlIDxycGFsZXRob3JwZUBzdXNlLmNvbT4KPiAtLS0KPiAg
aW5jbHVkZS9sYXBpL2NhcGFiaWxpdHkuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xhcGkvY2FwYWJpbGl0eS5oIGIvaW5j
bHVkZS9sYXBpL2NhcGFiaWxpdHkuaAo+IGluZGV4IGRhYzIzM2Q4NC4uM2MyZWU3OTM3IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmgKPiArKysgYi9pbmNsdWRlL2xhcGkv
Y2FwYWJpbGl0eS5oCj4gQEAgLTEwLDYgKzEwLDcgQEAKPiAgCj4gICNpZmRlZiBIQVZFX1NZU19D
QVBBQklMSVRZX0gKPiAgIyBpbmNsdWRlIDxzeXMvY2FwYWJpbGl0eS5oPgo+ICsjIHVuZGVmIF9M
SU5VWF9UWVBFU19ICgpNeSBjb25jZXJuIGhlcmUgaXMgaWYgbGludXgvdHlwZXMuaCBoYXMgYWxy
ZWFkeSBiZWVuIGluY2x1ZGVkLiBUaGVuIHRoaXMKY291bGQgY2F1c2UgYSByZWRlZmluaXRpb24g
ZXJyb3IgaWYgaXQgaXMgaW5jbHVkZWQgYWdhaW4uCgo+ICAjZW5kaWYKPiAgCj4gICNpZm5kZWYg
Q0FQX05FVF9SQVcKCgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
