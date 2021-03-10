Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0A0333C9A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:28:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D27213C6A32
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:28:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6F4153C4B91
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:28:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F1767200D4C
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:28:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F2E1AE55;
 Wed, 10 Mar 2021 12:28:06 +0000 (UTC)
Date: Wed, 10 Mar 2021 13:29:50 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YEi7vh9tDZ7hKltx@yuki.lan>
References: <20210309130115.9693-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309130115.9693-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
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
> In many embedded system, we need add tmpfs to filesystem whitelist since
> there is only tmpfs can be used to test.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> 
> ---------------
> v2->v3:
> 1)skipping mkfs for tmpfs gracefully.
> 2)replace sprintf with snprintf.
> 3)remove __func__ in the message
> 4)replace rmdir with SAFE_RMDIR
> ---------------

Minor nits:

This changelog part should be below the "---" line, since that part gets
cut out automatically and the patch subject should have v3 in it's name
(git format-patch -v3 ...).

As for the rest of the patch, it's nearly perfect, I will push it with
minor changes but we need to apply my patchset[1] first so that we can
skip a few tests on tmpfs.

[1] http://patchwork.ozlabs.org/project/ltp/list/?series=233180

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
