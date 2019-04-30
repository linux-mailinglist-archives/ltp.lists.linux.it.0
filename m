Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79FFAD1
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:52:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4ACF93EACA7
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:52:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 15DB73EA140
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:52:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 57E9C140185B
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:52:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DEBAAC44;
 Tue, 30 Apr 2019 13:52:01 +0000 (UTC)
Date: Tue, 30 Apr 2019 15:51:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190430135159.GA7752@dell5510>
References: <20190430133836.28400-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430133836.28400-1-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] testcases.mk: Fix libs/ path for out-of-tree
	build
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

SGksCgo+IFRoZSBwYXRoIHRvIHRoZSBNYWtlZmlsZSB3YXMgbm90IGNvcnJlY3QgZm9yIHRoZSBv
dXQtb2YtdHJlZSBidWlsZAo+IGJlY2F1c2UgaXQgd2FzIHBvaW50aW5nIHRvIHRoZSBidWlsZCBk
aXJlY3RvcnkgcmF0aGVyIHRoYW4gdG8gdGhlIHNvdXJjZQo+IGRpcmVjdG9yeS4KCj4gQXBwYXJl
bnRseSB0aGlzIGFsc28gY2F1c2VkIHJhbmRvbSBmYWlsdXJlcyBmb3Igb3V0LW9mLXRyZWUgYnVp
bGQuIEZvcgo+IHNvbWUgcmVhc29uIHdoZW4gYnVpbGRpbmcgc3lzY2FsbHMvc2V0X21lbXBvbGlj
eS8gdGVzdGNhc2VzIHRoZSByZWJ1aWxkCj4gb2YgdGhlIGxpYmx0cG51bWEuYSBsaWJyYXJ5IGlz
IHRyaWdnZXJlZCBmb3Igb3V0LW9mLXRyZWUgYnVpbGQgZm9yIGFib3V0Cj4gMTAlIG9mIHRoZSBj
YXNlcyBvbiBtYXNzaXZlbHkgcGFyYWxsZWwgYnVpbGQuIFdoaWNoIGFzIGZhciBhcyBJIGNhbiB0
ZWxsCj4gc2hvdWxkbid0IGhhcHBlbiBzaW5jZSB3ZSBidWlsZCBldmVyeXRoaW5nIGluIHRoZSBs
aWJzLyBkaXJlY3RvcnkgYXMgYQo+IHByZXJlcXVpc2l0ZSBvZiB0aGUgdGVzdGNhc2VzLyBkaXJl
Y3RvcnkuIFNvIHRoZXJlIGlzIGxpa2VseSBzb21lCj4gc3RyYW5nZSByYWNlIGNvbmRpdGlvbiBo
YXBwZW5pbmcgYW5kIHdoaWxlIHRoaXMgZG9lcyBub3QgZml4IHRoZSBhY3R1YWwKPiByYWNlIGl0
IG1ha2VzIGl0IHF1aXRlIGhhcm1sZXNzIHNpbmNlIHRoZSB0YXJnZXQgd2FzIGFscmVhZHkgYnVp
bGQgYW5kCj4gdGhlIG1ha2UgaW4gdGhlIGxpYnMvbGlibHRwbnVtYS8gZGlyZWN0b3J5IHdpbGwg
YmUgbm8tb3AuCgo+IFNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6
Pgo+IENDOiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiBDQzogSmFuIFN0YW5jZWsgPGpz
dGFuY2VrQHJlZGhhdC5jb20+Cj4gLS0tClRlc3RlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1
c2UuY3o+Ck9uIDMyIGNvcmUgbWFjaGluZSwgcnVubmluZyBmb3Igc2V2ZXJhbCBob3VycyAobm93
IDY2IGJ1aWxkcyB3aXRob3V0IGZhaWx1cmUpLgoKCktpbmQgcmVnYXJkcywKUGV0cgoKPiAgaW5j
bHVkZS9tay90ZXN0Y2FzZXMubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tay90ZXN0Y2FzZXMu
bWsgYi9pbmNsdWRlL21rL3Rlc3RjYXNlcy5tawo+IGluZGV4IDEzMTg1NGVjNy4uNjg0NjU1ZmJm
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbWsvdGVzdGNhc2VzLm1rCj4gKysrIGIvaW5jbHVkZS9t
ay90ZXN0Y2FzZXMubWsKPiBAQCAtNDksNyArNDksNyBAQCBMVFBMSUJTX0ZJTEVTID0gJChhZGRz
dWZmaXggLmEsICQoYWRkcHJlZml4ICQoYWJzX3RvcF9idWlsZGRpcikvbGlicy8sICQoZm9yZWFj
aAo+ICBNQUtFX0RFUFMgKz0gJChMVFBMSUJTX0ZJTEVTKQoKPiAgJChMVFBMSUJTX0ZJTEVTKTog
JChMVFBMSUJTX0RJUlMpCj4gLQkkKE1BS0UpIC1DICIkXiIgLWYgIiReL01ha2VmaWxlIiBhbGwK
PiArCSQoTUFLRSkgLUMgIiReIiAtZiAiJChzdWJzdCAkKGFic190b3BfYnVpbGRkaXIpLCQoYWJz
X3RvcF9zcmNkaXIpLCReKS9NYWtlZmlsZSIgYWxsCgo+ICBMREZMQUdTICs9ICQoYWRkcHJlZml4
IC1MJCh0b3BfYnVpbGRkaXIpL2xpYnMvbGliLCAkKExUUExJQlMpKQoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
