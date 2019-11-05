Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E69CFEFDE9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:05:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A74553C22CD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:05:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2E47E3C22B8
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:05:07 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CACB46012C7
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:05:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1748EB196
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:05:06 +0000 (UTC)
Date: Tue, 5 Nov 2019 14:05:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20191105130505.GD8511@rei.lan>
References: <20191105120053.9173-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105120053.9173-1-chrubis@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test: Warn on repeated options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Jan Stancek <jstancek@redhat.com>
> ---
>  lib/tst_test.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index c7b46d0d5..f41baf3cf 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -468,6 +468,9 @@ static void parse_topt(unsigned int topts_len, int opt, char *optarg)
>  	if (i >= topts_len)
>  		tst_brk(TBROK, "Invalid option '%c' (should not happen)", opt);
>  
> +	if (*toptions[i].arg)
> +		tst_res(TWARN, "Option passed -%c multiple times", opt);

Obviously the -%c and passed should be swapped, I can do that before
pushing if the patch gets ack.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
