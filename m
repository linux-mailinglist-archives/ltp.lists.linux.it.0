Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA21F3AD6
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:46:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8288B3C2E57
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:46:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 74FBF3C2E4A
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:45:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 97CF31A013A9
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:45:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96EA1ADC8;
 Tue,  9 Jun 2020 12:46:01 +0000 (UTC)
References: <33c4abf347e2de96f89b9acea02d731e47dbf2a9.1591700131.git.jstancek@redhat.com>
User-agent: mu4e 1.4.8; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
In-reply-to: <33c4abf347e2de96f89b9acea02d731e47dbf2a9.1591700131.git.jstancek@redhat.com>
Date: Tue, 09 Jun 2020 13:45:57 +0100
Message-ID: <877dwgxv96.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: scale down how many times we read by
 default
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Jan Stancek <jstancek@redhat.com> writes:

> read_all is running into timeouts on high cpu systems, where
> access to some per-cpu files is protected by a lock. Latest
> example is /sys/kernel/tracing/per_cpu/*.
>
> At the moment we read each file 10 times, and we have been
> excluding files that take too long. Rather than expanding
> blacklist, scale the default down to 3.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  runtest/fs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/runtest/fs b/runtest/fs
> index 464ba8fb9686..5892e9fdaee5 100644
> --- a/runtest/fs
> +++ b/runtest/fs
> @@ -69,9 +69,9 @@ fs_di fs_di -d $TMPDIR
>  # Was not sure why it should reside in runtest/crashme and won't get tested ever
>  proc01 proc01 -m 128
>  
> -read_all_dev read_all -d /dev -p -q -r 10
> -read_all_proc read_all -d /proc -q -r 10
> -read_all_sys read_all -d /sys -q -r 10
> +read_all_dev read_all -d /dev -p -q -r 3
> +read_all_proc read_all -d /proc -q -r 3
> +read_all_sys read_all -d /sys -q -r 3
>  
>  #Run the File System Race Condition Check tests as well
>  fs_racer fs_racer.sh -t 5
> -- 
> 2.18.1

OK this makes sense. We shouldn't be stress testing the system in this
runtest file.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
