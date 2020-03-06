Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338517BE42
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:25:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B8223C63CD
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:25:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D52EE3C13DB
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:25:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 03B3A200C20
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:25:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1849EACD0;
 Fri,  6 Mar 2020 13:25:49 +0000 (UTC)
Date: Fri, 6 Mar 2020 14:25:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200306132547.GA17606@dell5510>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <01949a4ba3d2c125a9be8422ec27c8436a53f6a8.1582779464.git.viresh.kumar@linaro.org>
 <20200228160149.GA5312@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228160149.GA5312@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> I get TCONF for all fsconfig01 results, while I'm using 5.5.5-1-default:

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

> Not yet merged man page [1] (I reposted David Howells commit) there is
> explanation for EOPNOTSUPP: The command given by cmd was not valid.

> First, I suspected "sync" option is wrong. But looking at kernel sources it's
> really not implemented:
I'm sorry, I was wrong. I overlooked It's supported, but just by xfs
(which is surprising).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
