Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 992B616F774
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:40:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4424C3C253A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:40:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B834D3C1C41
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:40:36 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id ED8641000485
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582695634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p46uMTfxTd62uN4HiM3ALTKIS57kPOhvlW1dCMJuOYg=;
 b=fqN+obk/AuF7gApLzPLqW442Z1RlnbpxxpvdkbKk9qaY2PEazdCPCWuzP4U6ZW1dNkAKxs
 8P+ap781nN9mHESESX1f8/wU8+aQdms1GRgCqGf36hfZBsReTOgOtH7/OxUYwhG+vLU2dk
 RrGcGRutle5I7DfIOXlv/6i8Boqs5nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-cADBlSlxMvWyJdU32kNk9w-1; Wed, 26 Feb 2020 00:40:30 -0500
X-MC-Unique: cADBlSlxMvWyJdU32kNk9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4BD2190B2BC;
 Wed, 26 Feb 2020 05:40:29 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1871CB;
 Wed, 26 Feb 2020 05:40:28 +0000 (UTC)
Date: Wed, 26 Feb 2020 13:51:04 +0800
From: Zorro Lang <zlang@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200226055104.GQ14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Viresh Kumar <viresh.kumar@linaro.org>,
	ltp@lists.linux.it
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <adc609fbfd9b8ccc31bb3dd6050af13d7126e2f2.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <adc609fbfd9b8ccc31bb3dd6050af13d7126e2f2.1582612624.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 02/10] lapi/fsmount.h: Add
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Feb 25, 2020 at 12:10:40PM +0530, Viresh Kumar wrote:
> Add a helper to check if the fsmount() related syscalls are supported by
> the kernel or not.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
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

Looks good to me.

> +{
> +	if ((tst_kvercmp(5, 2, 0)) < 0) {
> +		/* Check if the syscall is backported on an older kernel */
> +		TEST(syscall(__NR_fsopen, NULL, 0));
> +		if (TST_RET == -1 && TST_ERR == ENOSYS)
> +			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
> +	}
> +}
>  
>  #endif /* FSMOUNT_H__ */
> -- 
> 2.21.0.rc0.269.g1a574e7a288b
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
