Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7617BD0D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:47:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81CEE3C63AF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:47:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 78A5F3C176C
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:47:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 04F031A00F5B
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:47:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 311D7B19C;
 Fri,  6 Mar 2020 12:47:50 +0000 (UTC)
Date: Fri, 6 Mar 2020 13:47:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200306124749.GB3375@rei.lan>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <21026a48ffa25ed8b09616cb939dc417459d2d74.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21026a48ffa25ed8b09616cb939dc417459d2d74.1582779464.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 02/10] lapi/fsmount.h: Add
 fsopen_supported_by_kernel()
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Feb 27, 2020 at 10:44:30AM +0530, Viresh Kumar wrote:
> Add a helper to check if the fsmount() related syscalls are supported by
> the kernel or not.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Acked-by: Li Wang <liwang@redhat.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/lapi/fsmount.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
> index 87f2f229c371..a6a24904e66d 100644
> --- a/include/lapi/fsmount.h
> +++ b/include/lapi/fsmount.h
> @@ -130,5 +130,14 @@ enum fsconfig_command {
>  
>  #endif /* OPEN_TREE_CLONE */
>  
> +void fsopen_supported_by_kernel(void)
> +{
> +	if ((tst_kvercmp(5, 2, 0)) < 0) {
> +		/* Check if the syscall is backported on an older kernel */
> +		TEST(syscall(__NR_fsopen, NULL, 0));
> +		if (TST_RET == -1 && TST_ERR == ENOSYS)
> +			tst_brk(TCONF, "Test not supported on kernel version < v5.2");

		Shouldn't we close the TST_RET here?

> +	}
> +}
>  
>  #endif /* FSMOUNT_H__ */
> -- 
> 2.21.0.rc0.269.g1a574e7a288b
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
