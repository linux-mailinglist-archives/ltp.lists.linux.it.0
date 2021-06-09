Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C460E3A180E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:54:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 663B23C9073
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:54:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E32EF3C7AE0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:54:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 59030200FEE
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:54:55 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C56371FD5E;
 Wed,  9 Jun 2021 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623250494;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TuZm0tbGu7zqDnv/6gMuSj7IBeRmh4ZXudiSjIjbVtI=;
 b=tWZsqe7V+8z5JGyM0asdCb+Dtt3x1ykbdiTcOUPzMuLXgidVEE2MC/q0gnwl+ImiwA3Weg
 vxC7ExGpFJUqrslEW8j5nVaOszyY3wjxale8ymfoQYFkrYfzFy0UB5PgFMvR8AZRZ//fzD
 KoWU9kd4OajxJjA/svmuVEE/c4YVGa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623250494;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TuZm0tbGu7zqDnv/6gMuSj7IBeRmh4ZXudiSjIjbVtI=;
 b=2fdjXwT8BiYDKI86tMdHBb4Hrz9gGBqhTZZ6DkMvto5vlblyxCXPMFBK5QUnNTIoRrX3BV
 dXDJy1cng0JHrjBw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 86410A3B81;
 Wed,  9 Jun 2021 14:54:54 +0000 (UTC)
References: <20210609114659.2445-1-chrubis@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20210609114659.2445-1-chrubis@suse.cz>
Date: Wed, 09 Jun 2021 15:54:54 +0100
Message-ID: <87zgvz3x6p.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] Introduce a concept of test runtime cap
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Cyril,

Cyril Hrubis <chrubis@suse.cz> writes:

> Recently we had a problem with tests that use .all_filesystems and
> tst_timeout_remaining().
>
> The problem is that the tst_timeout_remaining() function wasn't aware of
> the loop over fork_testrun() that executes a testrun for each supported
> filesystem, which caused such test, e.g. writev03, to run for
> unpredictable and long periods.
>
> This is an attempt how to solve this properly by uncoupling timeouts
> from test runtime so that test never runs for longer than its timeout.
>
> Cyril Hrubis (4):
>   lib: tst_supported_fs_types: Add tst_fs_max_types()
>   lib: tst_test: Move timeout scaling out of fork_testrun()
>   lib: Introduce concept of max_test_runtime
>   syscalls/writev03: Adjust test runtime
>
>  include/tst_fs.h                              |  5 ++
>  include/tst_fuzzy_sync.h                      |  4 +-
>  include/tst_test.h                            |  7 +-
>  lib/newlib_tests/.gitignore                   |  3 +-
>  .../{test18.c => test_runtime01.c}            |  7 +-
>  lib/newlib_tests/test_runtime02.c             | 31 +++++++
>  lib/tst_supported_fs_types.c                  |  5 ++
>  lib/tst_test.c                                | 87 ++++++++++++++++---
>  testcases/kernel/crypto/af_alg02.c            |  2 +-
>  testcases/kernel/crypto/pcrypt_aead01.c       |  2 +-
>  testcases/kernel/mem/mtest01/mtest01.c        |  6 +-
>  testcases/kernel/mem/mtest06/mmap1.c          | 13 ++-
>  .../kernel/syscalls/move_pages/move_pages12.c |  4 +-
>  testcases/kernel/syscalls/writev/writev03.c   |  1 +
>  14 files changed, 141 insertions(+), 36 deletions(-)
>  rename lib/newlib_tests/{test18.c => test_runtime01.c} (59%)
>  create mode 100644 lib/newlib_tests/test_runtime02.c
>
> -- 
> 2.31.1

The changes generally look good. I think the new environment variable
needs documenting in the user guide though.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
