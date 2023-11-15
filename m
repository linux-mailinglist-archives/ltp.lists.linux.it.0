Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CF7EC360
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Nov 2023 14:15:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFA2F3CE457
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Nov 2023 14:15:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 38D493C88C3
 for <ltp@lists.linux.it>; Wed, 15 Nov 2023 14:15:01 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 997076000EC
 for <ltp@lists.linux.it>; Wed, 15 Nov 2023 14:15:00 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9A3FE228C3;
 Wed, 15 Nov 2023 13:14:59 +0000 (UTC)
Received: from g78 (rpalethorpe.udp.ovpn2.prg.suse.de [10.100.204.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4BF3F2D162;
 Wed, 15 Nov 2023 13:14:59 +0000 (UTC)
References: <20231115130340.14228-1-andrea.cervesato@suse.de>
User-agent: mu4e 1.10.7; emacs 29.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 15 Nov 2023 13:14:47 +0000
Organization: Linux Private Site
In-reply-to: <20231115130340.14228-1-andrea.cervesato@suse.de>
Message-ID: <87v8a39mzx.fsf@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9A3FE228C3
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Fix off-by-one error in pidns05
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

Merged, thanks!

Andrea Cervesato <andrea.cervesato@suse.de> writes:

> From: Andrea Cervesato <andrea.cervesato@suse.com>
>
> Since we count nested processes from zero, we need to check that nested
> level value is not bigger than MAX_DEPTH - 1. This patch also remove
> shared pointer which counts number of levels and replace it with a
> regular scalar value.
>
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/containers/pidns/pidns05.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/testcases/kernel/containers/pidns/pidns05.c b/testcases/kernel/containers/pidns/pidns05.c
> index 0e7739aaa..7843fe7a9 100644
> --- a/testcases/kernel/containers/pidns/pidns05.c
> +++ b/testcases/kernel/containers/pidns/pidns05.c
> @@ -24,7 +24,7 @@ static struct tst_clone_args clone_args = {
>  };
>  static pid_t pid_max;
>  
> -static void child_func(int *level)
> +static void child_func(const int level)
>  {
>  	pid_t cpid, ppid;
>  
> @@ -34,15 +34,13 @@ static void child_func(int *level)
>  	TST_EXP_EQ_LI(cpid, 1);
>  	TST_EXP_EQ_LI(ppid, 0);
>  
> -	if (*level >= MAX_DEPTH) {
> +	if (level >= MAX_DEPTH - 1) {
>  		TST_CHECKPOINT_WAKE(0);
>  		return;
>  	}
>  
> -	(*level)++;
> -
>  	if (!SAFE_CLONE(&clone_args)) {
> -		child_func(level);
> +		child_func(level + 1);
>  		return;
>  	}
>  
> @@ -81,14 +79,13 @@ static void setup(void)
>  static void run(void)
>  {
>  	int i, status, children;
> -	int level = 0;
>  	pid_t pids_new[MAX_DEPTH];
>  	pid_t pids[MAX_DEPTH];
>  	pid_t pid;
>  
>  	pid = SAFE_CLONE(&clone_args);
>  	if (!pid) {
> -		child_func(&level);
> +		child_func(0);
>  		return;
>  	}
>  
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
