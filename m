Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E18E218F1A2
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:20:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADA873C4E49
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:20:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B7D443C4E3D
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:20:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8972A1A00A35
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:20:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD96AB15A;
 Mon, 23 Mar 2020 09:20:15 +0000 (UTC)
Date: Mon, 23 Mar 2020 10:20:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200323092014.GA26702@dell5510>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <edd8ed18-8cb3-2a13-7caa-a55c3447389a@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edd8ed18-8cb3-2a13-7caa-a55c3447389a@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Implement SAFE_RUN() macro (new API only)
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

Hi Xu,

> > +		tst_brk(TBROK, "%s:%d: %s failed (%d)", file, lineno, rc);
> typo, rc -> rval and  miss  argv[0].
> > +	}
> > +}
> > +#define SAFE_RUNCMD(argv, stdout_path, stderr_path) \
> > +	safe_run_cmd(__FILE__, __LINE__, NULL, (argv), (stdout_path), (stderr_path))
> I guess we don't need the third argument(NULL).

Thanks for catching these! I've sent v2 with your Reviewed-by: tag.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
