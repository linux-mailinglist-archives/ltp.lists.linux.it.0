Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D87C2DC3A9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 17:02:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 374DA3C5817
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 17:02:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1803F3C29ED
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 17:02:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8DACD1000BFA
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 17:02:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DADC0ACBA
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 16:02:26 +0000 (UTC)
Date: Wed, 16 Dec 2020 17:02:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X9ovkdN27zTsK+PN@pevik>
References: <20201216143244.8180-1-pvorel@suse.cz> <X9oc1p0Z7LbBhKr0@yuki.lan>
 <X9ojaYZkNuwOOsyk@pevik> <X9ooMiuT3DKHwHjJ@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9ooMiuT3DKHwHjJ@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Docparse: Escape | in table content
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

> Hi!
> > BTW I wonder how to fix .test_variants in JSON:
> > "test_variants": "ARRAY_SIZE"

> > It's in many tests, e.g.  testcases/kernel/syscalls/clock_gettime/clock_gettime02.c.

> I guess that we can filter out test_variants for now, I do not think
> that it will be useful for the metadata that much.

+1, I'll do it.

> > Also many arrays should be anonymous, e.g. exe_options (for .options) and
> > resource_files (for .resource_files) in testcases/kernel/syscalls/execve/execve05.c.
> > I wonder if there can be smarter solution before we fix it.

> Well either we teach the C parser about variables, or we move all the
> definitions inline. I would just move them since that's easier to do.

+1.

> > But using inline for .options (and other two dimensional array needs to be fixed
> > again in the parser: it now prints array reference: ARRAY(0x563186f58048)
> > (for testcases/kernel/syscalls/ioctl/ioctl01.c).

> That's a bug in the perl that produces the asciidoc, it's parsed just
> fine in the json:

Sure, I meant perl parser, which is actually formatter.
I'll try to send a patch soon.

>   "ioctl01": {
>    "needs_root": "1",
>    "needs_tmpdir": "1",
>    "options": [
>      [
>       "D:",
>       "device",
>       "-D <tty device> : for example, /dev/tty[0-9]"
>      ]
>     ],
>    "fname": "testcases/kernel/syscalls/ioctl/ioctl01.c"
>   },

> > Because this disables reusing things (putting them in the header). But you
> > probably prefer it than slower down parsing with preprocessor.
> > But we need to state this policy in docs.

> Indeed, that should be done.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
