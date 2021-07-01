Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD423B8D81
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:51:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14D693C8613
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:51:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18A5D3C6B01
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:51:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AA83C601A18
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:51:04 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1CF8821DBC;
 Thu,  1 Jul 2021 05:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625118664;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=stzNH5jBEuIQtJeZLbZKJxwK3/hBVuV4MX5QnnkFrCI=;
 b=u9T5OFfWNuurJGTxnhd85hDVzsQu3l+B/zMXKF/Ktvw4TWbV9BeL0KsX9MHHd4WMzVj4eP
 o9q3kDBC912s5kSIetsvX0SCf0wcr5/Is0mZRdl9ojyQPOQZcHdL3bVF3p6p/ww0mUqrqi
 LrHqZLqU6O8dsoIKP4EVMqodwI7vJAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625118664;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=stzNH5jBEuIQtJeZLbZKJxwK3/hBVuV4MX5QnnkFrCI=;
 b=deYzztirlrvvJQcKBwAypRrNhz5KGscnyMEG+exiWbqrn6vCSneEAKwwimHzpzHsEvCxIm
 Badqj6s4I2ckcXCQ==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 99822A3B85;
 Thu,  1 Jul 2021 05:51:03 +0000 (UTC)
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
 <20210701050314.1005067-3-petr.vorel@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <petr.vorel@gmail.com>
In-reply-to: <20210701050314.1005067-3-petr.vorel@gmail.com>
Date: Thu, 01 Jul 2021 06:51:02 +0100
Message-ID: <87im1u37ll.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/tests: Rename test to tst_fuzzy_sync03.c
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

Petr Vorel <petr.vorel@gmail.com> writes:

> From: Petr Vorel <pvorel@suse.cz>
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

> ---
>  lib/newlib_tests/.gitignore                       | 2 +-
>  lib/newlib_tests/Makefile                         | 4 ++--
>  lib/newlib_tests/{test16.c => tst_fuzzy_sync03.c} | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename lib/newlib_tests/{test16.c => tst_fuzzy_sync03.c} (100%)
>
> diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
> index 9f53bbb99..b51f6a679 100644
> --- a/lib/newlib_tests/.gitignore
> +++ b/lib/newlib_tests/.gitignore
> @@ -13,7 +13,6 @@ test12
>  test13
>  test14
>  test15
> -test16
>  tst_capability01
>  tst_capability02
>  tst_cgroup01
> @@ -44,3 +43,4 @@ test_macros03
>  test_macros04
>  tst_fuzzy_sync01
>  tst_fuzzy_sync02
> +tst_fuzzy_sync03
> diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
> index 5bd68e95e..1fbf7649a 100644
> --- a/lib/newlib_tests/Makefile
> +++ b/lib/newlib_tests/Makefile
> @@ -6,8 +6,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
>  CFLAGS			+= -W -Wall
>  LDLIBS			+= -lltp
>  
> -test08 test09 test15 test16 tst_fuzzy_sync01 tst_fuzzy_sync02: CFLAGS += -pthread
> -test16 tst_expiration_timer: LDLIBS += -lrt
> +test08 test09 test15 tst_fuzzy_sync01 tst_fuzzy_sync02 tst_fuzzy_sync03: CFLAGS += -pthread
> +tst_expiration_timer tst_fuzzy_sync03: LDLIBS += -lrt
>  
>  ifeq ($(ANDROID),1)
>  FILTER_OUT_MAKE_TARGETS	+= test08
> diff --git a/lib/newlib_tests/test16.c b/lib/newlib_tests/tst_fuzzy_sync03.c
> similarity index 100%
> rename from lib/newlib_tests/test16.c
> rename to lib/newlib_tests/tst_fuzzy_sync03.c


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
