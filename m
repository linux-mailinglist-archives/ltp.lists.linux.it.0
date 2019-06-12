Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18422428D6
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 16:25:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF2CC3EAE5C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 16:25:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 447BC3EA9D4
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 16:25:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 98556601CE8
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 16:25:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B620581F18;
 Wed, 12 Jun 2019 14:25:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1486A250;
 Wed, 12 Jun 2019 14:25:52 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A419824AFA;
 Wed, 12 Jun 2019 14:25:52 +0000 (UTC)
Date: Wed, 12 Jun 2019 10:25:49 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <278919491.27726511.1560349549390.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190612135929.GA3048@rei.lan>
References: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
 <20190612135929.GA3048@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.28]
Thread-Topic: syscalls/ioctl_ns0[156]: align stack and wait for child
Thread-Index: DUjNFRNKGw+A1jQKMirWYH/vlG4ddQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 12 Jun 2019 14:25:52 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_ns0[156]: align stack and wait
 for child
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBIaSEKPiA+IFRlc3QgY3Jhc2hlcyAoU0lH
QlVTKSB3aGVuIHVzaW5nIGNoaWxkIHN0YWNrIGhhdmUgYmVlbiBvYnNlcnZlZCBmb3IKPiA+IGlv
Y3RsX25zMDEuIEFsaWduIHN0YWNrIHRvIDY0IGJ5dGVzIGZvciBhbGwgdGVzdGNhc2VzIHVzaW5n
IGNsb25lLAo+ID4gd2hpY2ggc2hvdWxkIHdvcmsgZm9yIGFueSBhcmNoLgo+IAo+IExvb2tpbmcg
YXQgdGhlIHJlc3Qgb2YgdGhlIHRlc3QgaXQgc2VlbXMgdGhhdCBhbGwgb2YgdGhlbSB1c2UgbWFs
bG9jKCkKPiB0byBhbGxvY2F0ZSB0aGUgY2hpbGQgc3RhY2sgYW5kIGRlcGVuZHMgb24gdGhlIGxp
YmMgdG8gYWxpZ24gdGhlCj4gYnVmZmVycywgbWF5YmUgaXQgd291bGQgYmUgZWFzaWVyIHRvIGNo
YW5nZSB0aGVzZSB0ZXN0cyB0byB1c2UgbWFsbG9jKCkKPiBhcyB3ZWxsLgoKRGVmYXVsdCBhbGln
bm1lbnQgaXMgbm90IGVub3VnaDoKICBBbGlnbm1lbnQ6ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMiAqIHNpemVvZihzaXplX3QpIChkZWZhdWx0KQogICAgICAgKGkuZS4sIDggYnl0ZSBh
bGlnbm1lbnQgd2l0aCA0Ynl0ZSBzaXplX3QpLiBUaGlzIHN1ZmZpY2VzIGZvcgogICAgICAgbmVh
cmx5IGFsbCBjdXJyZW50IG1hY2hpbmVzIGFuZCBDIGNvbXBpbGVycy4gSG93ZXZlciwgeW91IGNh
bgogICAgICAgZGVmaW5lIE1BTExPQ19BTElHTk1FTlQgdG8gYmUgd2lkZXIgdGhhbiB0aGlzIGlm
IG5lY2Vzc2FyeS4KCkknbSBndWVzc2luZyBtb3N0IG9mIHRlc3RzIGNyb3NzIE1fTU1BUF9USFJF
U0hPTEQsIGFuZCBnZXQgcGFnZSBhbGlnbm1lbnQKZnJvbSBtbWFwLiBCdXQgc2hvdWxkIHdlIHJl
bHkgb24gdGhhdD8KCkhvdyBhYm91dCBwb3NpeF9tZW1hbGlnbigpPwoKPiAKPiA+IEFkZCBTSUdD
SExEIHRvIGNsb25lIGZsYWdzLCBzbyB0aGF0IExUUCBsaWJyYXJ5IGNhbiByZWFwIGFsbCBjaGls
ZHJlbgo+ID4gYW5kIGNoZWNrIHRoZWlyIHJldHVybiBjb2RlLiAgQWxzbyBjaGVjayBsdHBfY2xv
bmUoKSByZXR1cm4gdmFsdWUuCj4gPiAKPiA+IFN1cHByZXNzIHdhcm5pbmcgZm9yIHVudXNlZCAq
YXJnIGluIGNoaWxkKCkuCj4gCj4gVGhlIHJlc3QgaXMgT0suCj4gCj4gLS0KPiBDeXJpbCBIcnVi
aXMKPiBjaHJ1YmlzQHN1c2UuY3oKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
