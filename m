Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3B2F4613
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:19:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9559C3C31A0
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:19:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 472B93C2698
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:19:26 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C4DFA1400E7B
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:19:17 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103436834"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 16:19:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3B1514CE4B3E;
 Wed, 13 Jan 2021 16:19:08 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 16:19:07 +0800
Message-ID: <5FFEAD16.7050704@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 16:19:34 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210113075110.31628-1-pvorel@suse.cz>
 <20210113075110.31628-2-pvorel@suse.cz>
In-Reply-To: <20210113075110.31628-2-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3B1514CE4B3E.ADFBD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lapi: Move struct file_handle into
 lapi/fcntl.h
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

Hi Petr
> that way it can be used in fanotify tests
> (some of use the struct, but not name_to_handle_at() syscall)
> and the struct is defined in<fcntl.h>  anyway.
> 
> Although detection with HAVE_NAME_TO_HANDLE_AT works (at least on glibc,
> musl and uclibc-ng) add proper autotools check for the struct presence.
> 
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
>   configure.ac                     |  6 ++++++
>   include/lapi/fcntl.h             | 10 ++++++++++
>   include/lapi/name_to_handle_at.h |  9 +--------
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 06be1c094..e44e25cc6 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -148,6 +148,12 @@ AC_CHECK_TYPES([struct acct_v3],,,[#include<sys/acct.h>])
>   AC_CHECK_TYPES([struct af_alg_iv, struct sockaddr_alg],,,[# include<linux/if_alg.h>])
>   AC_CHECK_TYPES([struct fanotify_event_info_fid, struct fanotify_event_info_header],,,[#include<sys/fanotify.h>])
>   AC_CHECK_TYPES([struct file_dedupe_range],,,[#include<linux/fs.h>])
> +
> +AC_CHECK_TYPES([struct file_handle],,,[
> +#define _GNU_SOURCE
I think file_handle struct doesn't need _GNU_SOURCE macro or I miss
something?

Other than this, this patchset LGTM.
Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> +#include<fcntl.h>
> +])
> +
>   AC_CHECK_TYPES([struct fs_quota_statv],,,[#include<xfs/xqm.h>])
>   AC_CHECK_TYPES([struct if_nextdqblk],,,[#include<linux/quota.h>])
>   AC_CHECK_TYPES([struct iovec],,,[#include<sys/uio.h>])
> diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
> index d6665915f..e08970c4f 100644
> --- a/include/lapi/fcntl.h
> +++ b/include/lapi/fcntl.h
> @@ -6,6 +6,7 @@
>   #ifndef __LAPI_FCNTL_H__
>   #define __LAPI_FCNTL_H__
> 
> +#include "config.h"
>   #include<fcntl.h>
>   #include<sys/socket.h>
> 
> @@ -140,4 +141,13 @@
>   # define MAX_HANDLE_SZ	128
>   #endif
> 
> +#ifndef HAVE_STRUCT_FILE_HANDLE
> +struct file_handle {
> +	unsigned int handle_bytes;
> +	int handle_type;
> +	/* File identifier.  */
> +	unsigned char f_handle[0];
> +};
> +#endif /* HAVE_STRUCT_FILE_HANDLE */
> +
>   #endif /* __LAPI_FCNTL_H__ */
> diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
> index 3484133d1..275db4ae0 100644
> --- a/include/lapi/name_to_handle_at.h
> +++ b/include/lapi/name_to_handle_at.h
> @@ -15,13 +15,6 @@
>   #include "tst_test.h"
> 
>   #ifndef HAVE_NAME_TO_HANDLE_AT
> -struct file_handle {
> -	unsigned int handle_bytes;
> -	int handle_type;
> -	/* File identifier.  */
> -	unsigned char f_handle[0];
> -};
> -
>   static inline int name_to_handle_at(int dfd, const char *pathname,
>                                       struct file_handle *handle,
>                                       int *mount_id, int flags)
> @@ -35,7 +28,7 @@ static inline int open_by_handle_at(int mount_fd, struct file_handle *handle,
>   {
>   	return tst_syscall(__NR_open_by_handle_at, mount_fd, handle, flags);
>   }
> -#endif
> +#endif /* HAVE_NAME_TO_HANDLE_AT */
> 
>   /* Returns a valid pointer on success, NULL on errors */
>   static inline struct file_handle *




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
