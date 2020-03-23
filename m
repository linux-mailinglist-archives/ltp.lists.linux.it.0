Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6618F8F0
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 16:49:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 347323C4E47
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 16:49:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EDA133C4E3C
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 16:49:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 804036008A8
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 16:49:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D69F6AD10;
 Mon, 23 Mar 2020 15:49:08 +0000 (UTC)
Date: Mon, 23 Mar 2020 16:49:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200323154907.GB15673@dell5510>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > > > kernel/syscalls/copy_file_range/copy_file_range02.c
> > > only affect test6 and test7
> > >  6) Try to copy contents to a file chattred with +i
> > >  *    flag -> EPERM
> > >  * 7) Try to copy contents to a swapfile ->ETXTBSY
> > Yes, it'd be bad to break all tests due it.

> > Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I don't
> > remember), which returns exit code 255 on error, so it's not possible to
> > distinguish this from the case whether command is not available (any idea,
> > how
> > to fix it?).

> Maybe we could achieve a tst_cmd_available(char *cmd) in the C version?
> which uses popen() to open a process like: "whereis/which command" and do
> string parse in the result to see the path(/usr/bin/cmd, /usr/sbin/cmd) of
> the bin if it has been found.
Or how about loop whole path like whereis/which command? I want to cover also
these "strange systems" (Android and embedded).

I wonder if to use this all the time (e.g. in safe_run_cmd(), because solution
in tst_run_cmd_fds_() (errno == ENOENT) works most of the time. Maybe changing
exit code 255 to something less common (e.g. INT_MAX - 5).
Do you want to use tst_cmd_available() also  not only as API

Kind regards,
Petr

> A draft version to show the idea:

> int tst_cmd_available(char *cmd)
> {
>     int ret = 0;
>     char path[PATH_MAX];
>     char result[PATH_MAX];
>     char command[PATH_MAX];

>     snprintf(path, PATH_MAX, "/usr/bin/%s", cmd);
>     snprintf(command, PATH_MAX, "whereis %s", cmd);
>     FILE *fp = popen(command, "r");
>     fgets(result, sizeof(result), fp);

>     if (strstr(result, path) != NULL)
>         ret = 1;
>     pclose(fp);

>     return ret;
> }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
