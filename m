Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADA13E2768
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 11:37:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D21D3CA3EF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 11:37:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E63463C5FD4
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 11:37:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D2124201097
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 11:37:29 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2A9C2240C;
 Fri,  6 Aug 2021 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628242648;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ClNH0mDtFQ0HGxY1jwX11jdWeJjg49yvNxCS24k4nM=;
 b=1CD84kOHMu4J4hlXyLwM5Rhf+z5k9UHDFpanOV2NBdb+DbnlCJ3Zd4OF93KiUmLjX/pqDi
 iqYgdndOy1laYbm9HqnEq0lwrJsy0vzThyhcRwfWCaOIlXDriKONcxrDJ880WeyeciszWg
 r8tlIRZDVM77ZRiaYc4UjcbSLQrPY7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628242648;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ClNH0mDtFQ0HGxY1jwX11jdWeJjg49yvNxCS24k4nM=;
 b=zdQ1vA2jn/TVbgEs/dV/vQVYUzKGelN4XKb896v+UL1+FJLDl1YoxhwakAoYjndWUytUl8
 kKhKwaf7q9r59pBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7149E1399D;
 Fri,  6 Aug 2021 09:37:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RGqsGdgCDWFhPQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 06 Aug 2021 09:37:28 +0000
Date: Fri, 6 Aug 2021 11:37:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YQ0C1givEZ8/H7hN@pevik>
References: <20210806025659.1962902-1-liwang@redhat.com>
 <YQzLUUKbLcoJjRVb@pevik> <YQzOxg35JjpDOj7X@pevik>
 <CAEemH2cNk-L1kRRHy=vvLVjcEm0HPQXaz8fJR00M1TyzoJAynw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cNk-L1kRRHy=vvLVjcEm0HPQXaz8fJR00M1TyzoJAynw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Hi Petr,



> > > > See:
> > https://www.mail-archive.com/netdev@vger.kernel.org/msg132711.html

> > > Thanks for fixing it, it's not a first time we got hit by this.
> > > I wonder where <linux/in.h> is included. It's not directly in
> > setsockopt08.c,
> > > it must be in our lapi header. But it's not in tst_safe_net.h, not in
> > > safe_net_fn.h nor in tst_net.h and both actually include <netinet/in.h>,
> > thus it must be
> > > before. But there is only tst_test.h.

> > > I'm asking because it'd be better to add <netinet/in.h> into header
> > before
> > > <linux/in.h>.

> > OK, it's in lapi/ip_tables.h, which includes
> > <linux/netfilter_ipv4/ip_tables.h>
> > which includes <linux/if.h>. But I wonder why inclusion of <netinet/in.h>
> > from


> No, it's not caused by the lapi/ip_tables.h which finally includes
> <linux/if.h>.
> See experiment commit:
> https://github.com/wangli5665/ltp/commit/f1a37712c63472b19d3355446fb66e651b4a186e
Yep, I also found myself it does not help.

> The conflict happened early in tst_test.h and I guess some header files
> between line#14 to line#44 probably involves <linux/if.h>, but I'm not sure
> which one is the culprit.
Interesting, really something in in tst_test.h with combination of
lapi/ip_tables.h. This combination is only in 2 tests, setsockopt0{3,8}.c,
setsockopt03.c already had <netinet/in.h>.

> If we simply put the <netinet/in.h> at the top of tst_test.h, the
> conflict disappears
> as well.
> See experiment commit:
> https://github.com/wangli5665/ltp/commit/0155df479811d9a51f30e09accb330238607f73d

I'd be for adding it there, with comment why it's there. We can prevent problems
with failing another test in the future. (+ remove it from both tests).

Kind regards,
Petr

> $ cat include/tst_test.h  -n
> ...
>     14 #include <unistd.h>
>     15 #include <limits.h>
>     16 #include <string.h>
>     17 #include <errno.h>
>     18
>     19 #include "tst_common.h"
>     20 #include "tst_res_flags.h"
>     21 #include "tst_test_macros.h"
>     22 #include "tst_checkpoint.h"
>     23 #include "tst_device.h"
>     24 #include "tst_mkfs.h"
>     25 #include "tst_fs.h"
>     26 #include "tst_pid.h"
>     27 #include "tst_cmd.h"
>     28 #include "tst_cpu.h"
>     29 #include "tst_process_state.h"
>     30 #include "tst_atomic.h"
>     31 #include "tst_kvercmp.h"
>     32 #include "tst_kernel.h"
>     33 #include "tst_minmax.h"
>     34 #include "tst_get_bad_addr.h"
>     35 #include "tst_path_has_mnt_flags.h"
>     36 #include "tst_sys_conf.h"
>     37 #include "tst_coredump.h"
>     38 #include "tst_buffers.h"
>     39 #include "tst_capability.h"
>     40 #include "tst_hugepage.h"
>     41 #include "tst_assert.h"
>     42 #include "tst_lockdown.h"
>     43 #include "tst_fips.h"
>     44 #include "tst_taint.h"
> ...
>     93 #include "tst_safe_macros.h"
>     94 #include "tst_safe_file_ops.h"
>     95 #include "tst_safe_net.h"    <===== includes the <netinet/in.h> here
>     96 #include "tst_clone.h"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
