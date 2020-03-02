Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6B1755DE
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 09:21:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E71F3C682B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 09:21:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 90E653C67EC
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 09:21:52 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A6F731401165
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 09:21:51 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id cx7so933641pjb.3
 for <ltp@lists.linux.it>; Mon, 02 Mar 2020 00:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=afGaKdqTnYMduh9DaZXd65zZ7EAYp+6jcZBdivQRG2k=;
 b=skH5/0jWHyYLfm5a0YQ9MJ9zsb8+GH3w10wa+U9+/g9wSzQvqa6Gv3ON7pxk8OoMK3
 sxTQB3P0dAiYqsMgeZ4SscbzWNaR7BwbLEleclnSwT0ZKxLbI/BEdWvkF8wtn9bPT2DJ
 K6Zq2BvFQ9JjqVNQnPo/RGaTmpwp1WPH61Ahf2iFUIDHcfB3XMIzrblVXIkEQQGwm4lH
 mbMUB9FuQmMeIn9TzWQ2BAhNSUCbdIklI2BHKaTcDGeqwbra4m0JQt+uezcTcf3/YQkR
 LGso8xEB0jT8A5WZp7zcFJSA83b9m8do2FVyXUIZvyy4xwgzl+VWsQ8yqW4pPe5QDAhQ
 t8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=afGaKdqTnYMduh9DaZXd65zZ7EAYp+6jcZBdivQRG2k=;
 b=GIemM1QQIL/+jQZBualtpddw0a1tQ9Ih2iXKFFiRtYOZv+b0yXTQ3HDx6tVq4YRjZl
 +AyRsLZY7zQBwxmMYY+PUhZpHcwyIjbkOx2CJPzfLnVUJ5m0mt3QTB7HPShtl+auR6ic
 FdynOq9xGeuLSAWBfpPOxRdmP36KBMq5cMyvr1hRp0EK98Y0n+TcfkKcCcBGrzIu0lkD
 Cm9ik71L7LwBlwGb1XQ0mC30eWAx+qallsXc0PWBFJUBJ7G7LeCxNQjYIcweR3pu7Sq7
 rp/94a4AC2pY1fW891jvNIA3bxQhSzpMdnHY03GWL4NmRMlJLCpbpy2YfilD8PBywpIy
 Xakg==
X-Gm-Message-State: APjAAAWYn1k+5ROVB7jJ4yq2R//MA1MNIdgZc2XxHkLRgaEtQdVVd+je
 4CoRGKbEWI/jOw7EUo9qt+iJBQ==
X-Google-Smtp-Source: APXvYqznESyWB5Wz48CT6YpyANhs8Qevj/yj3mGhaBZeJ176ywoS3sDKqmfcP3y8frBw50/lEsMsSQ==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr19747055pjb.90.1583137310031; 
 Mon, 02 Mar 2020 00:21:50 -0800 (PST)
Received: from localhost ([122.167.24.230])
 by smtp.gmail.com with ESMTPSA id w7sm3073085pfj.167.2020.03.02.00.21.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 00:21:49 -0800 (PST)
Date: Mon, 2 Mar 2020 13:51:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200302082147.zucnweqqdaaaaxyi@vireshk-i7>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <01949a4ba3d2c125a9be8422ec27c8436a53f6a8.1582779464.git.viresh.kumar@linaro.org>
 <20200228160149.GA5312@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228160149.GA5312@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 05/10] syscalls/fsconfig: New tests
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

On 28-02-20, 17:01, Petr Vorel wrote:
> > +	TEST(fsmfd = fsmount(fd, 0, 0));
> > +	if (fsmfd == -1) {
> > +		tst_res(TBROK | TERRNO, "fsmount() failed");
> > +		goto out;
> BTW This needs to be now tst_res(TFAIL) (this patchset now does not compile).

For a minute I thought I failed with my testing :(

And then I looked at the recent changes and looks like compilation
broke due to the changes you have pushed recently. Right ?

> > +	TEST(fsconfig(fd, FSCONFIG_SET_FD, "sync", NULL, 0));
> > +	if (TST_RET == -1) {
> > +		if (TST_ERR == EOPNOTSUPP) {
> > +			tst_res(TCONF, "fsconfig(): FSCONFIG_SET_FD not supported");
> > +		} else {
> > +			tst_res(TFAIL | TERRNO, "fsconfig() failed");
> > +			goto out;
> > +		}
> > +	}
> 
> I get TCONF for all fsconfig01 results, while I'm using 5.5.5-1-default:

s/all/most/

I know, same here.


> tst_test.c:1290: INFO: Testing on ext2
> tst_mkfs.c:89: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.45.5 (07-Jan-2020)
> tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
> fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
> fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
> fsconfig01.c:92: PASS: fsconfig() passed
> tst_test.c:1290: INFO: Testing on ext3
> tst_mkfs.c:89: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.45.5 (07-Jan-2020)
> tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
> fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
> fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
> fsconfig01.c:92: PASS: fsconfig() passed
> tst_test.c:1290: INFO: Testing on ext4
> tst_mkfs.c:89: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.45.5 (07-Jan-2020)
> tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
> fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
> fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
> fsconfig01.c:92: PASS: fsconfig() passed
> tst_test.c:1290: INFO: Testing on xfs
> tst_mkfs.c:89: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:92: PASS: fsconfig() passed

You didn't get them for xfs :)

> tst_test.c:1290: INFO: Testing on btrfs
> tst_mkfs.c:89: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
> fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
> fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
> fsconfig01.c:92: PASS: fsconfig() passed
> tst_test.c:1290: INFO: Testing on vfat
> tst_mkfs.c:89: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
> fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
> fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
> fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
> fsconfig01.c:92: PASS: fsconfig() passed
> 
> Not yet merged man page [1] (I reposted David Howells commit) there is
> explanation for EOPNOTSUPP: The command given by cmd was not valid.
> 
> First, I suspected "sync" option is wrong. But looking at kernel sources it's
> really not implemented:
> 
> fs/fsopen.c
> 	if (fc->ops == &legacy_fs_context_ops) {
> 		switch (cmd) {
> 		case FSCONFIG_SET_BINARY:
> 		case FSCONFIG_SET_PATH:
> 		case FSCONFIG_SET_PATH_EMPTY:
> 		case FSCONFIG_SET_FD:
> 			ret = -EOPNOTSUPP;
> 			goto out_f;
> 		}
> 	}
> 
> fs/fs_context.c
> 	/* TODO: Make all filesystems support this unconditionally */
> 	init_fs_context = fc->fs_type->init_fs_context;
> 	if (!init_fs_context)
> 		init_fs_context = legacy_init_fs_context;
> ...
> /*
>  * Initialise a legacy context for a filesystem that doesn't support
>  * fs_context.
>  */
> static int legacy_init_fs_context(struct fs_context *fc)
> {
> 	fc->fs_private = kzalloc(sizeof(struct legacy_fs_context), GFP_KERNEL);
> 	if (!fc->fs_private)
> 		return -ENOMEM;
> 	fc->ops = &legacy_fs_context_ops;
> 	return 0;
> }

Right, I have seen that all earlier and so I knew that the failures
here are just fine.

> Code coming from v5.1-rc1 f3a09c92018a91ad0981146a4ac59414f814d801 introduce
> fs_context methods [2]. Other patchsets here [3] shows there is some support for
> fs_context in VFS. So I wonder how to achieve not end up with legacy context.
> 
> > +++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> > +  {"set-path-key", &fd, FSCONFIG_SET_PATH, NULL, "/dev/sda1", &aux_fdcwd, EINVAL},
> ...
> > +  {"set-path-aux", &fd, FSCONFIG_SET_PATH, "sync", "/dev/sda1", &aux_minus1, EINVAL},
> /dev/sda1 is valid on some hosts, but invalid on others. Shouldn't we use
> /dev/foo instead?

Should be fine I think.

> ...
> > +	temp_fd = open("testfile", O_RDWR | O_CREAT, 01444);
> > +	if (temp_fd == -1)
> > +		tst_res(TBROK, "Can't obtain temp_fd, open() failed");
> Here needs to be now tst_brk(TBROK).
> Again I'll change it before merge.

Thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
