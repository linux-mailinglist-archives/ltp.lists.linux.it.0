Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF4197AFB
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:40:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4ACC3C314B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:40:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CD5593C3155
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:40:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5292F600467
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:40:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1B22AEA4;
 Mon, 30 Mar 2020 11:40:44 +0000 (UTC)
Date: Mon, 30 Mar 2020 13:40:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200330114043.GA23915@dell5510>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-4-pvorel@suse.cz>
 <20200330113802.GE9845@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330113802.GE9845@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/6] lib/tst_run_cmd_*(): Turn int pass_exit_val
 into enum
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

> > This is a preparation for next commit.
> > Now uses the only flag TST_RUN_CMD_PASS_EXIT_VAL.

> That is quite long name, I wonder if we can shorten it.

> Maybe we can rename the whole tst_run_cmd() just to tst_cmd() and change
> this flag to TST_CMD_PASS_RETVAL.
This looks good to me, I'll change it.


> Other that this the patchset looks good.
And push whole patchset with your, Li's and Xiao Reviewed-by: tag.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
