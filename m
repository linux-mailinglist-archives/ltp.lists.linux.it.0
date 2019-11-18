Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966C100D2C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 21:32:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C53273C2351
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 21:32:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5D3BF3C12F2
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 21:32:44 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B610E2013B4
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 21:32:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DC89B23B;
 Mon, 18 Nov 2019 20:32:43 +0000 (UTC)
Date: Mon, 18 Nov 2019 21:32:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20191118203241.GC2531@x230>
References: <20191115221038.14383-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115221038.14383-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix static linking with musl-fts
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Fabrice,

> Don't append libraries to LDLIBS but prepend them in cpuset_lib/Makefile
> and cpuset/Makefile.inc to allow the user to provide its FTS library
> such as -lfts for musl/uclibc through LDLIBS

> This will fix static build of ltp with musl-fts on uclibc

> Fixes:
>  - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

> -LDLIBS			+= -lcpu_set -lcontrollers -lltp
> +LDLIBS			:= -lcpu_set -lcontrollers -lltp $(LDLIBS)

Thanks a lot, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
