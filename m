Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD94308E21
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 21:15:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 489493C780F
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 21:15:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id ADA3A3C28F3
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 21:15:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 51E2D601C64
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 21:15:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 951F7ACB0
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:15:51 +0000 (UTC)
Date: Fri, 29 Jan 2021 21:15:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YBRs9sySYXT6Bwlk@pevik>
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-7-pvorel@suse.cz> <YBRroFhaxdqCLv2i@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBRroFhaxdqCLv2i@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/6] zram: Increase timeout according to used
 devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi,

> > +	TST_TIMEOUT=$((dev_num*200))
> Actually on heavy loaded machine this is not enough due BTRFS.
> I can add something like dev_num*600 or even -1 (then previous commit would not
> be needed, but IMHO still useful).
And bad thing is that it breaks other zram tests, because the timer probably
does not allow to run the cleanup:

_tst_setup_timer()
{
...
	sleep $sec && tst_res TBROK "test killed, timeout! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9 -$pid &

I'm not sure if shell allow us to do it better. Maybe sent different signal than
SIGKILL and define 'trap _tst_do_exit' for that signal?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
