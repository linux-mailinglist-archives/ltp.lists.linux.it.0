Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 806982D0FCC
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 12:57:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 476273C627E
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 12:57:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1438F3C2356
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 12:57:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BAA8E10009DE
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 12:57:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FAF7AC9A;
 Mon,  7 Dec 2020 11:57:43 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:57:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Message-ID: <X84YtUq/SNK1HJRY@pevik>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-4-amir73il@gmail.com>
 <X84VqaD4+FqAix5h@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X84VqaD4+FqAix5h@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > In preparation of testing events with filename info, teach the
> > how to read variable length events and parse the name info.

> This commit broke umount() on old kernels. (LTP lib doing multiple attempts is
> useless here). Not sure what exactly is being used, it's not by staing in
> mounted directory. Any idea how to fix it?

Using umount2(MOUNT_NAME, MNT_DETACH) obviously fixes umount, but not sure if
fixing something in the test would allow to use tst_umount().

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
