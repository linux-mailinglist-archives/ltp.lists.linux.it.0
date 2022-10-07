Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 585335F75FE
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Oct 2022 11:17:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 973323CAE2D
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Oct 2022 11:17:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADECF3C2830
 for <ltp@lists.linux.it>; Fri,  7 Oct 2022 11:17:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 158761A0021E
 for <ltp@lists.linux.it>; Fri,  7 Oct 2022 11:17:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B521218FF;
 Fri,  7 Oct 2022 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665134228;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=me2PR1EV9osp1dd0US+yoZ5HmIK+E6xPlqHudB4qCt8=;
 b=x/U0DDwXyU0EdKjT6vMQvT/cG2uX2A46gOHMVgsH8r5WcesnWkTWii4J93SXfblEwtNwgL
 tgINBHnVy38lUTCmK+xSvB0aRBqVELoH8mRZsiST3kG0K1T9+bwTsPbGmGVihISUXZcKT7
 SisubsWHO93nTBr1OFqcn+OVSglsNtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665134228;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=me2PR1EV9osp1dd0US+yoZ5HmIK+E6xPlqHudB4qCt8=;
 b=5wN0Td/f6s5rt0ON4i7sdOx5V9ln62I0K2JkS1jbUWKlpxNVR0yrwwAF/Vh/I+IRraXXtN
 Hb3tJpv4CdCJndBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F003213A3D;
 Fri,  7 Oct 2022 09:17:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nWLjOJPuP2OCDQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 07 Oct 2022 09:17:07 +0000
Date: Fri, 7 Oct 2022 11:17:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Yz/ukhT0a+CDb/UB@pevik>
References: <20220617085914.22034-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220617085914.22034-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7] Rewrite aio-stress test using LTP API
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

Hi Andrea,

below are just minor comments about options and doc/help.

> diff --git a/runtest/ltp-aio-stress.part1 b/runtest/ltp-aio-stress.part1
...
> -# aio-stress [-s size] [-r size] [-a size] [-d num] [-b num]
> -#                 [-i num] [-t num] [-c num] [-C size] [-nxhlvOS ]
> -#                 file1 [file2 ...]
> -#       -a size in KB at which to align buffers
> -#       -b max number of iocbs to give io_submit at once
> -#       -c number of io contexts per file
> -#       -C offset between contexts, default 2MB
> -#       -s size in MB of the test file(s), default 1024MB
> -#       -r record size in KB used for each io, default 64KB
> -#       -d number of pending aio requests for each file, default 64
> -#       -i number of ios per file sent before switching
> -#          to the next file, default 8
> -#       -O Use O_DIRECT (not available in 2.4 kernels),
> -#       -S Use O_SYNC for writes
> -#       -o add an operation to the list: write=0, read=1,
> -#          random write=2, random read=3.
> -#          repeat -o to specify multiple ops: -o 0 -o 1 etc.
> -#       -m shm use ipc shared memory for io buffers instead of malloc
> -#       -m shmfs mmap a file in /dev/shm for io buffers
> -#       -n no fsyncs between write stage and read stage
> -#       -l print io_submit latencies after each stage
> -#       -t number of threads to run
> -#       -v verification of bytes written
> -#       -x turn off thread stonewalling
> -#       -h this message
> +# -f       Number of files to generate
> +# -b       Max number of iocbs to give io_submit at once
> +# -c       Number of io contexts per file
> +# -g       Offset between contexts (default 2M)
> +# -s       Size in MB of the test file(s) (default 1024M)
> +# -r       Record size in KB used for each io (default 64K)
> +# -d       Number of pending aio requests for each file (default 64)
> +# -e       Number of I/O per file sent before switching to the next file (default 8)
> +# -a       Total number of ayncs I/O the program will run, default is run until Cntl-C
Could we have -a500 as the default value (and thus remove it from runtest
file)? IMHO it's better that run indefinitely, because it dies with TBROK after 30 sec on timeout.

also could have aio-stress -h sorted output? (easier to read on so many
options).

> +# -O       Use O_DIRECT (not available in 2.4 kernels)
> +# -o       Add an operation to the list: write=0, read=1, random write=2, random read=3
> +# -m       SHM use ipc shared memory for io buffers instead of malloc
> +# -n       No fsyncs between write stage and read stage
> +# -l       Print io_submit latencies after each stage
> +# -L       Print io completion latencies after each stage
> +# -t       Number of threads to run
> +# -u       Unlink files after completion
> +# -v       Verification of bytes written
> +# -x       Turn off thread stonewalling
nit: I'd remove these, IMHO it's not worth to sync this with aio-stress.c.
One can find getopts string in aio-stress.c.

...
> -ADS1050 aio-stress -I500  -o1 -O -r256  -t2   $TMPDIR/junkfile $TMPDIR/file2
> +ADS1000 aio-stress -a500  -o2 -r4 -f1
> +ADS1001 aio-stress -a500  -o2 -r8 -f1
> +ADS1002 aio-stress -a500  -o2 -r16 -f1
nit: s/[ ]+/ /g
(remove duplicate space)

> +++ b/runtest/ltp-aio-stress.part2
Both applies to this runtest level as well.

> --- a/testcases/kernel/io/ltp-aiodio/aio-stress.c
> +++ b/testcases/kernel/io/ltp-aiodio/aio-stress.c
> @@ -1,51 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
I wonder if we can relicense to GPL-2.0-or-later if this is SUSE copyright.
I suppose we can't.
>  /*
>   * Copyright (c) 2004 SuSE, Inc.  All Rights Reserved.
> + *               Written by: Chris Mason <mason@suse.com>
> + * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*\
> + * [Description]
...
> - * io buffers are aligned in case you want to do raw io
> + * aio is done in a rotating loop. First file1.bin gets 8 requests, then
nit: s/io/IO/g s/aio/AIO/g

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
