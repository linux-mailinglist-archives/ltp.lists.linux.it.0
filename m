Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F24366A87
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 14:13:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 123163C6C0C
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 14:13:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD64D3C2B59
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 14:13:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 43F80200FEF
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 14:13:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85ECDB300;
 Wed, 21 Apr 2021 12:13:01 +0000 (UTC)
Date: Wed, 21 Apr 2021 13:58:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YIATWfAJEvFhvZ77@yuki>
References: <20210419013427.247615-1-xieziyao@huawei.com>
 <20210420061954.155049-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420061954.155049-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

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
