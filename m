Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A6117D3D
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 02:37:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 079893C2352
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 02:37:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 111173C176C
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 02:37:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 40CA160092B
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 02:37:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,297,1571673600"; d="scan'208";a="79910405"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Dec 2019 09:37:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 9DE5C4CE1C86;
 Tue, 10 Dec 2019 09:28:48 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Dec 2019 09:37:18 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191209203248.2427967-1-pvorel@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <e72e0225-1b5d-1e4b-051f-a392c13a97c8@cn.fujitsu.com>
Date: Tue, 10 Dec 2019 09:37:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191209203248.2427967-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9DE5C4CE1C86.AEDC6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] shell: TST_NEEDS_DEVICE imply TST_TMPDIR
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



on 2019/12/10 4:32, Petr Vorel wrote:
> instead of requiring to be set.
> This is a sync with C API (previous commit).
> 
Hi Petr

Looks good to me, let's wait whether others have some objections.

Kind Regards,
Yang Xu
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> sync shell API with patch for C API
> (should be accepted only if we agree on
> https://patchwork.ozlabs.org/patch/1204029/).
> 
> Kind regards,
> Petr
> 
>   doc/test-writing-guidelines.txt                            | 1 +
>   testcases/commands/df/df01.sh                              | 1 -
>   testcases/commands/mkfs/mkfs01.sh                          | 1 -
>   testcases/commands/mkswap/mkswap01.sh                      | 1 -
>   testcases/kernel/security/integrity/ima/tests/ima_setup.sh | 1 -
>   testcases/lib/tst_test.sh                                  | 5 ++---
>   6 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index e8e766753..79d857fea 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -2125,6 +2125,7 @@ simply by setting right '$TST_NEEDS_FOO'.
>   | 'TST_NEEDS_TMPDIR' | Create test temporary directory and cd into it.
>   | 'TST_NEEDS_DEVICE' | Prepare test temporary device, the path to testing
>                          device is stored in '$TST_DEVICE' variable.
> +                       The option implies 'TST_NEEDS_TMPDIR'.
>   | 'TST_NEEDS_CMDS'   | String with command names that has to be present for
>                          the test (see below).
>   | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
> diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
> index 1ab4547f4..02aeec7b4 100755
> --- a/testcases/commands/df/df01.sh
> +++ b/testcases/commands/df/df01.sh
> @@ -13,7 +13,6 @@ TST_OPTS="f:"
>   TST_USAGE=usage
>   TST_PARSE_ARGS=parse_args
>   TST_NEEDS_ROOT=1
> -TST_NEEDS_TMPDIR=1
>   TST_NEEDS_DEVICE=1
>   . tst_test.sh
>   
> diff --git a/testcases/commands/mkfs/mkfs01.sh b/testcases/commands/mkfs/mkfs01.sh
> index 81f1a168c..90368190d 100755
> --- a/testcases/commands/mkfs/mkfs01.sh
> +++ b/testcases/commands/mkfs/mkfs01.sh
> @@ -12,7 +12,6 @@ TST_OPTS="f:"
>   TST_USAGE=usage
>   TST_PARSE_ARGS=parse_args
>   TST_NEEDS_ROOT=1
> -TST_NEEDS_TMPDIR=1
>   TST_NEEDS_DEVICE=1
>   TST_NEEDS_CMDS="blkid df"
>   . tst_test.sh
> diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mkswap/mkswap01.sh
> index 9437c4a4e..f6494f6e3 100755
> --- a/testcases/commands/mkswap/mkswap01.sh
> +++ b/testcases/commands/mkswap/mkswap01.sh
> @@ -9,7 +9,6 @@ TST_CNT=10
>   TST_SETUP=setup
>   TST_TESTFUNC=do_test
>   TST_NEEDS_ROOT=1
> -TST_NEEDS_TMPDIR=1
>   TST_NEEDS_DEVICE=1
>   TST_NEEDS_CMDS="uuidgen blkid blockdev mkswap"
>   . tst_test.sh
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> index 51c03013d..422ec0b47 100644
> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> @@ -9,7 +9,6 @@ TST_SETUP_CALLER="$TST_SETUP"
>   TST_SETUP="ima_setup"
>   TST_CLEANUP_CALLER="$TST_CLEANUP"
>   TST_CLEANUP="ima_cleanup"
> -TST_NEEDS_TMPDIR=1
>   TST_NEEDS_ROOT=1
>   
>   . tst_test.sh
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index f772857eb..e0265c1d1 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -525,6 +525,8 @@ tst_run()
>   
>   	_tst_setup_timer
>   
> +	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_TMPDIR=1
> +
>   	if [ "$TST_NEEDS_TMPDIR" = 1 ]; then
>   		if [ -z "$TMPDIR" ]; then
>   			export TMPDIR="/tmp"
> @@ -541,9 +543,6 @@ tst_run()
>   
>   	TST_MNTPOINT="${TST_MNTPOINT:-mntpoint}"
>   	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
> -		if [ -z ${TST_TMPDIR} ]; then
> -			tst_brk TBROK "Use TST_NEEDS_TMPDIR must be set for TST_NEEDS_DEVICE"
> -		fi
>   
>   		TST_DEVICE=$(tst_device acquire)
>   
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
