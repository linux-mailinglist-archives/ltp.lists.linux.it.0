Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBB3B59B1
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 09:24:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4367B3C6D70
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 09:24:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 98B323C2530
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 09:24:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EF35610007FB
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 09:24:51 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 172922020F;
 Mon, 28 Jun 2021 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624865091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZjsYcwelO4Faj0AiGLAlwZmVCIk61XNhagwaLqcJMO4=;
 b=ilFEbVWcNqzTDaoGw+LGLiTUeCdzmFfEKVorFLfrL2TcAuBUJ1N5YY6Jq3UkR0PSFDFBmn
 6ZMlLnEzwiIcfmXYBEQZFOlcgjmw0e2wnbSOQFq/8PAll/uZut9uYzI4C9WQqTX75mFJit
 LUe0b0vCS9Gg7u1tIFGFDzIDi7J37Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624865091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZjsYcwelO4Faj0AiGLAlwZmVCIk61XNhagwaLqcJMO4=;
 b=WtSBSWCzBgnNJfMm+bRLYmfQyscaIUxed8IS5bE/iCo3N1RFP+7duZut5l6PLwsxWs1q6h
 gU8RFZQ/bpQ4aIBw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5506FA3B90;
 Mon, 28 Jun 2021 07:24:50 +0000 (UTC)
References: <20210628033002.GA1469@andestech.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Leo Liang <ycliang@andestech.com>
In-reply-to: <20210628033002.GA1469@andestech.com>
Date: Mon, 28 Jun 2021 08:24:49 +0100
Message-ID: <8735t24fjy.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: richiejp@f-m.fm, metan@ucw.cz, ltp@lists.linux.it, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Leo Liang <ycliang@andestech.com> writes:

> From a151d48235629a125d5db57dd76c96fd951d5293 Mon Sep 17 00:00:00 2001
> From: Leo Yu-Chi Liang <ycliang@andestech.com>
> Date: Mon, 28 Jun 2021 11:05:54 +0800
> Subject: [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount failure
>
> The test sequence
> 	mount -t cgroup -o <controllers> <path>
> 	mkdir <path>/<dir>
> 	rmdir <path>/<dir>
> 	umount <path>
> 	mount -t cgroup -o <controllers> <path>
> would easily fail at the last mount with -EBUSY.
>
> The reason is that this test sequence have the chance of
> missing a release code path when doing rmdir and umount.
>
> Add sync between every "rmdir, umount" pair to fix the problem.
>
> Fixes: #839
>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
