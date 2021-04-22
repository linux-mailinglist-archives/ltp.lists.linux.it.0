Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA4367796
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 04:51:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E84D73C8E8C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 04:51:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 803C43C1A34
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 04:51:50 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9CCBB100093B
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 04:51:49 +0200 (CEST)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FQhfw4VMHzWTPH;
 Thu, 22 Apr 2021 10:47:52 +0800 (CST)
Received: from dggpemm500003.china.huawei.com (7.185.36.56) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 22 Apr 2021 10:51:41 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500003.china.huawei.com (7.185.36.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Apr 2021 10:51:40 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Thu, 22 Apr 2021 10:51:40 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP][PATCH v4] syscalls/chown: Rewrite chown/chown03.c with the
 new api
Thread-Index: AQHXNa04FB4KsQ/2CkK/Mxc8Zd+Jsqq+WcSAgAF/frA=
Date: Thu, 22 Apr 2021 02:51:40 +0000
Message-ID: <c13fc2e2339e43f7908fb2d3f53cf745@huawei.com>
References: <20210419013427.247615-1-xieziyao@huawei.com>
 <20210420061954.155049-1-xieziyao@huawei.com> <YIATWfAJEvFhvZ77@yuki>
In-Reply-To: <YIATWfAJEvFhvZ77@yuki>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/chown: Rewrite chown/chown03.c with
 the new api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Thanks, I just made changes on your suggestions.

Please see: https://patchwork.ozlabs.org/project/ltp/patch/20210422024410.175538-1-xieziyao@huawei.com/

Best Regards,
Ziyao

-----Original Message-----
From: Cyril Hrubis [mailto:chrubis@suse.cz] 
Sent: Wednesday, April 21, 2021 7:58 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it; alexey.kodanev@oracle.com
Subject: Re: [LTP][PATCH v4] syscalls/chown: Rewrite chown/chown03.c with the new api

Hi!
> +	SAFE_SETEUID(0);
> +	SAFE_CHOWN(FILENAME, -1, 0);
> +	SAFE_CHMOD(FILENAME, NEW_PERMS);
> +	SAFE_SETEUID(ltpuser->pw_uid);
> +
> +	uid_t uid;
> +	gid_t gid;
> +	UID16_CHECK((uid = geteuid()), "chown");
> +	GID16_CHECK((gid = getegid()), "chown");
> +
> +	struct stat stat_buf;
> +	SAFE_STAT(FILENAME, &stat_buf);
> +	check_owner(&stat_buf, uid, 0);

We should check that the S_ISUID and S_ISGID bits are set here as well.

Otherwise it looks good to me.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
