Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA891FD4BF
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 20:44:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FFE73C2CB6
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 20:44:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2A2713C02EF
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 20:44:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 437041400960
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 20:43:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50144AAC3;
 Wed, 17 Jun 2020 18:44:03 +0000 (UTC)
Date: Wed, 17 Jun 2020 20:43:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200617184356.GA7422@dell5510>
References: <20200608142744.274287-1-yangx.jy@cn.fujitsu.com>
 <20200608145831.GA2746544@x230>
 <423c55db-a393-d1d9-6de6-28f65f76557a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <423c55db-a393-d1d9-6de6-28f65f76557a@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nfs_lib.sh: Use double quotes for grep
 pattern
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey, Xiao,

> Perhaps this:

> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 59b373e..9c8f163 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -172,8 +172,7 @@ tst_rhost_run()
>         local output=
>         local ret=0
>         if [ -n "${TST_USE_SSH:-}" ]; then
> -               output=`ssh -n -q $user@$RHOST "sh -c \
> -                       '$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
> +               output=$(ssh -n -q $user@$RHOST "$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
>         elif [ -n "$TST_USE_NETNS" ]; then
>                 output=`$LTP_NETNS sh -c \
>                         "$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`

Nice! Much simpler than what what I was just going to post (sed replacement).
Would it work for rsh as well? i.e. can it work without sh -c?
I have no working rsh setup.

And removing it from all 3 variants would be great (keeping them to be the same,
also it might allow to also use shell functions, which doesn't work with sh -c
"..."). Why was sh -c "..." used anyway?

BTW I have more tst_net.sh, but I post them after we solve this one (as
replacing quotes with sed, which is in my prepared patchset is ugly).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
