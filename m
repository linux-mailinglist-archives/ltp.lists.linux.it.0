Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBD2A69EE
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 17:37:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43A173C5462
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 17:37:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 052233C2FFB
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 17:37:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8F29D6006DD
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 17:37:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E67D2AB8F;
 Wed,  4 Nov 2020 16:37:14 +0000 (UTC)
Date: Wed, 4 Nov 2020 17:37:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201104163713.GA1034@pevik>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201103191327.11081-4-pvorel@suse.cz>
 <20201104073008.GB8632@pevik>
 <CAEemH2dx2wYT0dHcDnFnZ0sqY8MO1QOb1-qEmgRSPdFLO=9NUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dx2wYT0dHcDnFnZ0sqY8MO1QOb1-qEmgRSPdFLO=9NUw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 03/11] docparse: Add test documentation parser
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
Cc: Cyril Hrubis <metan@ucw.cz>, automated-testing@yoctoproject.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > IMHO this change (adding buf[i++] = c;), which Li suggested,
> > is causing build failures:
> > https://travis-ci.org/github/pevik/ltp/builds/741217630

> > /usr/src/ltp/docparse/testinfo.pl metadata.json
> > , or ] expected while parsing array, at character offset 340 (before
> > "",\n      "0c461cb72...") at /usr/src/ltp/docparse/testinfo.pl line 379.
> > make[1]: *** [/usr/src/ltp/docparse/Makefile:60: txt] Error 255
> > make[1]: Leaving directory '/usr/src/ltp-build/docparse'
> > make: *** [/usr/src/ltp/Makefile:108: docparse-all] Error 2
> > make: *** Waiting for unfinished jobs....


> Sorry for the error, it because of wrongly parsed tst_test struct with
> including .min_kver = "2.6.32",  then output into metada.json like:

> # cat metadata.json
> ...
>   "cpuset01": {
>    "needs_root": "1",
>    "forks_child": "1",
>    "min_kver": "2.6.32"",  <====== here has two "" in the end
>    "fname": "testcases/kernel/mem/cpuset/cpuset01.c"
>   },

> So the "$(abs_srcdir)/testinfo.pl metadata.json" in Makefile report failure
> as above.

> ==========

> Another fix I can think of is just to avoid return NULL if detecting in the
> string("").
> Hope this will work for us, I will help to check it again tomorrow.

> --- a/docparse/docparse.c
> +++ b/docparse/docparse.c
> @@ -138,10 +138,8 @@ const char *next_token(FILE *f, struct data_node *doc)

>                 if (in_str) {
>                         if (c == '"') {
> -                               if (i == 0 || buf[i-1] != '\\') {
> -                                       buf[i++] = c;
> +                               if (i == 0 || buf[i-1] != '\\')
>                                         goto exit;
> -                               }
>                         }

>                         buf[i++] = c;
> @@ -189,7 +187,7 @@ const char *next_token(FILE *f, struct data_node *doc)
>         }

>  exit:
> -       if (i == 0)
> +       if (i == 0 && !in_str)
>                 return NULL;

>         buf[i] = 0;

Thanks for explanation. Yes, that's a working solution:
https://travis-ci.org/github/pevik/ltp/builds/741418867

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
