Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9D18EE0D
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 03:44:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA2C33C4F2A
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 03:44:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 220593C0796
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 03:44:05 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 64CAF200903
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 03:44:02 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,294,1580745600"; d="scan'208";a="86822789"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Mar 2020 10:43:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 70ED94BCC8A0;
 Mon, 23 Mar 2020 10:33:44 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Mar 2020 10:43:53 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20200320134937.16616-1-pvorel@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <edd8ed18-8cb3-2a13-7caa-a55c3447389a@cn.fujitsu.com>
Date: Mon, 23 Mar 2020 10:43:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200320134937.16616-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 70ED94BCC8A0.AEBE4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Implement SAFE_RUN() macro (new API only)
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

Hi Petr

There are some small nits
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   doc/test-writing-guidelines.txt |  3 +++
>   include/tst_safe_macros.h       | 20 ++++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index b56f1a0f2..b8330801b 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1282,6 +1282,9 @@ return value is '255' if 'execvp()' failed with 'ENOENT' and '254' otherwise.
>   'stdout_path' and 'stderr_path' determine where to redirect the program
>   stdout and stderr I/O streams.
>   
> +The 'SAFE_RUNCMD()' macro can be used automatic handling non zero exits (exits
> +with 'TBROK') or 'ENOENT' (exits with 'TCONF').
> +
>   .Example
>   [source,c]
>   -------------------------------------------------------------------------------
> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index 80c4d9cb9..d701a003f 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -547,4 +547,24 @@ int safe_personality(const char *filename, unsigned int lineno,
>   void safe_unshare(const char *file, const int lineno, int flags);
>   #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
>   
> +static inline void safe_run_cmd(const char *file, const int lineno,
> +							   const char *const argv[],
> +			      const char *stdout_path,
> +			      const char *stderr_path)
> +{
> +	int rval;
> +
> +	switch ((rval = tst_run_cmd(argv, stdout_path, stderr_path, 1))) {
> +	case 0:
> +		break;
> +	case 255:
> +		tst_brk(TCONF, "%s:%d: %s not found in $PATH", file, lineno, argv[0]);
> +		break;
> +	default:
> +		tst_brk(TBROK, "%s:%d: %s failed (%d)", file, lineno, rc);
typo, rc -> rval and  miss  argv[0].
> +	}
> +}
> +#define SAFE_RUNCMD(argv, stdout_path, stderr_path) \
> +	safe_run_cmd(__FILE__, __LINE__, NULL, (argv), (stdout_path), (stderr_path))
I guess we don't need the third argument(NULL).

Best Regards
Yang Xu
> +
>   #endif /* SAFE_MACROS_H__ */
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
