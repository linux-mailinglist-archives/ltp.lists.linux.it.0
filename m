Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50691EFE3A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:20:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FFA03C22C6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:20:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 533843C22B7
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:20:07 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BD7FC1A000B3
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:20:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09C0FB540
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:20:06 +0000 (UTC)
Date: Tue, 5 Nov 2019 14:20:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191105132004.GA20849@dell5510>
References: <20191105112000.20633-1-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105112000.20633-1-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] cgroup_fj_stress: Avoid killall
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

Hi Clements,

> We discovered problems that killall didn't catched all processes. With
> this patch, we collect the pids manually and kill them one after the
> other.

LGTM.
I wonder if we also want to kill cgroup_fj_proc this way (see cgroup_fj_common.sh).

I guess you're not planning to create minimal reproducer to prove the problem of
left processes after killall, are you?

> Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> ---
>  testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

> diff --git a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh
> index 698aa4979..27ea7634a 100755
> --- a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh
> +++ b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh
> @@ -74,6 +74,7 @@ setup
>  export TMPFILE=./tmp_tasks.$$

>  count=0
> +collected_pids=""
nit:
collected_pids=

...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
