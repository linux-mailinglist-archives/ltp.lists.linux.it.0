Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCC50297
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 08:56:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8A243C1910
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 08:56:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 093B73C0062
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 08:56:44 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8F3341A00A38
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 08:56:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 170C93082E58
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 06:56:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC2460BFB
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 06:56:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03C7C1806B16;
 Mon, 24 Jun 2019 06:56:41 +0000 (UTC)
Date: Mon, 24 Jun 2019 02:56:37 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1186374967.29667455.1561359397802.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190621102628.4800-4-liwang@redhat.com>
References: <20190621102628.4800-4-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.7]
Thread-Topic: pkey: add pkey02 test
Thread-Index: pMHPYrib8CRUsGRo9cDxMWZLAb8mog==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 24 Jun 2019 06:56:41 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gU2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8
bGl3YW5nQHJlZGhhdC5jb20+Cj4gKwo+ICtzdGF0aWMgdm9pZCBwa2V5X3Rlc3RzKGludCBwa2V5
LCBpbnQgcHJvdCwgaW50IGZsYWdzLCBpbnQgZmQpCj4gK3sKPiArCWNoYXIgKmJ1ZmZlcjsKPiAr
Cj4gKwlpZiAoZmQgPT0gMCkgewo+ICsJCWZkID0gU0FGRV9PUEVOKFRFU1RfRklMRSwgT19SRFdS
IHwgT19DUkVBVCwgMDY2NCk7Cj4gKwl9Cj4gKwo+ICsJYnVmZmVyID0gU0FGRV9NTUFQKE5VTEws
IHBzaXplLCBwcm90LCBmbGFncywgZmQsIDApOwo+ICsKPiArCWlmIChwa2V5X21wcm90ZWN0KGJ1
ZmZlciwgcHNpemUsIHByb3QsIHBrZXkpID09IC0xKQo+ICsJCXRzdF9icmsoVEJST0ssICJwa2V5
X21wcm90ZWN0IGZhaWxlZCIpOwo+ICsKPiArCXRzdF9yZXMoVFBBU1MsICJhcHBseSBwa2V5IHRv
IHRoZSBidWZmZXIgYXJlYSBzdWNjZXNzIik7Cj4gKwo+ICsJaWYgKGZkID4gMCkgewo+ICsJCVNB
RkVfQ0xPU0UoZmQpOwo+ICsJfQo+ICsKPiArCVNBRkVfTVVOTUFQKGJ1ZmZlciwgcHNpemUpOwo+
ICt9Cj4gKwoKSGksCgpwa2V5MDIgZG9lc24ndCB0cnkgdG8gcmVhZC93cml0ZSBhcyBwa2V5MDEs
IGJ1dCBvdGhlcndpc2UgdHdvIHRlc3RzIGxvb2sKdmVyeSBzaW1pbGFyLgoKQ291bGQgd2UgdHJ5
IHRvIHJlYWQvd3JpdGUgaGVyZSBhcyB3ZWxsIGZvciBhbGwgY29tYmluYXRpb25zIG9mIG1hcCBm
bGFncz8KVGhlbiBwa2V5MDEgY291bGQgYmUgZHJvcHBlZCBzaW5jZSBwa2V5MDIgd291bGQgY292
ZXIgbW9yZSB0aGFuIGp1c3QgMSBjb21iaW5hdGlvbi4KT3IgaXMgdGhlcmUgYSBkaWZmZXJlbnQg
cmVhc29uIGJlaGluZCBzZXBhcmF0ZSB0ZXN0cywgdGhhdCBJJ20gbWlzc2luZz8KClJlZ2FyZHMs
CkphbgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
