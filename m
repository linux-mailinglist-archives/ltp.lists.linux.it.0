Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A5243B44
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 16:10:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4EE53C30C6
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 16:10:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0BD873C2497
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 16:10:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6E2091A00705
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 16:10:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E35CB1D1;
 Thu, 13 Aug 2020 14:11:04 +0000 (UTC)
Date: Thu, 13 Aug 2020 16:11:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200813141104.GE13292@yuki.lan>
References: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595230227-21468-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595230227-21468-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/3] syscalls/msgrcv07: Add different msgtyp
 test
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
> diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> index 39fbdb67a..9b04fd2ac 100644
> --- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> @@ -3,7 +3,8 @@
>   * Copyright (c) 2014-2020 Fujitsu Ltd.
>   * Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
>   *
> - * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR
> + * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR and different
> + * msg_typ(zero,positive,negative).
>   */
>  
>  #define  _GNU_SOURCE
> @@ -22,15 +23,20 @@ static int queue_id = -1;
>  static struct buf {
>  	long type;
>  	char mtext[MSGSIZE];
> -} rcv_buf, snd_buf[2] = {
> +} rcv_buf, snd_buf[3] = {
>  	{MSGTYPE1, MSG1},
> -	{MSGTYPE2, MSG2}
> +	{MSGTYPE2, MSG2},
>  };

This is a bit useless change.

>  static void test_msg_except(void);
>  static void test_msg_noerror(void);
> +static void test_zero_msgtyp(void);
> +static void test_positive_msgtyp(void);
> +static void test_negative_msgtyp(void);
>  static void cleanup(void);
> -static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror};
> +static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror,
> +				   test_zero_msgtyp, test_positive_msgtyp,
> +				   test_negative_msgtyp};
>  
>  static void verify_msgcrv(unsigned int n)
>  {
> @@ -81,6 +87,73 @@ static void test_msg_noerror(void)
>  	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
>  }
>  
> +static void test_zero_msgtyp(void)
> +{
> +	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
> +	SAFE_MSGSND(queue_id, &snd_buf[0], MSGSIZE, 0);
> +	SAFE_MSGSND(queue_id, &snd_buf[1], MSGSIZE, 0);
> +	memset(&rcv_buf, 0, sizeof(rcv_buf));

This init is common for all of these tests, I guess that it would be
easier to put this piece of code into a function called prepare_queue()
so that we do not have to repeat it all over.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
