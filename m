Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316E372FE
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 13:34:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 619A039034E
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 13:34:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 53C363EA9C2
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:34:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C5428600C49
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:34:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33E1AAEFC
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 11:34:31 +0000 (UTC)
Date: Thu, 6 Jun 2019 13:34:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190606113430.GA13068@rei.lan>
References: <20190606090009.31124-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606090009.31124-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/fstat{01,02}: rewrote testcases
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

SGkhClB1c2hlZCB3aXRoIG1pbm9yIGNoYW5nZXMsIHRoYW5rcy4KClRoZSBmc3RhdDAxIHdhcyBp
biB0aGUgcXVpY2toaXQgcnVudGVzdCBmaWxlIGFzIHdlbGwsLCByZW1vdmVkIHRoYXQuCgpBbmQg
YXMgZm9yIHRoZSB0ZXN0LCB3ZSBkb24ndCBoYXZlIHRvIHByaW50IGFub3RoZXIgVEZBSUwgbWVz
c2FnZSBvbgpmYWlsdXJlIGFuZCB3ZSBzaG91bGQgYmUgbW9yZSBzdHJpY3QgYWJvdXQgY2hlY2tp
bmcgdGhlIHJldHVybiB2YWx1ZQoodGhlIHRlc3Qgd291bGQgcGFzcyBpZiBmc3RhdCByZXR1cm5l
ZCBnYXJiYWdlIHRoYXQgIT0gLTEpCgogc3RhdGljIHZvaWQgcnVuKHZvaWQpCiB7Ci0JaW50IGZh
aWw7CisJaW50IGZhaWwgPSAwOwogCiAJVEVTVChmc3RhdChmaWxkZXMsICZzdGF0X2J1ZikpOwog
Ci0JaWYgKFRTVF9SRVQgPT0gLTEpIHsKKwlpZiAoVFNUX1JFVCAhPSAwKSB7CiAJCXRzdF9yZXMo
VEZBSUwgfCBUVEVSUk5PLCAiZnN0YXQoKSBmYWlsZWQiKTsKIAkJcmV0dXJuOwogCX0KQEAgLTYx
LDEwICs2MSw4IEBAIHN0YXRpYyB2b2lkIHJ1bih2b2lkKQogCQlmYWlsKys7CiAJfQogCi0JaWYg
KGZhaWwpIHsKLQkJdHN0X3JlcyhURkFJTCwgImZzdGF0KCkgcmVwb3J0ZWQgd3JvbmcgdmFsdWVz
LiIpOworCWlmIChmYWlsKQogCQlyZXR1cm47Ci0JfQogCiAJdHN0X3JlcyhUUEFTUywgImZzdGF0
KCkgcmVwb3J0ZWQgY29ycmVjdCB2YWx1ZXMuIik7CiB9CgotLSAKQ3lyaWwgSHJ1YmlzCmNocnVi
aXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
