Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E529A919
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 11:10:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 618F03C3119
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 11:10:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 018373C247B
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 11:10:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 1CF04600C00
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 11:10:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,423,1596470400"; d="scan'208";a="100553194"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 18:10:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6A7384CE1506;
 Tue, 27 Oct 2020 18:10:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 18:10:14 +0800
Message-ID: <5F97F205.8020602@cn.fujitsu.com>
Date: Tue, 27 Oct 2020 18:10:13 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Martin Doucha <mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-6-mdoucha@suse.cz>
In-Reply-To: <20201026164756.30556-6-mdoucha@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6A7384CE1506.ABDCA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.8 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 05/19] Unify error handling in lib/safe_macros.c
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

Hi Martin
> - Properly format caller file:line location
> - Pedantically check invalid syscall return values
>
> Signed-off-by: Martin Doucha<mdoucha@suse.cz>
> ---
>   lib/safe_macros.c | 602 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 384 insertions(+), 218 deletions(-)
>
> diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> index 4f48d7529..f5e80fc48 100644
> --- a/lib/safe_macros.c
> +++ b/lib/safe_macros.c

>
>
>   	return rval;
> @@ -255,10 +288,16 @@ ssize_t safe_read(const char *file, const int lineno, void (*cleanup_fn) (void),
>   	ssize_t rval;
>
>   	rval = read(fildes, buf, nbyte);
> +
>   	if (rval == -1 || (len_strict&&  (size_t)rval != nbyte)) {
> -		tst_brkm(TBROK | TERRNO, cleanup_fn,
> -			 "%s:%d: read(%d,%p,%zu) failed, returned %zd",
> -			 file, lineno, fildes, buf, nbyte, rval);
> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"read(%d,%p,%zu) failed, returned %zd", fildes, buf,
> +			nbyte, rval);
> +	}
> +	if (rval<  0) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"Invalid read(%d,%p,%zu) return value %zd", fildes,
> +			buf, nbyte, rval);
>   	}
Here has problem.. Maybe we can  use simple
if (rval < 0 || (len_strict&&  (size_t)rval != nbyte)) to replace.
>
>   	return rval;

>   	return rval;
> @@ -452,10 +530,14 @@ ssize_t safe_write(const char *file, const int lineno, void (cleanup_fn) (void),
>   	ssize_t rval;
>
>   	rval = write(fildes, buf, nbyte);
> +
>   	if (rval == -1 || (len_strict&&  (size_t)rval != nbyte)) {
> -		tst_brkm(TBROK | TERRNO, cleanup_fn,
> -			 "%s:%d: write(%d,%p,%zu) failed",
> -		         file, lineno, fildes, buf, rval);
> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"write(%d,%p,%zu) failed", fildes, buf, nbyte);
> +	} else if (rval<  0) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"Invalid write(%d,%p,%zu) return value %zd", fildes,
> +			buf, nbyte, rval);
>   	}
I prefer to use "if (rval < 0 || (len_strict&&  (size_t)rval != nbyte)"
>

>   	}
>
> @@ -530,20 +612,19 @@ long safe_sysconf(const char *file, const int lineno,
>   		  void (cleanup_fn) (void), int name)
>   {
>   	long rval;
> -	errno = 0;
>
> +	errno = 0;
It looks no change.
>   	rval = sysconf(name);
>
>   	if (rval == -1) {
>   		if (errno) {
> -			tst_brkm(TBROK | TERRNO, cleanup_fn,
> -				 "%s:%d: sysconf(%d) failed",
> -				 file, lineno, name);
> +			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +				"sysconf(%d) failed", name);
>   		} else {
> -			tst_resm(TINFO, "%s:%d: sysconf(%d): "
> -				 "queried option is not available"
> -				 " or there is no definite limit",
> -				 file, lineno, name);
> +			tst_resm_(file, lineno, TINFO, "sysconf(%d): "
> +				"queried option is not available"
> +				" or there is no definite limit",
> +				name);
>   		}





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
