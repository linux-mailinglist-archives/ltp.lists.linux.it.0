Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97E225DDD
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 13:53:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C2213C4E24
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 13:53:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C38833C0886
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 13:53:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E1AC060108B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 13:52:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1EF3AB76;
 Mon, 20 Jul 2020 11:53:53 +0000 (UTC)
Date: Mon, 20 Jul 2020 13:53:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200720115345.GA21201@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-7-pvorel@suse.cz>
 <5F155DB2.8080709@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F155DB2.8080709@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/7] net/test: Add basic testing for
 tst_rhost_run
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

> > +	tst_rhost_run -c 'which grep > /dev/null' || \
> > +		tst_res TCONF "grep not found on rhost"
> Hi Petr,

> 1) Do you want to discard stderr as well? For example:
> -------------------------------------------------
> # which gre >/dev/null
> /usr/bin/which: no gre in
> (/opt/ltp/testcases/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin)

That's not needed because tst_rhost_run already redirect stderr to stdout.

> -------------------------------------------------
> 2) Is it necessary to continue if grep command is not found on rhost?
> How about calling tst_brk?
Good catch, I should use tst_brk on both places.

> > +
> > +	tst_rhost_run -c "[ -f $file ]" || \
> > +		tst_res TCONF "$file not found on rhost"
> Call tst_brk as well?

> Thanks,
> Xiao Yang

Thanks!
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
