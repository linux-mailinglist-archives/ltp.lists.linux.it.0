Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02637B8F5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 11:19:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 615323C6451
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 11:19:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5DF73C4CB1
 for <ltp@lists.linux.it>; Wed, 12 May 2021 11:19:25 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F29241A00FCF
 for <ltp@lists.linux.it>; Wed, 12 May 2021 11:19:23 +0200 (CEST)
Received: from dggeml716-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fg8JT2mtHz19NfK
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:15:05 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml716-chm.china.huawei.com (10.3.17.127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 17:19:20 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 17:19:20 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210506074621.167505-1-xieziyao@huawei.com>
 <YJuRKEfwChqpx70G@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <058aa633-85cb-5378-be56-2be574d55adc@huawei.com>
Date: Wed, 12 May 2021 17:19:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJuRKEfwChqpx70G@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/chown: Rewrite chown/chown04.c with
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> FYI this is needed for proper docparse formatting:
> 
> /*\
>   * [Description]
>   *
>   * Verify that:
>   *
>   * 1. chown(2) returns -1 and sets errno to EPERM if the effective user id
>   *    of process does not match the owner of the file and the process is not
>   *    super user
>   * 2. chown(2) returns -1 and sets errno to EACCES if search permission is
>   *    denied on a component of the path prefix
>   * 3. chown(2) returns -1 and sets errno to EFAULT if pathname points outside
>   *    user's accessible address space
>   * 4. chown(2) returns -1 and sets errno to ENAMETOOLONG if the pathname
>   *    component is too long
>   * 5. chown(2) returns -1 and sets errno to ENOENT if the specified file does
>   *    not exists
>   * 6. chown(2) returns -1 and sets errno to ENOTDIR if the directory component
>   *    in pathname is not a directory
>   * 7. chown(2) returns -1 and sets errno to ELOOP if too many symbolic links
>   *    were encountered in resolving pathname
>   * 8. chown(2) returns -1 and sets errno to EROFS if the named file resides on
>   *    a read-only filesystem
>   */
Already modified. Thanks for your review, Petr.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
