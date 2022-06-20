Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC10552051
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jun 2022 17:20:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69BFB3C927B
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jun 2022 17:20:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E3113C921A
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 17:20:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5C05E600472
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 17:20:35 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8C9FF21B5E;
 Mon, 20 Jun 2022 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655738435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1zPdh5E1gKZAX5b4pgNi2zqh83k3bJdnRww8BjG2VbA=;
 b=yRIND9fvQu1vEMdHWq5RQTVtzAbYoP7/uvlO+R+vB+Tw+CqvCXikFFdZag0nVMB6XT93TF
 4DmgnBuJPFDQoyACOkJMgcPMefg0VuVHfIg7lq2xFIU4IJHfOTbxpJpI/nwoArco77knr+
 /Zvqigh13Luo6mOaii0FFLMUlIGyewI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655738435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1zPdh5E1gKZAX5b4pgNi2zqh83k3bJdnRww8BjG2VbA=;
 b=FtQRb/ogUrLLw2j/RkSuWwnrLq0L0DbtaJ0aRSUfVbltTw+hDP5TIXFbSiJo3NBH0OlHOX
 fwaf7+LMQhjOJHCQ==
Received: from quack3.suse.cz (unknown [10.100.224.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7466D2C141;
 Mon, 20 Jun 2022 15:20:35 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id ABBADA0636; Mon, 20 Jun 2022 17:20:32 +0200 (CEST)
Date: Mon, 20 Jun 2022 17:20:32 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20220620152032.jbrhicuscem2f4kd@quack3.lan>
References: <20220620132737.2015073-1-amir73il@gmail.com>
 <20220620132737.2015073-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220620132737.2015073-5-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/fanotify09: Add test cases for merge
 of ignore mask
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it,
 Matthew Bobrowski <repnop@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon 20-06-22 16:27:37, Amir Goldstein wrote:
> 1. Verify that an ignore mask that does not survive modify event,
>    does survive a modify event on child, if parent is not watching
>    events on children.
> 
> 2. Verify that an ignore mask on parent does not ignore close events
>    sent to mount mark, if parent is not watching events on children.
> 
> The behavior of these corner cases of ignore mask on parent dir have
> always been undefined, so do not run the test for kernel < v5.19.
> 
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Hum, I was looking into the testcase. What does generate a modify event
there and checks that ignore mask does not survive it?

								Honza

> ---
>  .../kernel/syscalls/fanotify/fanotify09.c     | 72 +++++++++++++++++--
>  1 file changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
> index 070ad9933..0eb83e2f8 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -27,6 +27,11 @@
>   * Test case #5 is a regression test for commit:
>   *
>   *      7372e79c9eb9 fanotify: fix logic of reporting name info with watched parent
> + *
> + * Test cases #6-#7 are regression tests for commit:
> + * (from v5.19, unlikely to be backported thus not in .tags):
> + *
> + *      e730558adffb fanotify: consistent behavior for parent not watching children
>   */
>  
>  #define _GNU_SOURCE
> @@ -73,6 +78,7 @@ static struct tcase {
>  	const char *tname;
>  	struct fanotify_mark_type mark;
>  	unsigned int ondir;
> +	unsigned int ignore;
>  	unsigned int report_name;
>  	const char *close_nowrite;
>  	int nevents;
> @@ -83,6 +89,7 @@ static struct tcase {
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		0,
>  		0,
> +		0,
>  		DIR_NAME,
>  		1, 0,
>  	},
> @@ -91,6 +98,7 @@ static struct tcase {
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		FAN_ONDIR,
>  		0,
> +		0,
>  		DIR_NAME,
>  		2, 0,
>  	},
> @@ -99,6 +107,7 @@ static struct tcase {
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		FAN_ONDIR,
>  		0,
> +		0,
>  		".",
>  		2, 0
>  	},
> @@ -107,6 +116,7 @@ static struct tcase {
>  		INIT_FANOTIFY_MARK_TYPE(INODE),
>  		FAN_ONDIR,
>  		0,
> +		0,
>  		DIR_NAME,
>  		2, 0,
>  	},
> @@ -115,6 +125,7 @@ static struct tcase {
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		0,
>  		0,
> +		0,
>  		FILE2_NAME,
>  		2, FAN_CLOSE_NOWRITE,
>  	},
> @@ -122,10 +133,29 @@ static struct tcase {
>  		"Events on non-dir child with both parent and mount marks and filename info",
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		0,
> +		0,
>  		FAN_REPORT_DFID_NAME,
>  		FILE2_NAME,
>  		2, FAN_CLOSE_NOWRITE,
>  	},
> +	{
> +		"Events on non-dir child with ignore mask on parent",
> +		INIT_FANOTIFY_MARK_TYPE(MOUNT),
> +		0,
> +		FAN_MARK_IGNORED_MASK,
> +		0,
> +		DIR_NAME,
> +		1, 0,
> +	},
> +	{
> +		"Events on non-dir children with surviving ignore mask on parent",
> +		INIT_FANOTIFY_MARK_TYPE(MOUNT),
> +		0,
> +		FAN_MARK_IGNORED_MASK | FAN_MARK_IGNORED_SURV_MODIFY,
> +		0,
> +		FILE2_NAME,
> +		2, FAN_CLOSE_NOWRITE,
> +	},
>  };
>  
>  static void create_fanotify_groups(struct tcase *tc)
> @@ -140,13 +170,14 @@ static void create_fanotify_groups(struct tcase *tc)
>  		 */
>  		unsigned int report_name = tc->report_name;
>  		unsigned int mask_flags = tc->ondir | FAN_EVENT_ON_CHILD;
> -		unsigned int parent_mask;
> +		unsigned int parent_mask, ignore = 0;
>  
>  		/*
>  		 * The non-first groups do not request events on children and
> -		 * subdirs.
> +		 * subdirs and may set an ignore mask on parent dir.
>  		 */
>  		if (i > 0) {
> +			ignore = tc->ignore;
>  			report_name = 0;
>  			mask_flags = 0;
>  		}
> @@ -168,10 +199,15 @@ static void create_fanotify_groups(struct tcase *tc)
>  		 * but only the first group requests events on child.
>  		 * The one mark with FAN_EVENT_ON_CHILD is needed for
>  		 * setting the DCACHE_FSNOTIFY_PARENT_WATCHED dentry flag.
> +		 *
> +		 * The inode mark on non-first group is either with FAN_MODIFY
> +		 * in mask or FAN_CLOSE_NOWRITE in ignore mask. In either case,
> +		 * it is not expected to get the modify event on a child, nor
> +		 * the close event on dir.
>  		 */
>  		parent_mask = FAN_MODIFY | tc->ondir | mask_flags;
> -		SAFE_FANOTIFY_MARK(fd_notify[i], FAN_MARK_ADD,
> -				    parent_mask,
> +		SAFE_FANOTIFY_MARK(fd_notify[i], FAN_MARK_ADD | ignore,
> +				    ignore ? FAN_CLOSE_NOWRITE : parent_mask,
>  				    AT_FDCWD, ".");
>  	}
>  }
> @@ -186,6 +222,21 @@ static void cleanup_fanotify_groups(void)
>  	}
>  }
>  
> +static void check_ignore_mask(int fd)
> +{
> +	unsigned int ignored_mask, mflags;
> +	char procfdinfo[100];
> +
> +	sprintf(procfdinfo, "/proc/%d/fdinfo/%d", (int)getpid(), fd);
> +	if (FILE_LINES_SCANF(procfdinfo, "fanotify ino:%*x sdev:%*x mflags: %x mask:0 ignored_mask:%x",
> +				&mflags, &ignored_mask) || !ignored_mask) {
> +		tst_res(TFAIL, "The ignore mask did not survive");
> +	} else {
> +		tst_res(TPASS, "Found mark with ignore mask (ignored_mask=%x, mflags=%x) in %s",
> +				ignored_mask, mflags, procfdinfo);
> +	}
> +}
> +
>  static void event_res(int ttype, int group,
>  		      struct fanotify_event_metadata *event,
>  		      const char *filename)
> @@ -274,6 +325,12 @@ static void test_fanotify(unsigned int n)
>  		return;
>  	}
>  
> +	if (tc->ignore && tst_kvercmp(5, 19, 0) < 0) {
> +		tst_res(TCONF, "ignored mask on parent dir has undefined "
> +				"behavior on kernel < 5.19");
> +		return;
> +	}
> +
>  	create_fanotify_groups(tc);
>  
>  	/*
> @@ -326,6 +383,13 @@ static void test_fanotify(unsigned int n)
>  	 * got the FAN_CLOSE_NOWRITE event only on a non-directory.
>  	 */
>  	for (i = 1; i < NUM_GROUPS; i++) {
> +		/*
> +		 * Verify that ignore mask survived the modify event on child,
> +		 * which was not supposed to be sent to this group.
> +		 */
> +		if (tc->ignore)
> +			check_ignore_mask(fd_notify[i]);
> +
>  		ret = read(fd_notify[i], event_buf, EVENT_BUF_LEN);
>  		if (ret > 0) {
>  			event = (struct fanotify_event_metadata *)event_buf;
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
