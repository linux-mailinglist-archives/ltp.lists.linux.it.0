Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B90DA6B9E
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:35:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA3F73C2107
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:35:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CFE943C20BA
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:35:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C53B9200972
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:35:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18C08ABC4;
 Tue,  3 Sep 2019 14:35:14 +0000 (UTC)
Date: Tue, 3 Sep 2019 16:35:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
Message-ID: <20190903143513.GA14511@rei.lan>
References: <1567514890-1216-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <1567514890-1216-2-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567514890-1216-2-git-send-email-huangjh.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] uevents/uevent03.c: Check if "UI_GET_SYSNAME"
 is supported
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
> Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/uevents/uevent03.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/uevents/uevent03.c b/testcases/kernel/uevents/uevent03.c
> index 9b901dc..f676984 100644
> --- a/testcases/kernel/uevents/uevent03.c
> +++ b/testcases/kernel/uevents/uevent03.c
> @@ -52,7 +52,7 @@ static void get_minor_major(char *device, char *minor, char *major, size_t buf_s
>  
>  static void verify_uevent(void)
>  {
> -	int pid, fd;
> +	int pid, fd, ret;
>  	char sysname[64];
>  	char add_msg[1024];
>  	char rem_msg[1024];
> @@ -167,7 +167,18 @@ static void verify_uevent(void)
>  
>  	create_uinput_mouse();
>  
> -	SAFE_IOCTL(mouse_fd, UI_GET_SYSNAME(sizeof(sysname)), sysname);
> +	ret = ioctl(mouse_fd, UI_GET_SYSNAME(sizeof(sysname)), sysname);
> +	if (ret < 0) {
> +		if (errno == EINVAL) {
> +			tst_brk(TCONF,
> +				"kernel does not support UI_GET_SYSNAME");
> +		} else {
> +			tst_brk(TBROK,
> +				"ioctl(%d, %s,...) failed",
> +				mouse_fd, "UI_GET_SYSNAME");
> +		}
> +	}

I do wonder if it makes sense to add a fallback that reads the sysname
from /proc/bus/input/devices.

We do have the sysname as the last component of the SysFs= path.

I guess that it's probably not worth of the effort.

>  	handlers = get_input_handlers();
>  
>  	tst_res(TINFO, "Sysname: %s", sysname);
> -- 
> 1.8.3.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
