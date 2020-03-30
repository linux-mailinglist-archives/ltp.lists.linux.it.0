Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE77197B40
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:52:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F023A3C3159
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:52:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C9F9E3C042D
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:52:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7DFE06006CB
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:52:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DDAFDAC5F;
 Mon, 30 Mar 2020 11:52:25 +0000 (UTC)
Date: Mon, 30 Mar 2020 13:52:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200330115224.GC23915@dell5510>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-5-pvorel@suse.cz>
 <20200330114041.GF9845@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330114041.GF9845@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/6] lib/tst_run_cmd_*(): Search for program in
 $PATH
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

Hi,

> > +	/* exit with TCONF if program is not in path */
> > +	TST_RUN_CMD_CHECK_CMD = 2,

> Shouldn't be this rather called TST_CMD_TCONF_ON_MISSING?
+1.

If these two comments (with renaming to tst_cmd() + flags) are the only your
concern, I'll rename it and just push without sending to ML.

When we're in renaming, I guess I should rename SAFE_RUN_CMD() into SAFE_CMD(),
ok?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
