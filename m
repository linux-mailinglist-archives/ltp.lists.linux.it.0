Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0B297F6
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 14:24:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81F3C3EA69B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 14:24:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id F25273EA2E7
 for <ltp@lists.linux.it>; Fri, 24 May 2019 14:24:00 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EE62C601E70
 for <ltp@lists.linux.it>; Fri, 24 May 2019 14:23:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B87FDAD26;
 Fri, 24 May 2019 12:23:58 +0000 (UTC)
Date: Fri, 24 May 2019 14:23:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190524122357.GA28108@dell5510>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
 <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
 <20190524085452.GB29592@dell5510>
 <CAOQ4uxhBcMRg1+7sihQaTC217We8Hj+fAQ2xhiDTHvBDP4NZag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhBcMRg1+7sihQaTC217We8Hj+fAQ2xhiDTHvBDP4NZag@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

SGkgQW1pciwKCnRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9ucywgaGlnaGx5IGFwcHJlY2lhdGVk
IDopLgouLi4KPiA+ICNkZWZpbmUgU0FGRV9NT1VOVF9PVkVSTEFZKCkgXAo+ID4gICAgICAgICBt
b3VudF9vdmVybGF5KF9fRklMRV9fLCBfX0xJTkVfXywgMSk7Cgo+ID4gI2RlZmluZSBUU1RfTU9V
TlRfT1ZFUkxBWSgpIFwKPiA+ICAgICAgICAgbW91bnRfb3ZlcmxheShfX0ZJTEVfXywgX19MSU5F
X18sIDApOwoKCj4gSSBsaWtlIHRoaXMgdmVyc2lvbiBvZiB0aGUgaGVscGVycy9tYWNyb3MuCgo+
IEkgd291bGQgY2hhbmdlIFRTVF9NT1VOVF9PVkVSTEFZIHRvCj4gKG1vdW50X292ZXJsYXkoX19G
SUxFX18sIF9fTElORV9fLCAwKSA9PSAwKQo+IHNvIHRoYXQgaXQgY291bGQgYmUgdXNlZCBsaWtl
IHRoaXM6Cgo+IG92bF9tb3VudGVkID0gVFNUX01PVU5UX09WRVJMQVkoLi4uKQorMQoKPiBVc2Vz
IG9mIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIHNob3VsZCBub3QgY2hlY2sgcmV0dXJuIHZhbHVlCj4g
Y291bGQgZXZlbiBwbGFjZSAodm9pZCkgaW4gZnJvbnQgb2YgbW91bnRfb3ZlcmxheSB0byBlbmZv
cmNlIHRoYXQuCklmIHdlIGRvbid0IGNhcmUsIHRoZW4gaXQgY291bGQgYmU/CiNkZWZpbmUgU0FG
RV9NT1VOVF9PVkVSTEFZKCkgXAoJKHZvaWQpIG1vdW50X292ZXJsYXkoX19GSUxFX18sIF9fTElO
RV9fLCAxKTsKCkkgbWVhbiB0aGVyZSBpcyBhbHdheXMgbW91bnRfb3ZlcmxheSgpIGZvciBzcGVj
aWFsIGNhc2VzLCBtYWNyb3Mgc2hvdWxkIGJlCmhlcmUgdG8gbWFrZSBlYXNpZXIgY29tbW9uIHVz
YWdlLgoKPiBUZXN0IHRoYXQgdXNlIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIHNob3VsZCBlaXRoZXIg
aGF2ZSBubwo+IHZhcmlhYmxlIG92bF9tb3VudGVkIG9yIHNldCBpdCBhZnRlciBTQUZFX01PVU5U
X09WRVJMQVkoKSB3aXRob3V0Cj4gY2hlY2tpbmcgcmV0dXJuIHZhbHVlLgorMQoKPiBUaGFua3Ms
Cj4gQW1pci4KCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
