Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 341E4A85EA
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 17:06:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8A6D3C2121
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 17:06:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D42693C207F
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 17:06:10 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3FE766012DE
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 17:06:09 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=calabresa)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <cascardo@canonical.com>)
 id 1i5WKj-0003z2-32; Wed, 04 Sep 2019 14:32:29 +0000
Date: Wed, 4 Sep 2019 11:32:25 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: shuang.qiu@oracle.com
Message-ID: <20190904143224.GH4101@calabresa>
References: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise09:Change PAGES size to the value more
 than 32
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

On Wed, Sep 04, 2019 at 02:00:23PM +0800, shuang.qiu@oracle.com wrote:
> From: Shuang Qiu <shuang.qiu@oracle.com>
> 
> In upstream patch 1a61ab (mm: memcontrol: replace zone summing with lruvec_page_state()),
> it modify the lruvec state in batch,equal and less than 32 MADV_FREE pages will not trigger
> the account of lruvec_stat,and will not be free in memory pressure either.
> So the testcase may fail with:
> ...
> madvise09.c:219: INFO: Memory hungry child 6178 started, try 10
> madvise09.c:254: INFO: Memory map: pppppppppppppppppppppppppppppppp
> madvise09.c:259: FAIL: No MADV_FREE page was freed on low memory
> ...
> Change the PAGES to the value more than 32 can fix such issue.
> 
> Signed-off-by: Shuang Qiu <shuang.qiu@oracle.com>

On ppc64le, I was getting retries, as OOM was getting hit. The test would
ultimately time out. This fixes it for me.

Thanks.
Cascardo.

Tested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

> ---
>  testcases/kernel/syscalls/madvise/madvise09.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/madvise/madvise09.c b/testcases/kernel/syscalls/madvise/madvise09.c
> index 01075f6..3759053 100644
> --- a/testcases/kernel/syscalls/madvise/madvise09.c
> +++ b/testcases/kernel/syscalls/madvise/madvise09.c
> @@ -57,7 +57,7 @@ static int sleep_between_faults;
>  
>  static int swap_accounting_enabled;
>  
> -#define PAGES 32
> +#define PAGES 64
>  #define TOUCHED_PAGE1 0
>  #define TOUCHED_PAGE2 10
>  
> -- 
> 1.9.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
