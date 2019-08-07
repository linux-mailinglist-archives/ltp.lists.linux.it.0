Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D948641A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 16:13:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455423C1DBE
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 16:13:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4DAFC3C185E
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 16:48:55 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F2266019FD
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 16:48:54 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77EmKMh009596;
 Wed, 7 Aug 2019 14:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=8fmUm+c0lp1yW+ye3nCnUtezPZFZD9wiLonGzpBj43k=;
 b=Wh7nSwN9cUkpRRN0xg5Lu1tYO8CDn5rIpcaEkb8Ud1sGZbtMaWjFSuKYQh/ODMhUkKJp
 HFRqlNyZP0u2IaW4JcAAgo5Svx2mSRXLMAJMImfHzdS8DRL8omt6Rh1zdY0wGcKRiGoo
 2iqwgVyPev6Cda9vF95Kq5Tt1jmbQCWum39y2/UgKXrXhTEHiKNvm+tHv4O9DCyOekYZ
 D1ixI911/Few1f3PElMmasVpJDZriQhjVT8rJBZxJvxXQWZ3bDd6+yZnIwVj+Ruh7TBl
 qctiTXGxHGSJ5zGG+TMCi6H2M6VBvyeDkUBlbCufDndTaSkioVqHcvgRToXMGLIIh5YO HA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2u527pvsb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 14:48:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77ElcGu078594;
 Wed, 7 Aug 2019 14:48:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2u7667qh2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 14:48:28 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x77EmPjd011640;
 Wed, 7 Aug 2019 14:48:27 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Aug 2019 07:48:25 -0700
Date: Wed, 7 Aug 2019 07:48:24 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190807144824.GO7138@magnolia>
References: <20190807094119.10834-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807094119.10834-1-pvorel@suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908070159
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908070158
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 08 Aug 2019 16:13:22 +0200
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: Fix #12 when TMPDIR
 is on tmpfs or ext[234]
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

On Wed, Aug 07, 2019 at 11:41:19AM +0200, Petr Vorel wrote:
> Recent fix 96e6e8f4a68d ("vfs: add missing checks to copy_file_range")
> in kernel v5.3-rc1 changed errno for ext[234] and tmpfs to EINVAL.
> 
> + fix typo from 0242a9a29
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi all,
> 
> Amir, Darrick, am I right that it's not a problem that errno changed
> recently, is it? There have been more errno changes due several fixes in
> copy_file_range() in the past. I've seen this approach several times in
> other subsystems (e.g. network). Hope userspace not often check for
> particular error.

Same here.  I think EXDEV is the only errno that can be worked around in
userspace (with a classic read-write loop).

> Cyril, Jan, Li, still not sure what the policy about errno is (see
> Cyril's statements in recent discussion about it in Jinhui's patch [1]
> [2]). With these frequent changes we should IMHO check for all possible
> variants (EXDEV, EFBIG, EINVAL).

I for one hope we're done messing with the (bad input) -> errno mappings.

> Or should we investigate all fixes and keep errors which highlight
> important fix was not backported (to both stable and LTS/enterprise
> distros kernels?). That'd be weird but approach practical :).

copy_file_range was kinda broken before 5.3 if you were using it on a
disk filesystem, so I'd hope the LTS folks would backport them (or turn
c_f_r off).

--D

> Anyway, we should define and write down LTP policy / rules about it.
> 
> Kind regards,
> Petr
> 
> [1] https://patchwork.ozlabs.org/patch/1108229/#2182801
> [2] https://patchwork.ozlabs.org/patch/1108229/#2182837
> 
>  .../copy_file_range/copy_file_range02.c       | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 9004c4a40..b113e44b5 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -49,6 +49,7 @@ static int fd_blkdev;
>  static int fd_chrdev;
>  static int fd_fifo;
>  static int fd_copy;
> +static int fd_copy2;
>  
>  static int chattr_i_nsup;
>  static int swap_nsup;
> @@ -73,8 +74,8 @@ static struct tcase {
>  	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE, "block device"},
>  	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "char device"},
>  	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
> -	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
> -	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
> +	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length"},
> +	{&fd_copy2,     0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
>  };
>  
>  static int run_command(char *command, char *option, char *file)
> @@ -100,6 +101,7 @@ static void verify_copy_file_range(unsigned int n)
>  	struct tcase *tc = &tcases[n];
>  	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
>  
> +
>  	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
>  		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
>  		return;
> @@ -112,6 +114,20 @@ static void verify_copy_file_range(unsigned int n)
>  		tst_res(TCONF, "filesystem doesn't have free loopdev, skip it");
>  		return;
>  	}
> +
> +	if (tc->copy_to_fd == &fd_copy2) {
> +		long fs_type = tst_fs_type(".");
> +		switch (fs_type) {
> +		case TST_TMPFS_MAGIC:
> +		case TST_EXT234_MAGIC:
> +		default:
> +			tc->exp_err = EINVAL;
> +			tst_res(TINFO, "%s filesystem, changing expecting errno to %d",
> +					tst_fs_type_name(fs_type), tc->exp_err);
> +			break;
> +		}
> +	}
> +
>  	TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
>  				&tc->dst, tc->len, tc->flags));
>  
> -- 
> 2.22.0
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
