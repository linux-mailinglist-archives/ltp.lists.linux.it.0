Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA04810E
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 13:41:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D7243EB060
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 13:41:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2D3403EA440
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 13:41:36 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7C7766013BC
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 13:41:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1885307E04A;
 Mon, 17 Jun 2019 11:41:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E77B97BE78;
 Mon, 17 Jun 2019 11:41:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE80D206D1;
 Mon, 17 Jun 2019 11:41:34 +0000 (UTC)
Date: Mon, 17 Jun 2019 07:41:31 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1039262821.28636334.1560771691828.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190617094422.15846-1-chrubis@suse.cz>
References: <20190617094422.15846-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.242, 10.4.195.2]
Thread-Topic: Clarify what should be cleaned up at test end
Thread-Index: ujw7uGbmuCPjlSasFMsvThzy3DnJ5Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 17 Jun 2019 11:41:35 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] [RFC] doc: Clarify what should be cleaned up at
 test end
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gVGhpcyBhZGRzIGEgc2hvcnQgcGFyYWdy
YXBoIHRoYXQgd3JpdGVzIGRvd24gcHJldmlvdXNseSB1bndyaXR0ZW4gcnVsZQo+IGZvciByZXNv
dXJjZSBjbGVhbnVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0Bz
dXNlLmN6Pgo+IENDOiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAg
ZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dCB8IDggKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kb2MvdGVzdC13cml0aW5n
LWd1aWRlbGluZXMudHh0Cj4gYi9kb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0Cj4gaW5k
ZXggZjE5MTJkYzEyLi4yMTIyM2JhMDMgMTAwNjQ0Cj4gLS0tIGEvZG9jL3Rlc3Qtd3JpdGluZy1n
dWlkZWxpbmVzLnR4dAo+ICsrKyBiL2RvYy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQKPiBA
QCAtMzQ3LDYgKzM0NywxNCBAQCBhc3NpZ25lZCBhIHZhbGlkIGZpbGUgZGVzY3JpcHRvci4gRm9y
IG1vc3Qgb2YgdGhlIHRoaW5ncwo+IHlvdSBuZWVkIHRvIGNyZWF0ZQo+ICBleHRyYSBmbGFnIHRo
YXQgaXMgc2V0IHJpZ2h0IGFmdGVyIHN1Y2Nlc3NmdWwgaW5pdGlhbGl6YXRpb24gdGhvdWdoLgo+
ICBDb25zaWRlciwKPiAgZm9yIGV4YW1wbGUsIHRlc3Qgc2V0dXAgYmVsb3cuCj4gIAo+ICtXZSBh
bHNvIHByZWZlciBjbGVhbmluZyB1cCByZXNvdXJjZXMgdGhhdCB3b3VsZCBvdGhlcndpc2UgYmUg
cmVsZWFzZWQgb24gdGhlCj4gK3Byb2dyYW0gZXhpdC4gVGhlcmUgYXJlIHR3byBtYWluIHJlYXNv
bnMgZm9yIHRoaXMgZGVjaXNpb24uIFJlc291cmNlcyBzdWNoCj4gYXMKPiArZmlsZSBkZXNjcmlw
dG9ycyBhbmQgbW1hcGVkIG1lbW9yeSBjb3VsZCBibG9jayB1bW91bnRpbmcgYSBibG9jayBkZXZp
Y2UgaW4KPiArY2FzZXMgd2hlcmUgdGhlIHRlc3QgbGlicmFyeSBoYXMgbW91bnRlZCBhIGZpbGVz
eXN0ZW0gZm9yIHRoZSB0ZXN0IHRlbXBvcmFyeQo+ICtkaXJlY3RvcnkuIE5vdCBmcmVlaW5nIGFs
bG9jYXRlZCBtZW1vcnkgd291bGQgdXBzZXQgc3RhdGljIGFuYWx5c2lzIGFuZAo+IHRvb2xzCj4g
K3N1Y2ggYXMgdmFsZ3JpbmQgYW5kIHByb2R1Y2UgZmFsc2UtcG9zaXRpdmVzIHdoZW4gY2hlY2tp
bmcgZm9yIGxlYWtzIGluIHRoZQo+ICtsaWJjIGFuZCBvdGhlciBsb3cgbGV2ZWwgbGlicmFyaWVz
Lgo+ICsKCkknbSBPSyB3aXRoIHRoZSB0ZXh0LiBEbyB3ZSBsZWF2ZSB0aGUgcGFyYWdyYXBoIHdl
IHRhbGtlZCBhYm91dCBpbiBzdHlsZS1ndWlkZS50eHQ/Cgo+ICBbc291cmNlLGNdCj4gIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgc3RhdGljIGludCBmZDAsIGZkMSwgbW91bnRfZmxhZzsKPiAt
LQo+IDIuMTkuMgo+IAo+IAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
