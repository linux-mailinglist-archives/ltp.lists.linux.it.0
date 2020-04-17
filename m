Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9529A1AE0A3
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 17:10:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D5AE3C2ADF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 17:10:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 24F453C2AC1
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 17:10:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 77E8A1000DA5
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 17:10:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 382E3AED9;
 Fri, 17 Apr 2020 15:10:32 +0000 (UTC)
Date: Fri, 17 Apr 2020 17:10:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200417151050.GA2491@yuki.lan>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +#define TST_NO_DEFAULT_MAIN
> +#include "ioctl_loop_support.h"
> +#include "tst_test.h"
> +
> +void check_sys_value(char *path, int setvalue)
> +{
> +	int getvalue;
> +
> +	SAFE_FILE_SCANF(path, "%d", &getvalue);
> +	if (setvalue == getvalue)
> +		tst_res(TPASS, "%s value is %d", path, setvalue);
> +	else
> +		tst_res(TFAIL, "%s value expected %d got %d", path, setvalue, getvalue);
> +}
> +
> +void check_sys_string(char *path, char *setmessage)
> +{
> +	char getmessage[1024];
> +
> +	SAFE_FILE_SCANF(path, "%s", getmessage);
> +	if (strcmp(setmessage, getmessage))
> +		tst_res(TFAIL, "%s expected %s got %s", path, setmessage, getmessage);
> +	else
> +		tst_res(TPASS, "%s string is %s", path, getmessage);
> +}

In the end I've renamed and moved these functions into the test library
because the functionality is generic enough and I doubt that these
tests would be the only one using it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
