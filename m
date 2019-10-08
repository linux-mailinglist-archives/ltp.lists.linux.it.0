Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1410CF8E7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 13:51:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B720A3C22D5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 13:51:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 808373C0DFD
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 13:51:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 941A0600064
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 13:51:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C06CFB179;
 Tue,  8 Oct 2019 11:51:52 +0000 (UTC)
Date: Tue, 8 Oct 2019 13:51:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Prabhakar Kushwaha <prabhakar.kushwaha@outlook.com>
Message-ID: <20191008115151.GC13411@rei.lan>
References: <MA1PR0101MB18158831A03644C622793C6B989B0@MA1PR0101MB1815.INDPRD01.PROD.OUTLOOK.COM>
 <20191007183111.GA26203@rei.lan>
 <MA1PR0101MB1815CC5CCC0A10DA6F658DE6989A0@MA1PR0101MB1815.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA1PR0101MB1815CC5CCC0A10DA6F658DE6989A0@MA1PR0101MB1815.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP-cpuset test cases
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> cleanup(): Looks like removing /dev/cpuset folder or subfolders are not making load-balance state of system to be normal.
> With below fix, no more crash are being observed.
> 
> --- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> @@ -154,6 +154,9 @@ cleanup()
>                                                         "$pid in the cpuset"
>                         fi
>                 done < "$subdir/tasks"
> +
> +               /bin/echo 0 > $subdir/cpuset.sched_load_balance
> +
>                 rmdir "$subdir"
>                 if [ $? -ne 0 ]; then
>                         tst_brkm TFAIL "Couldn't remove subdir - "
> @@ -161,6 +164,9 @@ cleanup()
>                 fi
>         done
> 
> +       /bin/echo 0 > $CPUSET/cpuset.sched_load_balance
> +       /bin/echo 0 > $CPUSET_TMP/cpuset.sched_load_balance
> +
>         umount "$CPUSET"
>         if [ $? -ne 0 ]; then
>                 tst_brkm TFAIL "Couldn't umount cgroup filesystem with"

Looks like a kernel bug to me.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
