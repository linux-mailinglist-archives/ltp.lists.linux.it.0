Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF41C3261
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 07:53:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B2D13C268E
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 07:53:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6171B3C267C
 for <ltp@lists.linux.it>; Mon,  4 May 2020 07:53:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 417C860063F
 for <ltp@lists.linux.it>; Mon,  4 May 2020 07:53:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 95DA7ABBD;
 Mon,  4 May 2020 05:53:22 +0000 (UTC)
Date: Mon, 4 May 2020 07:53:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200504055318.GA11558@dell5510>
References: <20200502162744.9589-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502162744.9589-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/4] fanotify ltp tests for v5.7-rc1
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Hi Petr,

> Following patches test fanotify kernel code merged to v5.7-rc1.

> Changes since v1:
> - Patch to fanotify09 has already been merged
> - Addressed comments by Petr, Cyril, Matthew and added reviewed-by
> - Added patch to use new helper fanotify_save_fid by other tests

> Patch 3 adds a new test for the new event type FAN_MODIFY_DIR, which
> carries a new event format (parent fid + name).
> The man page patches for FAN_MODIFY_DIR have already been merged.

LGTM, I'll just fix failure on MUSl and then merge
https://travis-ci.org/github/pevik/ltp/jobs/682785812

Kind regards,
Petr

> Thanks all for the review,
> Amir.

> Amir Goldstein (4):
>   syscalls/fanotify15: Minor corrections
>   syscalls/fanotify15: Add a test case for inode marks
>   syscalls/fanotify: New test for FAN_MODIFY_DIR
>   syscalls/fanotify: Use fanotify_save_fid() helper

>  runtest/syscalls                              |   1 +
>  testcases/kernel/syscalls/fanotify/.gitignore |   1 +
>  testcases/kernel/syscalls/fanotify/fanotify.h |  36 +-
>  .../kernel/syscalls/fanotify/fanotify13.c     |  44 +-
>  .../kernel/syscalls/fanotify/fanotify15.c     | 191 ++++++---
>  .../kernel/syscalls/fanotify/fanotify16.c     | 403 ++++++++++++++++++
>  6 files changed, 596 insertions(+), 80 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/fanotify/fanotify16.c

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
