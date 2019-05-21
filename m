Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D547A24C10
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 11:58:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 938DA3EA721
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 11:58:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B11543EA70E
 for <ltp@lists.linux.it>; Tue, 21 May 2019 11:58:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 35A7F200ADB
 for <ltp@lists.linux.it>; Tue, 21 May 2019 11:58:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8C0EAD17;
 Tue, 21 May 2019 09:58:33 +0000 (UTC)
Date: Tue, 21 May 2019 11:58:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190521095833.GA12205@rei>
References: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] shmctl01: don't use hardcoded index == 0 for
 SHM_STAT test
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

SGkhCj4gK3N0YXRpYyB2b2lkIGZ1bmNfc3N0YXRfc2V0dXAodm9pZCkKPiArewo+ICsJc3RydWN0
IHNobV9pbmZvIHRtcDsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gc2htY3RsKHNobV9pZF8x
LCBTSE1fSU5GTywgKHZvaWQgKikmdG1wKTsKPiArCWlmIChyZXQgPCAwKQo+ICsJCXRzdF9yZXNt
KFRGQUlMfFRFUlJOTywgInNobWN0bChTSE1fSU5GTykiKTsKCkkgd29uZGVyIGlmIGl0IG1ha2Vz
IHNlbnNlIHRvIGNvbnRpbnVlIGhlcmUgaWYgc2htY3RsKCkgaGFzIGZhaWxlZCwKbWF5YmUgd2Ug
c2hvdWxkIGRvIHRzdF9icmttKFRCUk9LIC4uLikgaW5zdGVhZC4KCk90aGVyd2lzZSBpdCBsb29r
cyBnb29kLCBhY2tlZC4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
