Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475A4947F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:42:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71A923EB074
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:42:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 30AE23EA441
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:42:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 170E31400431
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:42:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8547AD3B;
 Mon, 17 Jun 2019 21:42:45 +0000 (UTC)
Date: Mon, 17 Jun 2019 23:42:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190617214244.GA19347@x230>
References: <20190615042048.29839-1-liwang@redhat.com>
 <20190615042048.29839-3-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615042048.29839-3-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/3] testcase: get rid of compiling errors
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

SGkgTGksCgo+IFNpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgoKVGhh
bmtzIHRoaXMgcGF0Y2hzZXQuCgpBY2tlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+
Cgo+IC0tLQo+ICBjb25maWd1cmUuYWMgICAgICAgICAgICAgfCAxICsKPiAgdGVzdGNhc2VzL2N2
ZS9tZWx0ZG93bi5jIHwgNSArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQoKPiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCj4gaW5kZXggNWVj
YzkyNzgxLi41MjFmNTY1NDEgMTAwNjQ0Cj4gLS0tIGEvY29uZmlndXJlLmFjCj4gKysrIGIvY29u
ZmlndXJlLmFjCj4gQEAgLTU4LDYgKzU4LDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhbIFwKPiAgICAg
IHN5cy9zaG0uaCBcCj4gICAgICBzeXMvdXN0YXQuaCBcCj4gICAgICBzeXMveGF0dHIuaCBcCj4g
KyAgICBlbW1pbnRyaW4uaCBcCkp1c3QgQUNfQ0hFQ0tfSEVBREVSUyBpcyBzb3J0ZWQgYWxwaGFi
ZXRpY2FsbHkgc2luY2UgYTUwMzM4Y2FjLgpCdXQgdGhpcyBjYW4gYmUgYW1lbmRlZCBkdXJpbmcg
bWVyZ2luZy4KCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gIF0pCgo+ICBBQ19DSEVDS19GVU5DUyhb
IFwKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5jIGIvdGVzdGNhc2VzL2N2
ZS9tZWx0ZG93bi5jCj4gaW5kZXggNzJjOWVjOTA3Li5iYzY0OWI4OTMgMTAwNjQ0Cj4gLS0tIGEv
dGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5jCj4gKysrIGIvdGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5j
Cj4gQEAgLTI5LDYgKzI5LDcgQEAKPiAgI2luY2x1ZGUgPGN0eXBlLmg+Cj4gICNpbmNsdWRlIDxz
eXMvdXRzbmFtZS5oPgoKPiArI2lmZGVmIEhBVkVfRU1NSU5UUklOX0gKPiAgI2luY2x1ZGUgPGVt
bWludHJpbi5oPgoKPiAgI2luY2x1ZGUgImxpYnRzYy5oIgo+IEBAIC0zODcsMyArMzg4LDcgQEAg
c3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICAJLmNsZWFudXAgPSBjbGVhbnVwLAo+
ICAJLm1pbl9rdmVyID0gIjIuNi4zMiIKPiAgfTsKPiArCj4gKyNlbHNlIC8qIEhBVkVfRU1NSU5U
UklOX0ggKi8KPiArCVRTVF9URVNUX1RDT05GKCI8ZW1taW50cmluLmg+IGlzIG5vdCBzdXBwb3J0
ZWQiKTsKPiArI2VuZGlmCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
