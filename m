Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510E3CFAF2
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:44:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F34DE3C981F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:44:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D13ED3C81AC
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:44:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DF6516009EC
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:44:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D70A22476;
 Tue, 20 Jul 2021 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626788668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5YmBt4AjjyngRtqs8DErnKvuQtdGLJ3G+s23BL0OnvM=;
 b=P0WP10DSf7aECX6N3PJIhlm9JVDVourfrobUw/cKNgflEVeJrQTXNpbdQ1ggNit9A/ml4P
 p7kzT5iubtrEhAvapBIv2QPRR5+ZFRipjKsPU9q5Nn2RtJHeJYA1QGzMaeRgDU5TOJLi+7
 hv3jaE1mTkxhimkpNThKwHc36oIi3nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626788668;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5YmBt4AjjyngRtqs8DErnKvuQtdGLJ3G+s23BL0OnvM=;
 b=mh2d9T2ciXZLrACWL4o5cciSWTyLQ0Z0r2Nxwd0jqi4itlg1QEnH5FjDOIQoSlk7F+Df8a
 NdC/IUO5+23oXcAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F75713D70;
 Tue, 20 Jul 2021 13:44:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8rS8BTzT9mC3AQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 20 Jul 2021 13:44:28 +0000
Date: Tue, 20 Jul 2021 15:18:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YPbNQ4AebDiUMxVz@yuki>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls/sched_*: convert to new API and
 handle ENOSYS errno
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The patch-set introduced new tst_sched_* wrappers to handle ENOSYS
> error that can be returned by libc (musl [1]). In that particular
> case the wrapper uses syscall directly to test the kernel anyway.

Can't we use the test_variants to test both the kernel and libc calls
instead?

> [1]: https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5
> 
> Alexey Kodanev (16):
>   lib/tst_sched: add ltp tst_sched_*()
>   syscalls/sched_getparam01: use tst_sched_*()
>   syscalls/sched_getparam03: use tst_sched_*()
>   syscalls/sched_setparam01: convert to new API
>   syscalls/sched_setparam02: convert to new API
>   syscalls/sched_setparam03: convert to new API
>   syscalls/sched_setparam04: convert to new API
>   syscalls/sched_setparam05: convert to new API
>   syscalls/sched_rr_get_interval01: use tst_sched_*()
>   syscalls/sched_rr_get_interval02: use tst_sched_*()
>   syscalls/sched_rr_get_interval03: use tst_sched_*()
>   syscalls/sched_setscheduler01: convert to new API
>   syscalls/sched_setscheduler02: convert to new API
>   syscalls/sched_setscheduler03: use tst_sched_*()
>   syscalls/sched_getscheduler01: convert to new API
>   syscalls/sched_getscheduler02: convert to new API
> 
>  include/tst_sched.h                           |  16 ++
>  lib/tst_sched.c                               |  36 +++
>  .../sched_getparam/sched_getparam01.c         |   6 +-
>  .../sched_getparam/sched_getparam03.c         |   4 +-
>  .../sched_getscheduler/sched_getscheduler01.c | 141 +++---------
>  .../sched_getscheduler/sched_getscheduler02.c | 104 ++-------
>  .../sched_rr_get_interval01.c                 |   4 +-
>  .../sched_rr_get_interval02.c                 |   4 +-
>  .../sched_rr_get_interval03.c                 |   4 +-
>  .../sched_setparam/sched_setparam01.c         | 135 ++---------
>  .../sched_setparam/sched_setparam02.c         | 195 +++-------------
>  .../sched_setparam/sched_setparam03.c         | 215 ++++--------------
>  .../sched_setparam/sched_setparam04.c         | 161 +++----------
>  .../sched_setparam/sched_setparam05.c         | 186 +++------------
>  .../sched_setscheduler/sched_setscheduler01.c | 171 ++++----------
>  .../sched_setscheduler/sched_setscheduler02.c | 154 +++----------
>  .../sched_setscheduler/sched_setscheduler03.c |  10 +-
>  17 files changed, 345 insertions(+), 1201 deletions(-)
>  create mode 100644 include/tst_sched.h
>  create mode 100644 lib/tst_sched.c
> 
> -- 
> 2.25.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
