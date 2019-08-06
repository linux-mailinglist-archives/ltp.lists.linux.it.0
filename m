Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD1D82FB3
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 12:27:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C24E3C1C9A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 12:27:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 144913C1773
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 12:27:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B99F2600A0B
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 12:27:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,353,1559491200"; d="scan'208";a="73070586"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 18:27:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 175524CDFCCF;
 Tue,  6 Aug 2019 18:27:04 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 6 Aug 2019 18:27:00 +0800
Message-ID: <5D4955F4.40204@cn.fujitsu.com>
Date: Tue, 6 Aug 2019 18:27:00 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190806091040.26448-1-pvorel@suse.cz>
 <20190806091040.26448-2-pvorel@suse.cz>
In-Reply-To: <20190806091040.26448-2-pvorel@suse.cz>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 175524CDFCCF.A2035
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/copy_file_range02: Add test
 description
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

Hi
> to increase readability as all_filesystems flag prolonged output a lot.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  .../copy_file_range/copy_file_range02.c       | 33 ++++++++++---------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 472dffdc6..56797f639 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -13,14 +13,14 @@
>   * 2) Try to copy contents to directory -> EISDIR
>   * 3) Try to copy contents to a file opened with the
>   *    O_APPEND flag -> EBADF
> - * 4) Try to copy contents to closed filedescriptor
> + * 4) Try to copy contents to closed file descriptor
>   *    -> EBADF
>   * 5) Try to copy contents with invalid 'flags' value
>   *    -> EINVAL
>   * 6) Try to copy contents to a file chattred with +i
>   *    flag -> EPERM
>   * 7) Try to copy contents to a swapfile ->ETXTBSY
> - * 8) Try to copy contents to the samefile with overlapping
> + * 8) Try to copy contents to the same file with overlapping
>   *    ->EINVAL
>   * 9) Try to copy contents to a blkdev ->EINVAL
>   * 10) Try to copy contents to a chardev ->EINVAL
> @@ -60,20 +60,21 @@ static struct tcase {
>  	int	exp_err;
>  	loff_t  dst;
>  	loff_t     len;
> +	const char *tname;
>  } tcases[] = {
> -	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE},
> -	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE},
> -	{&fd_append,	0,   EBADF,      0,     CONTSIZE},
> -	{&fd_closed,	0,   EBADF,      0,     CONTSIZE},
> -	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE},
> -	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE},
> -	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE},
> -	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2},
> -	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE},
> -	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
> -	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
> -	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX},
> -	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
> +	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE, "readonly file"},
> +	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE, "directory"},
> +	{&fd_append,	0,   EBADF,      0,     CONTSIZE, "append to file"},
> +	{&fd_closed,	0,   EBADF,      0,     CONTSIZE, "closed file descriptor"},
> +	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE, "invalid flags"},
> +	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE, "immutable file"},
> +	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE, "swap file"},
> +	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2, "overlaping"},
overlaping range
> +	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE, "block device"},
> +	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "charr device"},
char device
> +	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
> +	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
> +	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
>  };
>  
>  static int run_command(char *command, char *option, char *file)
> @@ -97,6 +98,8 @@ static int run_command(char *command, char *option, char *file)
>  static void verify_copy_file_range(unsigned int n)
>  {
>  	struct tcase *tc = &tcases[n];
> +	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> +
>  	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
>  		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
>  		return;
Other than typos, this patchset looks good to me.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
