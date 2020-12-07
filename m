Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 128962D0E7B
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 11:55:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B42663C629F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 11:55:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1A4F53C26AF
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 11:55:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 747E920097F
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 11:55:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5136AE05;
 Mon,  7 Dec 2020 10:55:11 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7FE651E1325; Mon,  7 Dec 2020 11:55:11 +0100 (CET)
Date: Mon, 7 Dec 2020 11:55:11 +0100
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201207105511.GE28106@quack2.suse.cz>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-4-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204095930.866421-4-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls/fanotify09: Read variable length
 events
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri 04-12-20 11:59:28, Amir Goldstein wrote:
> In preparation of testing events with filename info, teach the
> how to read variable length events and parse the name info.
> 
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  .../kernel/syscalls/fanotify/fanotify09.c     | 88 +++++++++++++------
>  1 file changed, 60 insertions(+), 28 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
> index daeb712d2..7bb901cf3 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -138,42 +138,73 @@ static void cleanup_fanotify_groups(void)
>  }
>  
>  static void event_res(int ttype, int group,
> -		      struct fanotify_event_metadata *event)
> +		      struct fanotify_event_metadata *event,
> +		      const char *filename)
>  {
> -	int len;
> -	sprintf(symlnk, "/proc/self/fd/%d", event->fd);
> -	len = readlink(symlnk, fdpath, sizeof(fdpath));
> -	if (len < 0)
> -		len = 0;
> -	fdpath[len] = 0;
> -	tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d path=%s",
> +	if (event->fd != FAN_NOFD) {
> +		int len = 0;
> +		sprintf(symlnk, "/proc/self/fd/%d", event->fd);
> +		len = readlink(symlnk, fdpath, sizeof(fdpath));
> +		if (len < 0)
> +			len = 0;
> +		fdpath[len] = 0;
> +		filename = fdpath;
> +	}
> +	tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d filename=%s",
>  		group, (unsigned long long)event->mask,
> -		(unsigned)event->pid, event->fd, fdpath);
> +		(unsigned)event->pid, event->fd, filename);
> +}
> +
> +static const char *event_filename(struct fanotify_event_metadata *event)
> +{
> +	struct fanotify_event_info_fid *event_fid;
> +	struct file_handle *file_handle;
> +	const char *filename, *end;
> +
> +	if (event->event_len <= FAN_EVENT_METADATA_LEN)
> +		return "";
> +
> +	event_fid = (struct fanotify_event_info_fid *)(event + 1);
> +	file_handle = (struct file_handle *)event_fid->handle;
> +	filename = (char *)file_handle->f_handle + file_handle->handle_bytes;
> +	end = (char *)event_fid + event_fid->hdr.len;
> +
> +	/* End of event_fid could have name, zero padding, both or none */
> +	return (filename == end) ? "" : filename;
>  }
>  
>  static void verify_event(int group, struct fanotify_event_metadata *event,
> -			 uint32_t expect)
> +			 uint32_t expect, const char *expect_filename)
>  {
> +	const char *filename = event_filename(event);
> +
>  	if (event->mask != expect) {
>  		tst_res(TFAIL, "group %d got event: mask %llx (expected %llx) "
> -			"pid=%u fd=%d", group, (unsigned long long)event->mask,
> +			"pid=%u fd=%d filename=%s", group, (unsigned long long)event->mask,
>  			(unsigned long long)expect,
> -			(unsigned)event->pid, event->fd);
> +			(unsigned)event->pid, event->fd, filename);
>  	} else if (event->pid != getpid()) {
>  		tst_res(TFAIL, "group %d got event: mask %llx pid=%u "
> -			"(expected %u) fd=%d", group,
> +			"(expected %u) fd=%d filename=%s", group,
>  			(unsigned long long)event->mask, (unsigned)event->pid,
> -			(unsigned)getpid(), event->fd);
> +			(unsigned)getpid(), event->fd, filename);
> +	} else if (strcmp(filename, expect_filename)) {
> +		tst_res(TFAIL, "group %d got event: mask %llx pid=%u "
> +			"fd=%d filename='%s' (expected '%s')", group,
> +			(unsigned long long)event->mask, (unsigned)event->pid,
> +			event->fd, filename, expect_filename);
>  	} else {
> -		event_res(TPASS, group, event);
> +		event_res(TPASS, group, event, filename);
>  	}
> +	if (event->fd != FAN_NOFD)
> +		SAFE_CLOSE(event->fd);
>  }
>  
>  static void test_fanotify(unsigned int n)
>  {
>  	int ret, dirfd;
>  	unsigned int i;
> -	struct fanotify_event_metadata *event, *ev;
> +	struct fanotify_event_metadata *event;
>  	struct tcase *tc = &tcases[n];
>  
>  	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> @@ -210,20 +241,21 @@ static void test_fanotify(unsigned int n)
>  			ret, tc->nevents * (int)FAN_EVENT_METADATA_LEN);
>  	}
>  	event = (struct fanotify_event_metadata *)event_buf;
> -	verify_event(0, event, FAN_MODIFY);
> -	if (tc->ondir)
> -		verify_event(0, event + 1, FAN_CLOSE_NOWRITE);
> -	if (ret > tc->nevents * (int)FAN_EVENT_METADATA_LEN) {
> +	verify_event(0, event, FAN_MODIFY, "");
> +	event = FAN_EVENT_NEXT(event, ret);
> +	if (tc->ondir) {
> +		verify_event(0, event, FAN_CLOSE_NOWRITE, "");
> +		event = FAN_EVENT_NEXT(event, ret);
> +	}
> +	if (ret > 0) {
>  		tst_res(TFAIL,
> -			"first group got more than %d events (%d > %d)",
> -			tc->nevents, ret,
> -			tc->nevents * (int)FAN_EVENT_METADATA_LEN);
> +			"first group got more than %d events (%d bytes)",
> +			tc->nevents, ret);
>  	}
>  	/* Close all file descriptors of read events */
> -	for (ev = event; ret >= (int)FAN_EVENT_METADATA_LEN; ev++) {
> -		if (ev->fd != FAN_NOFD)
> -			SAFE_CLOSE(ev->fd);
> -		ret -= (int)FAN_EVENT_METADATA_LEN;
> +	for (; FAN_EVENT_OK(event, ret); FAN_EVENT_NEXT(event, ret)) {
> +		if (event->fd != FAN_NOFD)
> +			SAFE_CLOSE(event->fd);
>  	}
>  
>  	/*
> @@ -233,7 +265,7 @@ static void test_fanotify(unsigned int n)
>  	for (i = 1; i < NUM_GROUPS; i++) {
>  		ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
>  		if (ret > 0) {
> -			event_res(TFAIL, i, event);
> +			event_res(TFAIL, i, event, "");
>  			if (event->fd != FAN_NOFD)
>  				SAFE_CLOSE(event->fd);
>  			continue;
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
