Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C13013C130
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 13:40:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F386A3C1CA1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 13:40:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 97E9E3C088A
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 13:40:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 96BB3201559
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 13:40:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DEF2AD18
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 12:40:45 +0000 (UTC)
Date: Wed, 15 Jan 2020 13:40:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200115124044.GC14046@rei.lan>
References: <20200115110922.GB26763@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115110922.GB26763@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] mkfs.vfat: Device partition expected,
 not making filesystem on entire device '/dev/vdb' (use -I to
 override)
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
> there is a problem with mkfs.vfat, when LTP_DEV is full block device:
> 
> # ltp_dev=/dev/vdb fsync04
> ...
> fsync04.c:50: PASS: Test file synced to device
> tst_test.c:1278: INFO: Testing on xfs
> tst_mkfs.c:35 tst_mkfs_(): pev: fs_type: 'xfs'
> tst_mkfs.c:92: INFO: Formatting /dev/vdb with xfs opts='' extra opts=''
> tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
> fsync04.c:50: PASS: Test file synced to device
> tst_test.c:1278: INFO: Testing on btrfs
> tst_mkfs.c:35 tst_mkfs_(): pev: fs_type: 'btrfs'
> tst_mkfs.c:92: INFO: Formatting /dev/vdb with btrfs opts='' extra opts=''
> tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
> fsync04.c:50: PASS: Test file synced to device
> tst_test.c:1278: INFO: Testing on vfat
> tst_mkfs.c:35 tst_mkfs_(): pev: fs_type: 'vfat'
> tst_mkfs.c:92: INFO: Formatting /dev/vdb with vfat opts='' extra opts=''
> mkfs.vfat: Device partition expected, not making filesystem on entire device '/dev/vdb' (use -I to override)
> tst_mkfs.c:103: BROK: mkfs.vfat:1: tst_test.c failed with 830
> 
> Do we want to add permanently -I to vfat?
> Or is it too hacky to trying to workaround tool's problem in the code?

I would say that you are supposed to create partition on a real device
without creating a partition first, but you can always outvote me.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
