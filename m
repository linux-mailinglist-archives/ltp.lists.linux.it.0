Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DCD2DC82F
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 22:14:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE66E3C5A51
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 22:14:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 333983C2439
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 22:14:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A1418600550
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 22:14:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0C66AD07
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 21:14:48 +0000 (UTC)
Date: Wed, 16 Dec 2020 22:14:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X9p4x3rnqr7t+0BR@pevik>
References: <20201216143244.8180-1-pvorel@suse.cz> <X9oc1p0Z7LbBhKr0@yuki.lan>
 <X9ojaYZkNuwOOsyk@pevik> <X9ooMiuT3DKHwHjJ@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9ooMiuT3DKHwHjJ@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

Hi Cyril,

...
> > Also many arrays should be anonymous, e.g. exe_options (for .options) and
> > resource_files (for .resource_files) in testcases/kernel/syscalls/execve/execve05.c.
> > I wonder if there can be smarter solution before we fix it.

> Well either we teach the C parser about variables, or we move all the
> definitions inline. I would just move them since that's easier to do.
I've fixed most of .options and .save_restore.
There are still some (e.g. CORE_PATTERN in madvise08 - use macro).

> > But using inline for .options (and other two dimensional array needs to be fixed
> > again in the parser: it now prints array reference: ARRAY(0x563186f58048)
> > (for testcases/kernel/syscalls/ioctl/ioctl01.c).

> That's a bug in the perl that produces the asciidoc, it's parsed just
> fine in the json:

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

I've fixed this in dca56c567.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
