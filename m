Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B04868D
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 17:06:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8ADF3EB0C4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 17:06:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 65DAD3EA3FE
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 17:06:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0D40320033C
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 17:06:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F11A1AEF1;
 Mon, 17 Jun 2019 15:06:40 +0000 (UTC)
Date: Mon, 17 Jun 2019 17:06:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20190617150640.GD16831@rei>
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
 sync test-cases
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

SGkhClB1c2hlZCB3aXRoIGZvbGxvd2luZyBtb2RpZmljYXRpb25zLCB0aGFua3MuCgpXaXRoIHRo
ZXNlIG1vZGlmaWNhdGlvbiB0aGUgdGVzdCB3YXMgc3RhYmxlIGFuZCB3b3JrZWQgZmluZSBmb3Ig
bW9yZQp0aGFuIDEwMCBpdGVyYXRpb25zIGZvciBtZS4gSXQgc3RpbGwgZmFpbHMgZm9yIEZVU0Ug
YmFzZWQgZmlsZXN5c3RlbXMKYnV0IHRoYXQgaXMgdG8gYmUgZXhwZWN0ZWQgc2luY2UgRlVTRSBk
b2VzIG5vdCBpbXBsZW1lbnQgc3luY19maWxlX3JhbmdlCnlldC4KCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFuZ2UwMi5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3Jh
bmdlMDIuYwppbmRleCA5NDU0YTU2MGEuLmQ0YzI5ZjljMiAxMDA2NDQKLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDIuYworKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFu
Z2UwMi5jCkBAIC0zNiw2ICszNiw3IEBAIHN0cnVjdCB0ZXN0Y2FzZSB7CiAJc2l6ZV90IGV4cF9z
eW5jX3NpemU7CiAJb2ZmNjRfdCB3cml0ZV9vZmY7CiAJc2l6ZV90IHdyaXRlX3NpemVfbWI7CisJ
Y29uc3QgY2hhciAqZGVzYzsKIH07CiAKIHN0YXRpYyB2b2lkIHZlcmlmeV9zeW5jX2ZpbGVfcmFu
Z2Uoc3RydWN0IHRlc3RjYXNlICp0YykKQEAgLTYxLDIwICs2MiwzNCBAQCBzdGF0aWMgdm9pZCB2
ZXJpZnlfc3luY19maWxlX3JhbmdlKHN0cnVjdCB0ZXN0Y2FzZSAqdGMpCiAKIAl3cml0dGVuID0g
dHN0X2Rldl9ieXRlc193cml0dGVuKHRzdF9kZXZpY2UtPmRldik7CiAKKwlmc3luYyhmZCk7CisK
Cj4gTGV0J3MgbWFrZSBzdXJlIHRoZXJlIGFyZSBubyBvdXRzdGFuZGluZyB3cml0ZXMgc2NoZWR1
bGxlZCwgZml4ZXMKPiBydW5uaW5nIHRoZSB0ZXN0IHdpdGggLWkgMTAKCiAJU0FGRV9DTE9TRShm
ZCk7CiAKIAlpZiAoKHdyaXR0ZW4gPj0gdGMtPmV4cF9zeW5jX3NpemUpICYmCiAJICAgICh3cml0
dGVuIDw9ICh0Yy0+ZXhwX3N5bmNfc2l6ZSArIHRjLT5leHBfc3luY19zaXplLzEwKSkpCi0JCXRz
dF9yZXMoVFBBU1MsICJUZXN0IGZpbGUgcmFuZ2Ugc3luY2VkIHRvIGRldmljZSIpOworCQl0c3Rf
cmVzKFRQQVNTLCAiJXMiLCB0Yy0+ZGVzYyk7CiAJZWxzZQotCQl0c3RfcmVzKFRGQUlMLCAiU3lu
Y2VkICVsaSwgZXhwZWN0ZWQgJWxpIiwgd3JpdHRlbiwKLQkJCXRjLT5leHBfc3luY19zaXplKTsK
KwkJdHN0X3JlcyhURkFJTCwgIiVzOiBTeW5jZWQgJWxpLCBleHBlY3RlZCAlbGkiLCB0Yy0+ZGVz
YywKKwkJICAgICAgICB3cml0dGVuLCB0Yy0+ZXhwX3N5bmNfc2l6ZSk7CiB9Cgogc3RhdGljIHN0
cnVjdCB0ZXN0Y2FzZSB0ZXN0Y2FzZXNbXSA9IHsKLQl7IEZOQU1FMSwgMCwgRklMRV9TWiwgRklM
RV9TWiwgMCwgRklMRV9TWl9NQiB9LAotCXsgRk5BTUUyLCBGSUxFX1NaLzQsIEZJTEVfU1ovMiwg
RklMRV9TWi8yLCAwLCBGSUxFX1NaX01CIH0sCi0JeyBGTkFNRTMsIEZJTEVfU1ovNCwgRklMRV9T
Wi8yLCBGSUxFX1NaLzQsIEZJTEVfU1ovMiwgRklMRV9TWl9NQi80IH0sCisJe0ZOQU1FMSwKKwkg
MCwgRklMRV9TWiwKKwkgRklMRV9TWiwKKwkgMCwgRklMRV9TWl9NQiwKKwkgIlN5bmMgZXF1YWxz
IHdyaXRlIn0sCisJe0ZOQU1FMiwKKwkgRklMRV9TWi80LCBGSUxFX1NaLzIsCisJIEZJTEVfU1ov
MiwKKwkgMCwgRklMRV9TWl9NQiwKKwkgIlN5bmMgaW5zaWRlIG9mIHdyaXRlIn0sCisJe0ZOQU1F
MywKKwkgRklMRV9TWi80LCBGSUxFX1NaLzIsCisJIEZJTEVfU1ovNCwKKwkgRklMRV9TWi8yLCBG
SUxFX1NaX01CLzQsCisJICJTeW5jIG92ZXJsYXBzIHdpdGggd3JpdGUifSwKIH07Cgo+IFRoaXMg
c2ltcGx5IGFkZHMgdGVzdCBkZXNjcmlwdGlvbiBzbyB0aGF0IGl0J3MgY2xlYXIgd2hpY2ggc3Vi
dGVzdAo+IGZhaWxlZC4KIAogc3RhdGljIHZvaWQgcnVuKHVuc2lnbmVkIGludCBpKQpAQCAtODcs
MTAgKzEwMiwxNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogCWlmICghY2hlY2tfc3luY19m
aWxlX3JhbmdlKCkpCiAJCXRzdF9icmsoVENPTkYsICJzeW5jX2ZpbGVfcmFuZ2UoKSBub3Qgc3Vw
cG9ydGVkIik7CiAKKwkvKgorCSAqIEZhdCBkb2VzIG5vdCBzdXBwb3J0IHNwYXJzZSBmaWxlcywg
d2UgaGF2ZSB0byBwcmUtZmlsbCB0aGUgZmlsZSBzbworCSAqIHRoYXQgdGhlIHplcm8tZmlsbGVk
IHN0YXJ0IG9mIHRoZSBmaWxlIGhhcyBiZWVuIHdyaXR0ZW4gdG8gZGlzaworCSAqIGJlZm9yZSB0
aGUgdGVzdCBzdGFydHMuCisJICovCiAJaWYgKCFzdHJjbXAodHN0X2RldmljZS0+ZnNfdHlwZSwg
InZmYXQiKSkgewogCQl0c3RfcmVzKFRJTkZPLCAiUHJlLWZpbGxpbmcgZmlsZSIpOwogCQl0c3Rf
ZmlsbF9maWxlKEZOQU1FMywgMCwgVFNUX01CLCBGSUxFX1NaX01CKTsKLQkJc3luYygpOworCQlp
bnQgZmQgPSBTQUZFX09QRU4oRk5BTUUzLCBPX1JET05MWSk7CisJCWZzeW5jKGZkKTsKKwkJU0FG
RV9DTE9TRShmZCk7CiAJfQoKPiBTdHJhbmdlbHkgZG9pbmcgc3luYygpOyBoZXJlIGZhaWxlZCBm
b3IgbWUsIHRoYXQgbWF5IGJlIGFjdHVhbGx5IGEKPiBrZXJuZWwgYnVnIGhvd2V2ZXIgdGhlcmUg
aXMgbm8gbmVlZCBmb3IgdXNpbmcgdGhlIGJpZyBoYW1tZXIgYW5kIHN5bmMKPiBldmVyeXRoaW5n
IGluIHRoZSBzeXN0ZW0gYW55d2F5cy4KCiB9CgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3Vz
ZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
