Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB517BE21
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:20:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4262D3C63C7
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:20:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 738D63C13DB
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:20:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 246CF600BC2
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:20:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DD71B345;
 Fri,  6 Mar 2020 13:20:13 +0000 (UTC)
Date: Fri, 6 Mar 2020 14:20:11 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200306132011.GA25572@dell5510>
References: <20200306120021.19997-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306120021.19997-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] pty: Test data transmission with SLIP line
 discipline
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

Hi Richard,

...
> +static int set_ldisc(int tty, struct ldisc_info *ldisc)
> +{
> +	TEST(ioctl(tty, TIOCSETD, &ldisc->n));
> +
> +	if (!TST_RET)
> +		return 0;
> +
> +	if (TST_ERR == EINVAL) {
> +		tst_res(TCONF | TTERRNO,
> +			"You don't appear to have the %s TTY line discipline",
> +			ldisc->name);
> +	} else {
> +		tst_res(TBROK | TTERRNO,
This must be TFAIL now.
This can be done by person who merges this patch.

BTW as the same function (with corrected TBROK) is
already in pty03.c (although struct ldisc_info is different).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
