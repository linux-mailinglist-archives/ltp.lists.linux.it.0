Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8949488
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:46:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A6743EB073
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:46:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2CD383EA442
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:46:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D14D01400331
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:46:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 266DDAECD;
 Mon, 17 Jun 2019 21:46:21 +0000 (UTC)
Date: Mon, 17 Jun 2019 23:46:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190617214619.GB19347@x230>
References: <20190615042048.29839-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615042048.29839-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
 structure
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

SGkgTGksCgo+IFRlc3RjYXNlcyBmb3Igc3BlY2lmaWVkIGFyY2ggc2hvdWxkIGJlIGxpbWl0ZWQg
b24gdGhhdCBvbmx5IGJlaW5nIHN1cHBvcnRlZAo+IHBsYXRmb3JtIHRvIHJ1biwgd2Ugbm93IGNy
ZWF0ZSBhIGZ1bmN0aW9uIHRzdF9vbl9hcmNoIHRvIGFjaGlldmUgdGhpcyBuZXcKPiBmZWF0dXJl
IGluIExUUCBsaWJyYXJ5LiAgQWxsIHlvdSBuZWVkIHRvIHJ1biBhIHRlc3Qgb24gdGhlIGV4cGVj
dGVkIGFyY2ggaXMKPiB0byBzZXQgdGhlICcuYXJjaCcgc3RyaW5nIGluIHRoZSAnc3RydWN0IHRz
dF90ZXN0JyB0byBjaG9vc2UgdGhlIHJlcXVpcmVkCj4gYXJjaCBsaXN0LiBlLmcuICcuYXJjaCA9
ICJ4ODZfNjQgaTM4NiInLgoKPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0
LmNvbT4KUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKTEdUTS4gRllJ
IHRoZXJlIGlzIGFsc28gSE9TVF9DUFUgdmFyaWFibGUgKHNpbmNlIDAwZmYyYzM0OGYpLApidXQg
dGhhdCBkb2VzIG5vdCBoZWxwIHlvdXIgcGF0Y2guCgo+IC0tLQo+ICBkb2MvdGVzdC13cml0aW5n
LWd1aWRlbGluZXMudHh0IHwgMjYgKysrKysrKysrKwo+ICBpbmNsdWRlL3RzdF9hcmNoLmggICAg
ICAgICAgICAgIHwgMTYgKysrKysrCj4gIGluY2x1ZGUvdHN0X3Rlc3QuaCAgICAgICAgICAgICAg
fCAgNyArKy0KPiAgbGliL3RzdF9hcmNoLmMgICAgICAgICAgICAgICAgICB8IDkyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3RzdF9h
cmNoLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi90c3RfYXJjaC5jCgo+IGRpZmYgLS1naXQg
YS9kb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0IGIvZG9jL3Rlc3Qtd3JpdGluZy1ndWlk
ZWxpbmVzLnR4dAo+IGluZGV4IGYxOTEyZGMxMi4uYjRmYmEwMTkwIDEwMDY0NAo+IC0tLSBhL2Rv
Yy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQKPiArKysgYi9kb2MvdGVzdC13cml0aW5nLWd1
aWRlbGluZXMudHh0Cj4gQEAgLTE2NjgsNiArMTY2OCwzMiBAQCBzdHVyY3QgdHN0X3Rlc3QgdGVz
dCA9IHsKPiAgfTsKPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKPiArMi4yLjMwIFRlc3Rpbmcg
b24gc3BlY2lmaWVkIGFyY2hpdGVjdHVyZQogICAgICAgICAgICAgICAgICAgICBeIG1heWJlIHNw
ZWNpZmljPwoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
