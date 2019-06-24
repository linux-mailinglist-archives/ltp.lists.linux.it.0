Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C650641
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 11:57:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 768323C181F
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 11:57:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 870943C0505
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 11:57:20 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DA36A6998CC
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 11:57:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 070832F8BCA
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 09:57:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F20DC608E4
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 09:57:17 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8E601806B16;
 Mon, 24 Jun 2019 09:57:17 +0000 (UTC)
Date: Mon, 24 Jun 2019 05:57:14 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1232452812.29707516.1561370234695.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fn9qhKBbYviKHbkDuV40kE=sK8b36-g=X31n5ihhCwtw@mail.gmail.com>
References: <20190621102628.4800-4-liwang@redhat.com>
 <1186374967.29667455.1561359397802.JavaMail.zimbra@redhat.com>
 <CAEemH2chU7KYJida_09RVWDMQRQLyv9igr5-j464SsKQj3svDA@mail.gmail.com>
 <CAEemH2fn9qhKBbYviKHbkDuV40kE=sK8b36-g=X31n5ihhCwtw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: pkey: add pkey02 test
Thread-Index: 51YN4uBtgr0Luv6b7H4L32e3NHY7cA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 24 Jun 2019 09:57:18 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 3/3] pkey: add pkey02 test
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQg
MzoyNyBQTSBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPgo+ID4KPiA+
IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDI6NTYgUE0gSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJl
ZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+Pgo+ID4+Cj4gPj4gLS0tLS0gT3JpZ2luYWwgTWVzc2Fn
ZSAtLS0tLQo+ID4+ID4gU2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+
Cj4gPj4gPiArCj4gPj4gPiArc3RhdGljIHZvaWQgcGtleV90ZXN0cyhpbnQgcGtleSwgaW50IHBy
b3QsIGludCBmbGFncywgaW50IGZkKQo+ID4+ID4gK3sKPiA+PiA+ICsgICAgIGNoYXIgKmJ1ZmZl
cjsKPiA+PiA+ICsKPiA+PiA+ICsgICAgIGlmIChmZCA9PSAwKSB7Cj4gPj4gPiArICAgICAgICAg
ICAgIGZkID0gU0FGRV9PUEVOKFRFU1RfRklMRSwgT19SRFdSIHwgT19DUkVBVCwgMDY2NCk7Cj4g
Pj4gPiArICAgICB9Cj4gPj4gPiArCj4gPj4gPiArICAgICBidWZmZXIgPSBTQUZFX01NQVAoTlVM
TCwgcHNpemUsIHByb3QsIGZsYWdzLCBmZCwgMCk7Cj4gPj4gPiArCj4gPj4gPiArICAgICBpZiAo
cGtleV9tcHJvdGVjdChidWZmZXIsIHBzaXplLCBwcm90LCBwa2V5KSA9PSAtMSkKPiA+PiA+ICsg
ICAgICAgICAgICAgdHN0X2JyayhUQlJPSywgInBrZXlfbXByb3RlY3QgZmFpbGVkIik7Cj4gPj4g
PiArCj4gPj4gPiArICAgICB0c3RfcmVzKFRQQVNTLCAiYXBwbHkgcGtleSB0byB0aGUgYnVmZmVy
IGFyZWEgc3VjY2VzcyIpOwo+ID4+ID4gKwo+ID4+ID4gKyAgICAgaWYgKGZkID4gMCkgewo+ID4+
ID4gKyAgICAgICAgICAgICBTQUZFX0NMT1NFKGZkKTsKPiA+PiA+ICsgICAgIH0KPiA+PiA+ICsK
PiA+PiA+ICsgICAgIFNBRkVfTVVOTUFQKGJ1ZmZlciwgcHNpemUpOwo+ID4+ID4gK30KPiA+PiA+
ICsKPiA+Pgo+ID4+IEhpLAo+ID4+Cj4gPj4gcGtleTAyIGRvZXNuJ3QgdHJ5IHRvIHJlYWQvd3Jp
dGUgYXMgcGtleTAxLCBidXQgb3RoZXJ3aXNlIHR3byB0ZXN0cyBsb29rCj4gPj4gdmVyeSBzaW1p
bGFyLgo+ID4+Cj4gPj4gQ291bGQgd2UgdHJ5IHRvIHJlYWQvd3JpdGUgaGVyZSBhcyB3ZWxsIGZv
ciBhbGwgY29tYmluYXRpb25zIG9mIG1hcCBmbGFncz8KPiA+PiBUaGVuIHBrZXkwMSBjb3VsZCBi
ZSBkcm9wcGVkIHNpbmNlIHBrZXkwMiB3b3VsZCBjb3ZlciBtb3JlIHRoYW4ganVzdCAxCj4gPj4g
Y29tYmluYXRpb24uCj4gPj4gT3IgaXMgdGhlcmUgYSBkaWZmZXJlbnQgcmVhc29uIGJlaGluZCBz
ZXBhcmF0ZSB0ZXN0cywgdGhhdCBJJ20gbWlzc2luZz8KPiA+Pgo+ID4+Cj4gPiBUaGUgcGtleTAy
IGlzIGEgZm9sbG93IG5ldyB0ZXN0IGlkZWEodGVzdCBtb3JlIHR5cGVzIG9mIG1lbW9yeSkgYWZ0
ZXIgSQo+ID4gY29tcGxldGVkIHBrZXkwMS4KPiA+Cj4gPiBZZXMsIHRoZSBkaWZmZW5yZW5jZSBi
ZXR0d2VuIHRoZW0gaXMgcGtleTAyIGNvdmVyIG1vcmUgbWFwIGZsYWdzIGJ1dCBub3QKPiA+IGRv
IFIvVyB2ZXJpZmljYXRpb24uIFRoYXQncyBiZWNhdXNlIEknbSBob3BpbmcgdG8gYWRkIHswLCAw
eDB9IHRvIHRoZSB0ZXN0Cj4gPiB3aGljaCBkb2VzIG5vdCB0cmlnZ2VyIFNJR1NFR1YgaW4gcGtl
eTAyLCBpdCBzZWVtcyBhIGJpdCB0cmlja3kgdG8KPiA+IGRpc3Rpbmd1aXNoIHRoZSBTSUdTRUdW
IGlzIGNvbWUgZnJvbSAweDAoaWYgYnVnIHRoZXJlKQo+ID4gb3IgUEtFWV9ESVNBQkxFX0FDQ0VT
UyBwcm9ncmVzcy4KPiA+Cj4gPgo+IFdlbGwsIGEgc21wbGUgd2F5IEkgY2FuIGZpbmQgaXMgdG8g
cmVtb3ZlIHRoZSB7MCwgMHgwfSBmcm9tIHN0cnVjdCB0Y2FzZSwKPiBhbmQgdGVzdCB0aGUgYWNj
ZXNzIHJpZ2h0IDB4MCBpbiBsYXN0bHkuCgpZb3UgY291bGQgYWxzbyBrZWVwIHswLCAweDB9LCBi
dXQgZXh0ZW5kIHN0cnVjdCB3aXRoICJpbnQgZmF1bHRfZXhwZWN0ZWQiLAphbmQgc2V0IGl0IHRv
IDAvMSBkZXBlbmRpbmcgb24gZmxhZ3MuCgo+IAo+IFNvLCB3aGF0IGRvIHlvdSB0aGluayBhYm91
dCB0aGUgbmV3IGtleTAyKG1lcmdlIGtleTAxIGFuZCBvbGQga2V5MDIpIGluCj4gdGhpcyBhdHRh
dGNobWVudD8KClRoYXQgd29ya3MgdG9vLiBTb21lIGNvbW1lbnRzIGJlbG93OgoKCWlmIChmZCA+
IDApIHsKCQlTQUZFX0NMT1NFKGZkKTsKCX0KMCBpcyB2YWxpZCBmZCwgYnJhY2tldHMgYXJlIG5v
dCBuZWVkZWQuCgpBbGwgdHN0XyogZnVuY3Rpb25zIHRoYXQgcmVwb3J0IGZhaWx1cmVzIHNob3Vs
ZCBhbHNvIGhhdmUgVEVSUk5PLgoKdHN0X3JlcyhURkFJTCwgIkNoaWxkIHVuZXhwZWN0ZWRseSBl
bmRlZCIpIGNvdWxkIHByaW50IGFsc28gZXhpdCBjb2RlLgoKUmVnYXJkcywKSmFuCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
