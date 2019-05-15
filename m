Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDDD1F5B7
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 15:39:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76577294AEB
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 15:39:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9384C294AB2
 for <ltp@lists.linux.it>; Wed, 15 May 2019 15:39:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4A6BA600B6D
 for <ltp@lists.linux.it>; Wed, 15 May 2019 15:39:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D537AD56;
 Wed, 15 May 2019 13:39:41 +0000 (UTC)
Date: Wed, 15 May 2019 15:39:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190515133940.GB5429@dell5510>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515092129.26336-2-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515092129.26336-2-xzhou@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] OVL_MNT: put overlayfs lower, upper, work,
 mnt dir in a separated mountpoint
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

SGkgTXVycGh5LAoKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2V4ZWN2ZWF0L2V4
ZWN2ZWF0MDMuYwouLi4KPiAtCS8qIFNldHVwIGFuIG92ZXJsYXkgbW91bnQgd2l0aCBsb3dlciBm
aWxlICovCj4gLQlTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwo+IC0JU0FGRV9NS0RJUigidXBw
ZXIiLCAwNzU1KTsKPiAtCVNBRkVfTUtESVIoIndvcmsiLCAwNzU1KTsKPiAtCVNBRkVfTUtESVIo
T1ZMX01OVCwgMDc1NSk7Cj4gLQlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVy
bGF5IiwgMCwKPiAtCQkgICAgImxvd2VyZGlyPWxvd2VyLHVwcGVyZGlyPXVwcGVyLHdvcmtkaXI9
d29yayIpOwo+IC0JaWYgKHJldCA8IDApIHsKPiAtCQlpZiAoZXJybm8gPT0gRU5PREVWKSB7Cj4g
LQkJCXRzdF9icmsoVENPTkYsCj4gLQkJCQkib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGlu
IHRoaXMga2VybmVsLiIpOwo+IC0JCX0KPiAtCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAib3Zl
cmxheWZzIG1vdW50IGZhaWxlZCIpOwo+IC0JfQo+IC0Jb3ZsX21vdW50ZWQgPSAxOwo+ICsJaWYg
KHNldHVwX292ZXJsYXkoMSkgPT0gMCkKPiArCQlvdmxfbW91bnRlZCA9IDE7CkhlcmUgeW91IGNo
YW5nZSB0ZXN0IGJlaGF2aW9yIG9uIEVOT0RFVi4KCisgbW9yZSBpbmZvIGF0IDFzdCBwYXRjaC4K
CktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
