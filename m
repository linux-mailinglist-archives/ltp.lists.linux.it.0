Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED43333A0F
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 11:32:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E559F3C4BED
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 11:32:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 80A113C063A
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 11:32:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2F3661000F40
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 11:32:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78986AE42;
 Wed, 10 Mar 2021 10:32:28 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:32:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <YEigO2gryF1Kp6Gq@pevik>
References: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Use anonymous .resource_files for
 docparse
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

Hi,

> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> -static const char *const resource_files[] = {
> -	TEST_APP,
> -	NULL,
> -};
> -
>  static struct tst_test test = {
>  	.test_all = verify_creat,
>  	.needs_checkpoints = 1,
>  	.forks_child = 1,
> -	.resource_files = resource_files,
> +	.resource_files = (const char *const []) {
> +		TEST_APP,
Don't we want to drop TEST_APP definition and use file directly?
Having TEST_APP does not say much.
Not sure how far we should go with moving everything into inline anonymous
definitions (it'd be nice if docparse was able to just expand macros, but that
would be way too slow).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
