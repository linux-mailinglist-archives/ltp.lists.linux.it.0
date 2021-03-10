Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392A3342E0
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:19:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 360203C4D72
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:19:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D629E3C2FBF
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:19:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 22C561A01451
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:19:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45B72AC1F
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 16:19:26 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20210310122625.25425-1-chrubis@suse.cz>
 <20210310122625.25425-2-chrubis@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <30fec758-5e18-fceb-ec23-646253ba0e46@suse.cz>
Date: Wed, 10 Mar 2021 17:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310122625.25425-2-chrubis@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: Add proper filesystem skiplist
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 10. 03. 21 13:26, Cyril Hrubis wrote:
> The approach with flags we added for FUSE does not scale at all, we need
> a proper skiplist so that we can skip individual filesystems.
> 
> The motivation here is the addition of tmpfs to the supported
> filesystems check. One of the problems there is that sync() is no-op on
> tmpfs and hence the syncfs test fails. After this patchset we can simply
> skip syncfs test on tmpfs by setting the right skiplist.
> 
> As a bonus point the list of unsupported filesystem gets nicely
> propagated to the metadata as well.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/tst_fs.h                              | 19 +++++++---
>  include/tst_test.h                            |  9 +++--
>  lib/tst_supported_fs_types.c                  | 35 ++++++++++++++-----
>  lib/tst_test.c                                |  2 +-
>  .../kernel/syscalls/fsconfig/fsconfig01.c     |  2 +-
>  testcases/kernel/syscalls/fsmount/fsmount01.c |  2 +-
>  testcases/kernel/syscalls/fsmount/fsmount02.c |  2 +-
>  testcases/kernel/syscalls/fsopen/fsopen01.c   |  2 +-
>  testcases/kernel/syscalls/fspick/fspick01.c   |  2 +-
>  testcases/kernel/syscalls/fspick/fspick02.c   |  2 +-
>  .../kernel/syscalls/move_mount/move_mount01.c |  2 +-
>  .../kernel/syscalls/move_mount/move_mount02.c |  2 +-
>  .../kernel/syscalls/open_tree/open_tree01.c   |  2 +-
>  .../kernel/syscalls/open_tree/open_tree02.c   |  2 +-
>  .../sync_file_range/sync_file_range02.c       |  2 +-
>  testcases/lib/tst_supported_fs.c              |  4 +--
>  16 files changed, 63 insertions(+), 28 deletions(-)
> 
> diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
> index 00ede549d..cd505f570 100644
> --- a/lib/tst_supported_fs_types.c
> +++ b/lib/tst_supported_fs_types.c
> @@ -45,13 +45,34 @@ static int has_mkfs(const char *fs_type)
>  	return 1;
>  }
>  
> -static int has_kernel_support(const char *fs_type, int flags)
> +int tst_fs_in_skiplist(const char *fs_type, const char *const *skiplist)
> +{
> +	unsigned int i;
> +
> +	if (!skiplist)
> +		return 0;
> +
> +	for (i = 0; skiplist[i]; i++) {
> +		if (!strcmp(fs_type, skiplist[i])) {
> +			tst_res(TINFO,
> +			        "Skipping %s as requested by the test", fs_type);
> +			return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int has_kernel_support(const char *fs_type, const char *const *skiplist)
>  {
>  	static int fuse_supported = -1;
>  	const char *tmpdir = getenv("TMPDIR");
>  	char buf[128];
>  	int ret;
>  
> +	if (tst_fs_in_skiplist(fs_type, skiplist))
> +		return 0;
> +
>  	if (!tmpdir)
>  		tmpdir = "/tmp";
>  
> @@ -84,26 +105,24 @@ static int has_kernel_support(const char *fs_type, int flags)
>  		return 0;
>  	}
>  
> -	if (flags & TST_FS_SKIP_FUSE) {
> -		tst_res(TINFO, "Skipping FUSE as requested by the test");
> +	if (tst_fs_in_skiplist("fuse", skiplist))
>  		return 0;
> -	}
>  
>  	tst_res(TINFO, "FUSE does support %s", fs_type);
>  	return 1;
>  }

I don't think that has_kernel_support() should look at the skiplist at
all. The entire skiplist logic should be handled in
tst_get_supported_fs_types(). But has_kernel_support() could return
different (non-zero) values for native support and for FUSE support.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
