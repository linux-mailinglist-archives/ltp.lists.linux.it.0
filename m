Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD76E23B24
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:50:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B2322D0147
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:50:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 980EC2D013A
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:50:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B4297600C81
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:50:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DD34AFF3;
 Mon, 20 May 2019 14:50:04 +0000 (UTC)
Date: Mon, 20 May 2019 16:50:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190520145002.GA28760@dell5510>
References: <20190520135450.22014-1-pvorel@suse.cz>
 <20190520141940.GB28976@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520141940.GB28976@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lib: Migrate tst_get_unused_port to new API
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

SGksCgo+IEhpIQo+IEFja2VkLgpUaGFua3MuCgpJJ20gc29ycnksIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gaXMgd3JvbmcgYXMgaXQgZG9lcyBub3QgcHJpbnQgcG9ydCA6KS4KSSdsbCBwdXNoIGl0
IHdpdGggdGhpcyBkaWZmIChJIGd1ZXNzIHdlIGRvbid0IG5lZWQgbmV3IGxpbmUgZm9yIHBvcnQs
CmFsdGhvdWdoIHRoYXQncyBub3QgcHJvYmxlbWF0aWMgZm9yIHNoZWxsIHVzYWdlIGxpa2UgdGhp
czoKCnBvcnQ9JCh0c3RfZ2V0X3VudXNlZF9wb3J0IGlwdiR7VFNUX0lQVkVSfSBzdHJlYW0pCgpL
aW5kIHJlZ2FyZHMsClBldHIKCi0tLSBhL3Rlc3RjYXNlcy9saWIvdHN0X2dldF91bnVzZWRfcG9y
dC5jCisrKyBiL3Rlc3RjYXNlcy9saWIvdHN0X2dldF91bnVzZWRfcG9ydC5jCkBAIC01NCw1ICs1
NCw2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJCXJldHVybiAxOwogCX0K
IAotCXJldHVybiBUU1RfR0VUX1VOVVNFRF9QT1JUKGZhbWlseSwgdHlwZSk7CisJcHJpbnRmKCIl
ZCIsIFRTVF9HRVRfVU5VU0VEX1BPUlQoZmFtaWx5LCB0eXBlKSk7CisJcmV0dXJuIDA7CiB9Cgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
