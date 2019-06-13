Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB94352A
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 12:16:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6260294ACC
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 12:16:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6C36B294AA9
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 12:16:34 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B634E10018B0
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 12:16:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BE2F30F1BD4
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 10:16:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60AFD7837F
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 10:16:31 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 554E51806B0E;
 Thu, 13 Jun 2019 10:16:31 +0000 (UTC)
Date: Thu, 13 Jun 2019 06:16:28 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.26]
Thread-Topic: syscalls/ioctl_ns0[156]: align stack and wait for child
Thread-Index: 8QMg6vuTe+t9v1/BZY3utrMdkIQOZA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 13 Jun 2019 10:16:31 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQg
MzoyNSBQTSBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBU
ZXN0IGNyYXNoZXMgKFNJR0JVUykgd2hlbiB1c2luZyBjaGlsZCBzdGFjayBoYXZlIGJlZW4gb2Jz
ZXJ2ZWQgZm9yCj4gPiBpb2N0bF9uczAxLiBUaGlzIGlzIGJlY2F1c2Ugc3RhY2sgaXNuJ3QgYWxp
Z25lZC4gVXNlIGx0cF9hbGxvY19zdGFjaygpCj4gPiBmb3Igc3RhY2sgYWxsb2NhdGlvbi4KPiA+
Cj4gPiBBZGQgU0lHQ0hMRCB0byBjbG9uZSBmbGFncywgc28gdGhhdCBMVFAgbGlicmFyeSBjYW4g
cmVhcCBhbGwgY2hpbGRyZW4KPiA+IGFuZCBjaGVjayB0aGVpciByZXR1cm4gY29kZS4gIEFsc28g
Y2hlY2sgbHRwX2Nsb25lKCkgcmV0dXJuIHZhbHVlLgo+ID4KPiA+IFN1cHByZXNzIHdhcm5pbmcg
Zm9yIHVudXNlZCAqYXJnIGluIGNoaWxkKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFuIFN0
YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDEuYyB8IDEzICsrKysrKysrKy0tLS0KPiA+ICB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDUuYyB8IDEyICsrKysrKysrKy0t
LQo+ID4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNi5jIHwgMTUg
KysrKysrKysrKystLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9pb2N0bC9pb2N0bF9uczAxLmMKPiA+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9p
b2N0bC9pb2N0bF9uczAxLmMKPiA+IGluZGV4IGRmZGU0ZGE2YzVkNi4uZDI0MWE1ZDBmYTUzIDEw
MDY0NAo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczAx
LmMKPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5j
Cj4gPiBAQCAtMjMsNyArMjMsNyBAQAo+ID4KPiA+ICAjZGVmaW5lIFNUQUNLX1NJWkUgKDEwMjQg
KiAxMDI0KQo+ID4KPiA+IC1zdGF0aWMgY2hhciBjaGlsZF9zdGFja1tTVEFDS19TSVpFXTsKPiA+
ICtzdGF0aWMgY2hhciAqY2hpbGRfc3RhY2s7Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIHNldHVwKHZv
aWQpCj4gPiAgewo+ID4gQEAgLTMxLDYgKzMxLDEwIEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQp
Cj4gPgo+ID4gICAgICAgICBpZiAoZXhpc3RzIDwgMCkKPiA+ICAgICAgICAgICAgICAgICB0c3Rf
cmVzKFRDT05GLCAibmFtZXNwYWNlIG5vdCBhdmFpbGFibGUiKTsKPiA+ICsKPiA+ICsgICAgICAg
Y2hpbGRfc3RhY2sgPSBsdHBfYWxsb2Nfc3RhY2soU1RBQ0tfU0laRSk7Cj4gPgo+IAo+IEFzIHlv
dSBjb21tZW50ZWQgdGhhdCAiVXNlciBpcyByZXNwb25zaWJsZSBmb3IgZnJlZWluZyBhbGxvY2F0
ZWQgbWVtb3J5IiwKPiBidXQgeW91IGZvcmdldCB0byBkbyB0aGF0IGluIGVhY2ggb2YgdGhlc2Ug
dGVzdCBjYXNlcyA6KS4KCkkgb21pdHRlZCBpdCBvbiBwdXJwb3NlLiBPUyB3aWxsIGNsZWFuIGl0
IHVwIG9uIGV4aXQsIHNpbmNlIGl0J3MgY2FsbGVkCm9ubHkgaW4gc2V0dXAoKSBpdCdzIG5vdCBn
b2luZyB0byBrZWVwIGxlYWtpbmcgbW9yZSBtZW1vcnkuCgo+IAo+IFdlIG5lZWQgZnJlZShjaGls
ZF9zdGFjaykgaW4gdGhlIGNsZWFudXAgZnVuY3Rpb24uCgpDYW4geW91IGVsYWJvcmF0ZT8KCj4g
Cj4gLS0KPiBSZWdhcmRzLAo+IExpIFdhbmcKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
