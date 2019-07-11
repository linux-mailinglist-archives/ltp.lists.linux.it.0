Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67623656FD
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 14:34:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 219273C1C93
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 14:34:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0B98F3C0374
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 14:34:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DEC561000A8C
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 14:34:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA1F7AD14;
 Thu, 11 Jul 2019 12:34:42 +0000 (UTC)
Date: Thu, 11 Jul 2019 14:34:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190711123441.GA8709@rei>
References: <20190705051603.24599-1-liwang@redhat.com>
 <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3.1] lib: add tst_no_corefile()
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
Cc: liwan@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +void tst_no_corefile(int verbose)
> +{
> +	struct rlimit new_r, old_r;
> +
> +	SAFE_GETRLIMIT(RLIMIT_CORE, &old_r);
> +	if (old_r.rlim_max >= 1 || geteuid() == 0) {
> +		/*
> +		 * 1 is a special value, that disables core-to-pipe.
> +		 * At the same time it is small enough value for
> +		 * core-to-file, so it skips creating cores as well.
> +		 */
> +		new_r.rlim_cur = 1;
> +		new_r.rlim_max = 1;
> +		SAFE_SETRLIMIT(RLIMIT_CORE, &new_r);
> +	}
> +
> +	if (verbose)
> +		tst_res(TINFO, "Avoid dumping corefile for process(pid=%d)", getpid());

Should we print the message here only

	if (old_r.rlim_max <= 1 || geteuid() == 0)

because otherwise we will print the mesasge even in cases that the
corefile is not in fact limited.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
