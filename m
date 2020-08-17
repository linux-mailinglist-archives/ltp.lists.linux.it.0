Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 074EA24666C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:33:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B056F3C3017
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:33:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 054E03C3000
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:33:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6828F200B10
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:33:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF41DB05D;
 Mon, 17 Aug 2020 12:34:01 +0000 (UTC)
Date: Mon, 17 Aug 2020 14:34:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20200817123403.GA8445@yuki.lan>
References: <20200817120644.9401-1-po-hsu.lin@canonical.com>
 <20200817120644.9401-2-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817120644.9401-2-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_kvercmp: Add support to get distname
 for Ubuntu in tst_kvcmp_distname
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> * 4.4.0-187-generic
> * 5.4.0-1021-kvm
> * 4.15.0-1093-azure
> 
> So it's better to grep for ^ID=ubuntu in /etc/os-release to determine
> the distname, instead of doing this from checking kver substring like
> what we did for RHEL / Oracle Linux
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  lib/tst_kvercmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
> index dc3bb669b..349d45543 100644
> --- a/lib/tst_kvercmp.c
> +++ b/lib/tst_kvercmp.c
> @@ -139,6 +139,11 @@ const char *tst_kvcmp_distname(const char *kver)
>  	if (strstr(kver, ".el6"))
>  		return "RHEL6";
>  
> +	// Special case for Ubuntu, kernel version cannot reveal the dist_name
> +	int rc = WEXITSTATUS(system("grep -q ^ID=ubuntu /etc/os-release 2>/dev/null"));
> +	if (rc == 0)
> +		return "UBUNTU";

Can we please properly parse the /etc/os-release file insetad of this
hackery?

It should be as easy as one SAFE_FILE_SCANF() in the case that the file
exists.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
