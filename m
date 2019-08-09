Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C794E87B91
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 15:43:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B93E3C1D00
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 15:43:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3A5A63C1C70
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 15:43:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 15D3C100174B
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 15:43:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D6ABAD88;
 Fri,  9 Aug 2019 13:43:14 +0000 (UTC)
Date: Fri, 9 Aug 2019 15:43:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yixin Zhang <yixin.zhang@intel.com>
Message-ID: <20190809134313.GD32115@rei.lan>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
 <20190809062000.8671-5-yixin.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809062000.8671-5-yixin.zhang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp 5/5] runtest/numa: rename duplicated test cases
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

Hi!
> move_pages** is used in syscalls, rename them to move_pages**_numa here.

The test names in runtest files were never promised to be unique, if the
command line is the same the test id should probably stay the same.

> Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
> ---
>  runtest/numa | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/runtest/numa b/runtest/numa
> index 7885be90c..667eff773 100644
> --- a/runtest/numa
> +++ b/runtest/numa
> @@ -1,16 +1,16 @@
>  Numa-testcases numa01.sh
> -move_pages01 move_pages01
> -move_pages02 move_pages02
> -move_pages03 move_pages03
> -move_pages04 move_pages04
> -move_pages05 move_pages05
> -move_pages06 move_pages06
> -move_pages07 move_pages07
> -move_pages08 move_pages08
> -move_pages09 move_pages09
> -move_pages10 move_pages10
> -move_pages11 move_pages11
> -move_pages12 move_pages12
> +move_pages01_numa move_pages01
> +move_pages02_numa move_pages02
> +move_pages03_numa move_pages03
> +move_pages04_numa move_pages04
> +move_pages05_numa move_pages05
> +move_pages06_numa move_pages06
> +move_pages07_numa move_pages07
> +move_pages08_numa move_pages08
> +move_pages09_numa move_pages09
> +move_pages10_numa move_pages10
> +move_pages11_numa move_pages11
> +move_pages12_numa move_pages12
>  
>  set_mempolicy01 set_mempolicy01
>  set_mempolicy02 set_mempolicy02
> -- 
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
