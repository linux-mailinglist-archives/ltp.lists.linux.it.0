Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A761A76FD25
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Aug 2023 11:23:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DC6B3CD4FA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Aug 2023 11:23:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EAFB23CD428
 for <ltp@lists.linux.it>; Fri,  4 Aug 2023 11:23:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 36E3D1401255
 for <ltp@lists.linux.it>; Fri,  4 Aug 2023 11:23:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8799121874;
 Fri,  4 Aug 2023 09:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691140994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7q7OH6Y66jDE41GbWtZGD079FT0CkSDzBHGvuvmjwow=;
 b=cgSOahT4Je95xG+gyPoyBHQCO6i6d2b/CJ+58Gi0nTEB77QuQvji8BdhjNGNmHMBYYsuDQ
 cz5Agr+GbTWbktMFDINVT5bIQ/dG22g5TJwA8CHNx+ob30zKF1zqn0vbK0jPz4FEGRuD8Y
 JDY47ZPnDdd+2bH2hzdWiOmJ7ZBR+XM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691140994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7q7OH6Y66jDE41GbWtZGD079FT0CkSDzBHGvuvmjwow=;
 b=aBWLO7KBSX8c9FfYbqWO1g5EBhFQePl2PO34oeK6o29HzU3wjaI9ruiW04hBJMEQHuFL9o
 p7XeUPyj1q7zmADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71B1813904;
 Fri,  4 Aug 2023 09:23:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id unfeGoLDzGTyFAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 04 Aug 2023 09:23:14 +0000
Message-ID: <7923d5ec-9160-d989-ff5d-fd63a5074c57@suse.cz>
Date: Fri, 4 Aug 2023 11:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
References: <20230727150013.31835-1-mdoucha@suse.cz>
 <20230727150013.31835-3-mdoucha@suse.cz>
Content-Language: en-US
In-Reply-To: <20230727150013.31835-3-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add test for CVE 2023-1829
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

Hi,
I've noticed some kernel messages complaining that there's leftover data 
at the end of the filter setup rtnetlink query. I need to investigate a 
bit more and I'll send v2 for this patch. The other two patches can be 
merged as is.

On 27. 07. 23 17:00, Martin Doucha wrote:
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>   runtest/cve               |   1 +
>   testcases/cve/.gitignore  |   1 +
>   testcases/cve/tcindex01.c | 156 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 158 insertions(+)
>   create mode 100644 testcases/cve/tcindex01.c
> 
> diff --git a/runtest/cve b/runtest/cve
> index 7d1e84f89..f9b36a182 100644
> --- a/runtest/cve
> +++ b/runtest/cve
> @@ -84,6 +84,7 @@ cve-2021-38604 mq_notify03
>   cve-2022-0847 dirtypipe
>   cve-2022-2590 dirtyc0w_shmem
>   cve-2022-23222 bpf_prog07
> +cve-2023-1829 tcindex01
>   # Tests below may cause kernel memory leak
>   cve-2020-25704 perf_event_open03
>   cve-2022-0185 fsconfig03
> diff --git a/testcases/cve/.gitignore b/testcases/cve/.gitignore
> index 90e8b191c..389354eaf 100644
> --- a/testcases/cve/.gitignore
> +++ b/testcases/cve/.gitignore
> @@ -12,3 +12,4 @@ cve-2017-16939
>   cve-2017-17053
>   cve-2022-4378
>   icmp_rate_limit01
> +tcindex01.c
> diff --git a/testcases/cve/tcindex01.c b/testcases/cve/tcindex01.c
> new file mode 100644
> index 000000000..89569d1f7
> --- /dev/null
> +++ b/testcases/cve/tcindex01.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 SUSE LLC <mdoucha@suse.cz>
> + */
> +
> +/*\
> + * CVE-2023-1829
> + *
> + * Test for use-after-free after removing tcindex traffic filter with certain
> + * parameters.
> + *
> + * Tcindex filter removed in:
> + *
> + *  commit 8c710f75256bb3cf05ac7b1672c82b92c43f3d28
> + *  Author: Jamal Hadi Salim <jhs@mojatatu.com>
> + *  Date:   Tue Feb 14 08:49:14 2023 -0500
> + *
> + *  net/sched: Retire tcindex classifier
> + */
> +
> +#include <linux/netlink.h>
> +#include <linux/pkt_sched.h>
> +#include <linux/pkt_cls.h>
> +#include <linux/tc_act/tc_gact.h>
> +#include "tst_test.h"
> +#include "tst_rtnetlink.h"
> +#include "tst_netdevice.h"
> +#include "lapi/sched.h"
> +#include "lapi/if_ether.h"
> +#include "lapi/rtnetlink.h"
> +
> +#define DEVNAME "ltp_dummy1"
> +
> +static const uint32_t qd_handle = TC_H_MAKE(1 << 16, 0);
> +static const uint32_t clsid = TC_H_MAKE(1 << 16, 1);
> +static const uint32_t shift = 10;
> +static const uint16_t mask = 0xffff;
> +
> +/* rtnetlink payloads */
> +static const struct tc_htb_glob qd_opt = {
> +	.rate2quantum = 10,
> +	.version = 3,
> +	.defcls = 30
> +};
> +static const struct tc_gact f_gact_param = {
> +	.action = TC_ACT_SHOT
> +};
> +static struct tc_htb_opt cls_opt = {};
> +
> +/* htb qdisc and class options */
> +static const struct tst_rtnl_attr_list qd_config[] = {
> +	{TCA_OPTIONS, NULL, 0, (const struct tst_rtnl_attr_list[]){
> +		{TCA_HTB_INIT, &qd_opt, sizeof(qd_opt), NULL},
> +		{0, NULL, -1, NULL}
> +	}},
> +	{0, NULL, -1, NULL}
> +};
> +static const struct tst_rtnl_attr_list cls_config[] = {
> +	{TCA_OPTIONS, NULL, 0, (const struct tst_rtnl_attr_list[]){
> +		{TCA_HTB_PARMS, &cls_opt, sizeof(cls_opt), NULL},
> +		{0, NULL, -1, NULL}
> +	}},
> +	{0, NULL, -1, NULL}
> +};
> +
> +/* tcindex filter options */
> +static const struct tst_rtnl_attr_list f_actopts[] = {
> +	{TCA_GACT_PARMS, &f_gact_param, sizeof(f_gact_param), NULL},
> +	{0, NULL, -1, NULL}
> +};
> +static const struct tst_rtnl_attr_list f_action[] = {
> +	{1, NULL, 0, (const struct tst_rtnl_attr_list[]){
> +		{TCA_ACT_KIND, "gact", 5, NULL},
> +		{TCA_ACT_OPTIONS | NLA_F_NESTED, NULL, 0, f_actopts},
> +		{0, NULL, -1, NULL}
> +	}},
> +	{0, NULL, -1, NULL}
> +};
> +static const struct tst_rtnl_attr_list f_config[] = {
> +	{TCA_OPTIONS, NULL, 0, (const struct tst_rtnl_attr_list[]){
> +		{TCA_TCINDEX_MASK, &mask, sizeof(mask), NULL},
> +		{TCA_TCINDEX_SHIFT, &shift, sizeof(shift), NULL},
> +		{TCA_TCINDEX_CLASSID, &clsid, sizeof(clsid), NULL},
> +		{TCA_TCINDEX_ACT, &clsid, sizeof(clsid), f_action},
> +		{0, NULL, -1, NULL}
> +	}},
> +	{0, NULL, -1, NULL}
> +};
> +
> +static void setup(void)
> +{
> +	tst_setup_netns();
> +	NETDEV_ADD_DEVICE(DEVNAME, "dummy");
> +
> +	cls_opt.rate.rate = cls_opt.ceil.rate = 256000;
> +	cls_opt.buffer = 1000000 * 1600 / cls_opt.rate.rate;
> +	cls_opt.cbuffer = 1000000 * 1600 / cls_opt.ceil.rate;
> +}
> +
> +static void run(void)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 100; i++) {
> +		NETDEV_ADD_QDISC(DEVNAME, AF_UNSPEC, TC_H_ROOT, qd_handle,
> +			"htb", qd_config);
> +		NETDEV_ADD_TRAFFIC_CLASS(DEVNAME, qd_handle, clsid, "htb",
> +			cls_config);
> +		NETDEV_ADD_TRAFFIC_FILTER(DEVNAME, qd_handle, 10, ETH_P_IP, 1,
> +			"tcindex", f_config);
> +		NETDEV_REMOVE_TRAFFIC_FILTER(DEVNAME, qd_handle, 10, ETH_P_IP,
> +			1, "tcindex");
> +
> +		/* Wait at least one jiffy for use-after-free */
> +		usleep(10000);
> +
> +		NETDEV_REMOVE_QDISC(DEVNAME, AF_UNSPEC, TC_H_ROOT, qd_handle,
> +			"htb");
> +	}
> +
> +	if (tst_taint_check()) {
> +		tst_res(TFAIL, "Kernel is vulnerable");
> +		return;
> +	}
> +
> +	tst_res(TPASS, "Nothing bad happened (yet)");
> +}
> +
> +static void cleanup(void)
> +{
> +	NETDEV_REMOVE_DEVICE(DEVNAME);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.taint_check = TST_TAINT_W | TST_TAINT_D,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_VETH",
> +		"CONFIG_USER_NS=y",
> +		"CONFIG_NET_NS=y",
> +		"CONFIG_NET_SCH_HTB",
> +		"CONFIG_NET_CLS_TCINDEX",
> +		NULL
> +	},
> +	.save_restore = (const struct tst_path_val[]) {
> +		{"/proc/sys/user/max_user_namespaces", "1024", TST_SR_SKIP},
> +		{}
> +	},
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "8c710f75256b"},
> +		{"CVE", "2023-1829"},
> +		{}
> +	}
> +};

-- 
Martin Doucha   mdoucha@suse.cz
SW Quality Engineer
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
