Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76482788306
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Aug 2023 11:08:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D1003CC3AF
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Aug 2023 11:08:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 960FD3C99CF
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 11:08:25 +0200 (CEST)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com
 [207.54.90.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CAA8C601103
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 11:08:24 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="129494046"
X-IronPort-AV: E=Sophos;i="6.02,195,1688396400"; d="scan'208";a="129494046"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 18:08:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com
 [192.168.87.61])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 716C3D29E5
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 18:08:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AC70D6168
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 18:08:19 +0900 (JST)
Received: from [10.167.215.54] (unknown [10.167.215.54])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA24E20093094;
 Fri, 25 Aug 2023 18:08:18 +0900 (JST)
Message-ID: <5e20821e-ae06-4727-b13d-35d17e4099b4@fujitsu.com>
Date: Fri, 25 Aug 2023 17:08:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Yang Xu <xuyang2018.jy@fujitsu.com>, ltp@lists.linux.it
References: <1692875480-22494-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1692875480-22494-2-git-send-email-xuyang2018.jy@fujitsu.com>
From: Xiao Yang <yangx.jy@fujitsu.com>
In-Reply-To: <1692875480-22494-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27834.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27834.006
X-TMASE-Result: 10--10.126100-10.000000
X-TMASE-MatchedRID: X+fKKgQJwrGPvrMjLFD6eDBgCmbnj9Jmyi3S0YyyoadWjSWvFszxq4u3
 renu5Y0wbJfPbBoXyMOxUiJMMML0+y/7QU2czuUNA9lly13c/gGOQOsE4nDCdE/iZtdWk1e4VXF
 z93jC3xc0Ud/DTXbN05GTpe1iiCJq71zr0FZRMbBwK7mZ44aKbgLDAYP4AXVR7nY51lwLq08gBw
 KKRHe+r8kvU/63TsDp1ERlD7FKQTrmr5HinthWXdWFMIaRkmOKuCFUxy02ESg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.6 required=7.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] hugeshmctl03: Mark struct tcase as static
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

The same comment as I said on hugeshmctl01.
Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>

Best Regards,
Xiao Yang

On 2023/8/24 19:11, Yang Xu wrote:
> To follow LTP conventions.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>   testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
> index 21ec6bf78..61e9704bb 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
> @@ -44,7 +44,7 @@ static struct shmid_ds buf;
>   static uid_t ltp_uid;
>   static char *ltp_user = "nobody";
>   
> -struct tcase {
> +static struct tcase {
>   	int *shmid;
>   	int cmd;
>   	struct shmid_ds *sbuf;
> @@ -97,7 +97,7 @@ static void do_child(void)
>   	}
>   }
>   
> -void setup(void)
> +static void setup(void)
>   {
>   	long hpage_size;
>   
> @@ -118,7 +118,7 @@ void setup(void)
>   	ltp_uid = getuserid(ltp_user);
>   }
>   
> -void cleanup(void)
> +static void cleanup(void)
>   {
>   	rm_shm(shm_id_1);
>   }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
