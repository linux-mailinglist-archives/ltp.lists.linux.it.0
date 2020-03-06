Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B41417BDD8
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:10:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76AA73C63D0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:10:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0C2393C1D97
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:10:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 63AB914013B2
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:10:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94807AEF5;
 Fri,  6 Mar 2020 13:10:48 +0000 (UTC)
Date: Fri, 6 Mar 2020 14:10:47 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200306131046.GC3375@rei.lan>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 04/10] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> +			MOVE_MOUNT_F_EMPTY_PATH));
> +
> +	SAFE_CLOSE(fsmfd);
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TERRNO, "move_mount() failed");
> +		goto out;
> +	}
> +
> +	if (tst_is_mounted(MNTPOINT))
> +		tst_res(TPASS, "%s: fsopen() passed", tc->name);
> +
> +	SAFE_UMOUNT(MNTPOINT);

I gues sthat the SAFE_UMOUNT() should be inside of the if here and in
the rest of the testcases.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
