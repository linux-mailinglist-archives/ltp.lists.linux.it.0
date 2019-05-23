Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C32EC27970
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 11:40:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B7533EA360
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 11:40:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 46B273EA1E5
 for <ltp@lists.linux.it>; Thu, 23 May 2019 11:40:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DA3F314088F9
 for <ltp@lists.linux.it>; Thu, 23 May 2019 11:40:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35E7FAE20;
 Thu, 23 May 2019 09:40:04 +0000 (UTC)
Date: Thu, 23 May 2019 11:40:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190523094003.GC30616@rei.lan>
References: <1557404414-3797-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557404414-3797-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/prctl05.c: New test for prctl() with
 PR_{SET, GET}_NAME
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

SGkhCj4gKwlURVNUKHByY3RsKFBSX0dFVF9OQU1FLCAmYnVmKSk7Cj4gKwlpZiAoVFNUX1JFVCA9
PSAtMSkgewo+ICsJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAicHJjdGwoUFJfR0VUX05BTUUp
IGZhaWxlZCIpOwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4gKwlpZiAoIXN0cm5jbXAodGhyZWFk
X25hbWUsIGJ1ZiwgMTUpICYmIHN0cmxlbihidWYpID09IDE1KQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCQkJCQkJICBIZXJlIHdlIGFyZSBjYWxs
aW5nCgkJCQkJCSAgc3RybGVuKCkgb24KCQkJCQkJICBwb3RlbnRpb25hbGx5CgkJCQkJCSAgdW50
ZXJtaW5hdGVkIGJ1ZmZlcgoKSSBndWVzcyB0aGF0IHdlIHNob3VsZCBkbyBidWZbMTldID0gMCBh
ZnRlciB0aGUgUFJfR0VUX05BTUUgcHJjdGwoKS4KCj4gKwkJdHN0X3JlcyhUUEFTUywgInByY3Rs
KFBSX0dFVF9OQU1FKSBzdWNjZWVkZWQsICIKPiArCQkJCSJ0aHJlYWQgbmFtZSBpcyAlcyIsIGJ1
Zik7Cj4gKwllbHNlCj4gKwkJdHN0X3JlcyhURkFJTCwKPiArCQkJInByY3RsKFBSX0dFVF9OQU1F
KSBmYWlsZWQgdG8gdHJ1bmNhdGUgdGhlIG5hbWUgaW50byAiCj4gKwkJCSIxNiBieXRlIGxvbmci
KTsKCkNhbiB3ZSBhbHNvIGNoZWNrIHRoYXQgdGhlIC9wcm9jL3NlbGYvdGFzay8kdGlkL2NvbW0g
bWF0Y2hlcyBhcyB3ZWxsPwoKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0
ID0gewo+ICsJLnRlc3RfYWxsID0gdmVyaWZ5X3ByY3RsLAo+ICt9OwoKCk90aGVyIHRoYW4gdGhh
dCBpdCBsb29rcyBnb29kLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
