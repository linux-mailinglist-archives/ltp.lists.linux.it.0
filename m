Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E061EEFD
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Nov 2022 10:29:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AD413CD9B8
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Nov 2022 10:29:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D0D43CB0C9
 for <ltp@lists.linux.it>; Mon,  7 Nov 2022 10:29:45 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 06FF2600C7A
 for <ltp@lists.linux.it>; Mon,  7 Nov 2022 10:29:44 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 02D5F223EB;
 Mon,  7 Nov 2022 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667813384;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8yQM9bqUkXh8J3dD1KYCawQLP7ajAQLYTbEL/gKJeU=;
 b=xYcJi5uvqV971xZ+6bNYCiaAD16QCn2LSnExM4+TtO38+o7gLsZzHSBBm4FL/0TWa0uULr
 uiLcXwJXxpJn2/Y72a4lFhdZi/kvBTTB3WRJ2aypWBZwuuyV5b1oPS61MbIyBTL5v9CTSU
 K9LcCkjExU73vLigDuG2raU1fBG0X+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667813384;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8yQM9bqUkXh8J3dD1KYCawQLP7ajAQLYTbEL/gKJeU=;
 b=oRKZA9Vf1wZ8MZ5gl+Cp5/k4cNfq4BQju1TxcTEjDWnIKD8QyIWDWYVi2l0FDI5opCcdTs
 EqnAXtCCBz/Yg0Cg==
Received: from UNKNOWN (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 898BB2C141;
 Mon,  7 Nov 2022 09:29:43 +0000 (UTC)
References: <8735b0jos5.fsf@suse.de>
 <20221104044149.655317-1-alessandro.carminati@gmail.com>
 <20221104044149.655317-2-alessandro.carminati@gmail.com>
User-agent: mu4e 1.8.11; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Alessandro Carminati <alessandro.carminati@gmail.com>
Date: Mon, 07 Nov 2022 08:46:32 +0000
Organization: Linux Private Site
In-reply-to: <20221104044149.655317-2-alessandro.carminati@gmail.com>
Message-ID: <87h6zbxgc9.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_find_backing_dev: Get dev name from
 /sys/*/uevent
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
Cc: acarmina@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Just a couple of points.

Alessandro Carminati <alessandro.carminati@gmail.com> writes:

> +	if (dev_major == 0) {
> +		tst_resm(TINFO, "Use BTRFS specific strategy");
> +
> +		fd = SAFE_OPEN(NULL, dirname(path), O_DIRECTORY);
> +		if (!ioctl(fd, BTRFS_IOC_FS_INFO, &args)) {

If this is tmpfs, then this ioctl will fail with ENOTTY, but it is not
checked for.

> +			sprintf(btrfs_uuid_str,
> +				UUID_FMT,
> +				args.fsid[0], args.fsid[1],
> +				args.fsid[2], args.fsid[3],
> +				args.fsid[4], args.fsid[5],
> +				args.fsid[6], args.fsid[7],
> +				args.fsid[8], args.fsid[9],
> +				args.fsid[10], args.fsid[11],
> +				args.fsid[12], args.fsid[13],
> +				args.fsid[14], args.fsid[15]);
> +			sprintf(bdev_path,
> +				"/sys/fs/btrfs/%s/devices", btrfs_uuid_str);
>  		}
> -
> -		len = count_match_len(path, mnt_point);
> -		if (len > best_match_len) {
> -			strcpy(dev, pre);
> -			best_match_len = len;
> +		SAFE_CLOSE(NULL, fd);
> +		dir = SAFE_OPENDIR(NULL, bdev_path);

So then down here we get a failure with ENOENT or some similar confusing
message.

Ideally we want to tell the user that the FS has an anonymous backing
dev, but that it is not BTRFS. Maybe also hint that they need to add the
FS to tst_test.skip_filesystems if it is has no backing device
(e.g. tmpfs). As this is the most likely cause given ioctl_loop05's
history.

> +		while (d = SAFE_READDIR(NULL, dir)) {
> +			if (d->d_name[0]!='.')
> +				break;
>  		}
> +		uevent_path[0] = '\0';
> +		if (d) {
> +			sprintf(uevent_path, "%s/%s/uevent",
> +				bdev_path, d->d_name);
> +		} else {
> +			tst_brkm(TBROK, NULL, "No backining device
> found");

We can print bdev path here. Then the user knows where to look without
much effort.


Marking this as changes requested in patchwork.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
