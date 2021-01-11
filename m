Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B622F19A1
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 16:28:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1142B3C5FD5
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 16:28:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 687BC3C06E2
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 16:28:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 755761000A36
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 16:28:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FDCCAB7A;
 Mon, 11 Jan 2021 15:28:37 +0000 (UTC)
Date: Mon, 11 Jan 2021 16:28:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-ID: <X/xupJgktrYI4LyG@pevik>
References: <20210111030704.5761-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111030704.5761-1-lizhijian@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] build.sh: Remove deprecated CROSS_COMPILE
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

Hi Li,

> The CROSS_COMPILE was no longer used by ltp since 400ac9bbe20.

> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  build.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/build.sh b/build.sh
> index 452cc6f4c..602ca419e 100755
> --- a/build.sh
> +++ b/build.sh
> @@ -64,7 +64,7 @@ build_cross()
>  	fi

>  	echo "===== cross-compile ${host} ${1}-tree build into $PREFIX ====="
> -	build $1 $2 "--host=$host" CROSS_COMPILE="${host}-"
I looked what would require CROSS_COMPILE support. It's somehow duplicate to
autoconf --host parameter.

Although it wouldn't be difficult to add a support into configure.ac and
include/mk/config.mk.in via AC_ARG_VAR, it's use would require:

1) either migrate everything to pkg-config (but libnuma and libaio does not
support it) and use PKG_CONFIG_LIBDIR

2) fix host cpu detection in m4/ltp-host-cpu.m4 (parse CROSS_COMPILE).

=> IMHO it's not worth of doing it, thus good we removed it.

Kind regards,
Petr

> +	build $1 $2 "--host=$host"
>  }

>  build()

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
