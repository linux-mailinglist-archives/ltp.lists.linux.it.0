Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE9481DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 14:22:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 856F13EB0CA
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 14:22:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4A4453EA039
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 14:21:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E35846016E8
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 14:21:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E2AEAF93;
 Mon, 17 Jun 2019 12:21:58 +0000 (UTC)
Date: Mon, 17 Jun 2019 14:21:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20190617122155.GA8603@dell5510>
References: <20190614122716.2383-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614122716.2383-1-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/tst_net_vars: Fix IPv4 network computing on
 big endianness
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

SGksCgo+IGJ5IGNvbnZlcnRpbmcgSVAgdG8gbmV0d29yayBieXRlIG9yZGVyIGFuZCBhZGp1c3Qg
cHJpbnRpbmcuCgo+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+
IC0tLQo+ICB0ZXN0Y2FzZXMvbGliL3RzdF9uZXRfdmFycy5jIHwgMTYgKysrKysrLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCk1l
cmdlZC4KCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
