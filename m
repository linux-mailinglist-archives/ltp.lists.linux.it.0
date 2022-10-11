Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683C5FB04B
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Oct 2022 12:19:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A72053CAE93
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Oct 2022 12:19:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 382043C075E
 for <ltp@lists.linux.it>; Tue, 11 Oct 2022 12:19:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A8ECD10008F0
 for <ltp@lists.linux.it>; Tue, 11 Oct 2022 12:19:25 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B7A4121A5D;
 Tue, 11 Oct 2022 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665483564;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gD/QrpyPMdMCpyXqc7HColYlF4RiCg42DWB6xAALbZE=;
 b=tbdmw5duzRoubteoU2kPjK10oQ1RibW0/X4F08NuYnErqFyjnpS7KtkyqaRDM0bKHrwVLu
 xRZ7QdW/mrRXDNC5C2Y5tnF43KyrcxNIAHDJFF72IX3F/wMW4KAD1ME8OB1YjfvKKW2DWW
 RBNV9A/TMGb1gYq9H/TqyOuRs8vCMOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665483564;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gD/QrpyPMdMCpyXqc7HColYlF4RiCg42DWB6xAALbZE=;
 b=BzHAOiNVixBZcQZoLKZKaPmc558Ce2IZChmbXUBUS/XHWMBxBFn7z1T/Nfl6HU4ymcW47D
 p6fCDxtdfdRqvKBw==
Received: from g78 (unknown [10.100.228.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0B2FD2C141;
 Tue, 11 Oct 2022 10:19:23 +0000 (UTC)
References: <20220722120501.28670-1-andrea.cervesato@suse.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 11 Oct 2022 11:15:24 +0100
In-reply-to: <20220722120501.28670-1-andrea.cervesato@suse.com>
Message-ID: <87mta27jdh.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/7] Refactor mqns testing suite
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

Hello,

Andrea Cervesato via ltp <ltp@lists.linux.it> writes:

> mqns testing suite has been refactored using new LTP API

It would be easier to just submit one test for review and iterate on
it. This follows the principal of breaking work down into the smallest
chunk practically possible.

Sometimes submitting a large patchset is unavoidable, but this is not
the case here.

I'm setting all of these to "changes requested".

>
> Andrea Cervesato (7):
>   Add more safe macros for mqueue API
>   Refactor mqns_01 using new LTP API
>   Refactor mqns_02 using new LTP API
>   Refactor mqns_03 using new LTP API
>   Refactor mqns_04 using new LTP API
>   Delete deprecated mqns header files
>   Rename common.h into mqns.h for mqns suite
>
>  include/tst_safe_posix_ipc.h                  |  45 +++
>  runtest/containers                            |  12 +-
>  testcases/kernel/containers/mqns/Makefile     |  27 +-
>  testcases/kernel/containers/mqns/mqns.h       | 108 ++++++-
>  testcases/kernel/containers/mqns/mqns_01.c    | 185 ++++--------
>  testcases/kernel/containers/mqns/mqns_02.c    | 217 ++++----------
>  testcases/kernel/containers/mqns/mqns_03.c    | 269 +++++++-----------
>  testcases/kernel/containers/mqns/mqns_04.c    | 263 ++++++++---------
>  .../kernel/containers/mqns/mqns_helper.h      |  56 ----
>  9 files changed, 485 insertions(+), 697 deletions(-)
>  delete mode 100644 testcases/kernel/containers/mqns/mqns_helper.h
>
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
