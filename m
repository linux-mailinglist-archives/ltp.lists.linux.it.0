Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 221543A994F
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:30:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8456C3C5655
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:30:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0CEB3C2E09
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:30:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2B6561000F2D
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:30:08 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D1861FD47;
 Wed, 16 Jun 2021 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623843008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ngg9YSDPetuF+JF5rbU/ONSliSi1EecWDEYGaVgdRt4=;
 b=kGosTl/cBRszInUMrgPLfT8X8jEp8DUBV59EporpGWCqAxajK9R8SW9c3BOs8tLXCpKiYv
 Tm8d1DSere+dwtMiSvgwFRdoPIDtXpHCgW3W7PdAzmeCs76nNpvgvmonqLXW5CuP06Z4rU
 QDQ8WYNvQ4Y5z1YLZ/XvRF5Q2/whdSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623843008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ngg9YSDPetuF+JF5rbU/ONSliSi1EecWDEYGaVgdRt4=;
 b=PcSQxZPgSQPUizLDxTEgFh3e1fhm5R1T4Px2jITMGIpIGD7QLheeLAZncUDW9dcXxf8+i6
 HG9+xXvOXAmg5dCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2D2C7118DD;
 Wed, 16 Jun 2021 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623843008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ngg9YSDPetuF+JF5rbU/ONSliSi1EecWDEYGaVgdRt4=;
 b=kGosTl/cBRszInUMrgPLfT8X8jEp8DUBV59EporpGWCqAxajK9R8SW9c3BOs8tLXCpKiYv
 Tm8d1DSere+dwtMiSvgwFRdoPIDtXpHCgW3W7PdAzmeCs76nNpvgvmonqLXW5CuP06Z4rU
 QDQ8WYNvQ4Y5z1YLZ/XvRF5Q2/whdSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623843008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ngg9YSDPetuF+JF5rbU/ONSliSi1EecWDEYGaVgdRt4=;
 b=PcSQxZPgSQPUizLDxTEgFh3e1fhm5R1T4Px2jITMGIpIGD7QLheeLAZncUDW9dcXxf8+i6
 HG9+xXvOXAmg5dCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id tQveCcDgyWCrcAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 16 Jun 2021 11:30:08 +0000
Date: Wed, 16 Jun 2021 13:04:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMnavJjzrS7B8fgd@yuki>
References: <20210616093606.214856-1-xieziyao@huawei.com>
 <20210616093606.214856-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616093606.214856-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: tst_process_state: Add
 tst_process_release_wait()
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
>  /*
>   * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * Further, this software is distributed without any warranty that it is
> - * free of the rightful claim of any third person regarding infringement
> - * or the like.  Any license provided herein, whether implied or
> - * otherwise, applies only to this software file.  Patent licenses, if
> - * any, provided herein do not apply to combinations of this program with
> - * other software, or any other product whatsoever.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
>   */

First of all changes in license and whitespaces should be in a separate
patch from the newly added functionality.

>  #include <stdio.h>
> @@ -28,9 +12,8 @@
>  #include "test.h"
>  #include "tst_process_state.h"
> 
> -int tst_process_state_wait(const char *file, const int lineno,
> -                            void (*cleanup_fn)(void), pid_t pid,
> -			    const char state, unsigned int msec_timeout)
> +int tst_process_state_wait(const char *file, const int lineno, void (*cleanup_fn)(void),
> +			   pid_t pid, const char state, unsigned int msec_timeout)
>  {
>  	char proc_path[128], cur_state;
>  	unsigned int msecs = 0;
> @@ -39,7 +22,7 @@ int tst_process_state_wait(const char *file, const int lineno,
> 
>  	for (;;) {
>  		safe_file_scanf(file, lineno, cleanup_fn, proc_path,
> -		                "%*i %*s %c", &cur_state);
> +				"%*i %*s %c", &cur_state);
> 
>  		if (state == cur_state)
>  			break;
> @@ -84,3 +67,26 @@ int tst_process_state_wait2(pid_t pid, const char state)
>  		usleep(10000);
>  	}
>  }
> +
> +int tst_process_release_wait(pid_t pid, unsigned int msec_timeout)
> +{
> +	char proc_path[128];
> +	unsigned int msecs = 0;
> +
> +	snprintf(proc_path, sizeof(proc_path), "/proc/%i", pid);
> +
> +	for (;;) {
> +		if (access(proc_path, F_OK))
> +			break;
> +
> +		usleep(1000);
> +		msecs += 1;
> +
> +		if (msec_timeout && msecs >= msec_timeout) {
> +			errno = ETIMEDOUT;
> +			return 0;
> +		}
> +	}
> +
> +	return 1;
> +}

What exactly do we need this for?

When does /proc/$PID ceases to exit? My guess would be that the
directory ceases to exists once the child has been waited() for by a
parent process and we do not need this at all since call to system()
does wait for it's children anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
