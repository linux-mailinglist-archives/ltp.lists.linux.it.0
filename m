Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BADFDEBE55
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 08:12:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6918D3C2474
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 08:12:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 49E9B3C2469
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 08:12:47 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 682EC140180E
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 08:12:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 218BBAF7B;
 Fri,  1 Nov 2019 07:12:46 +0000 (UTC)
Date: Fri, 1 Nov 2019 08:12:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191101071244.GA4930@dell5510>
References: <a5174e749dd7b6089fa861b5369baf9f80c51ef8.1572269566.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5174e749dd7b6089fa861b5369baf9f80c51ef8.1572269566.git.jstancek@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pt_test: skip pt_disable_branch on Broadwell CPUs
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
Cc: ammy.yi@intel.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> commit d35869ba348d ("perf/x86/intel/pt: Allow the disabling of branch tracing")
> disallows not setting BRANCH_EN due to erratum BDM106 on Broadwell CPUs.

> Signed-off-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> @@ -145,6 +171,11 @@ static void setup(void)
>  	attr.size	= sizeof(struct perf_event_attr);
>  	attr.mmap			= 1;
>  	if (str_branch_flag) {
> +		if (is_affected_by_erratum_BDM106()) {
> +			tst_brk(TCONF, "erratum BDM106 disallows not "
> +				"setting BRANCH_EN on this CPU");
I'd join string (to be on single line), even it's longer than 80.
(better for grep)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
