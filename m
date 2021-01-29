Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC3308BFE
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 18:59:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBBCF3C77FB
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 18:59:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EF8843C0120
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 18:59:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 82B442010B8
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 18:59:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9B1CAC4F;
 Fri, 29 Jan 2021 17:59:12 +0000 (UTC)
Date: Fri, 29 Jan 2021 18:59:11 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YBRM7w0dNypJm2tD@pevik>
References: <20210129121817.12563-1-pvorel@suse.cz>
 <20210129121817.12563-4-pvorel@suse.cz> <YBQzlEoPLUAT3NFi@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBQzlEoPLUAT3NFi@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] zram01.sh: Check properly mkfs.* dependencies
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

Hi Cyril,

> Hi!
> > +check_fs_support()
> > +{
> > +	local fs unsupported
> > +	local msg="missing kernel support or mkfs for filesystems:"
> > +	dev_num=0
> > +
> > +	for fs in $zram_filesystems; do
> > +		if tst_supported_fs $fs 2> /dev/null; then

> Why are we silencing the output here?

> > +			dev_num=$((dev_num+1))
> > +		else
> > +			unsupported="$unsupported $fs"
> > +		fi
> > +	done

> Maybe we should put the Btrfs space check here as well, so that all
> checks are in a single place.

> > +	if [ $dev_num -eq 0 -a "$fallback_filesystem" != "$FS_TYPE" ]; then
> > +		if tst_supported_fs $fallback_filesystem 2> /dev/null; then
> > +			dev_num=1
> > +		fi
> > +	fi
> > +
> > +	if [ $dev_num -eq 0 ]; then
> > +		tst_res TINFO "filesystems on the system"
> > +		tst_supported_fs > /dev/null

> And producing different output here.

> > +		msg="$msg $zram_filesystems"
> > +		if [ "$fallback_filesystem" != "$FS_TYPE" ]; then
> > +			msg="$msg $fallback_filesystem"
> > +		fi
> > +		tst_brk TCONF "$msg"
> > +	fi
> > +
> > +	[ "$unsupported" ] && tst_res TINFO "$msg$unsupported"

> And here.

> I guess that we end up with a bit nicer output but the code is much more
> complex.
You're right.


> Also I'm confused how this is supposed to work, we do limit the dev_num
> but the zram_filesystems is untouched? That isn't going to work right.
It actually works due this check in functions it uses:
[ $i -eq $dev_num ] && break
(maybe more readable to use -ge ).

> I guess the best shoot would be generating the zram_filesystems here on
> the fly based on output of the tst_supported_fs.
Very good idea. I still wasn't happy with the patchset and this was the missing
piece. Also generating other variables. I overlooked that only size for BTRFS is
different. In that case [ $i -eq $dev_num ] && break should not be needed.

I also introduced fallback_filesystem, because I thought that FS_TYPE and FS_SIZE
(as uppercase) are for LTP API. But they're not, that's TST_FS_TYPE (and there
is no *SIZE variable). These (if still used) should be lower case).

Thanks for your review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
