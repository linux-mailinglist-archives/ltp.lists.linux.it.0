Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4AA37B7DC
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:26:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D1843C6449
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:26:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0579D3C4CCD
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:26:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 623E7600C7C
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:26:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98C72AF11;
 Wed, 12 May 2021 08:26:17 +0000 (UTC)
Date: Wed, 12 May 2021 10:26:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YJuRKEfwChqpx70G@pevik>
References: <20210506074621.167505-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506074621.167505-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

>  testcases/kernel/syscalls/chown/chown04.c | 228 +++++++---------------
...
> +/*\
> + * [Description]
>   *
> - * Test Description:
> - *   Verify that,
> - *   1) chown(2) returns -1 and sets errno to EPERM if the effective user id
> - *		 of process does not match the owner of the file and the process
> - *		 is not super user.
> - *   2) chown(2) returns -1 and sets errno to EACCES if search permission is
> - *		 denied on a component of the path prefix.
> - *   3) chown(2) returns -1 and sets errno to EFAULT if pathname points
> - *		 outside user's accessible address space.
> - *   4) chown(2) returns -1 and sets errno to ENAMETOOLONG if the pathname
> - *		 component is too long.
> - *   5) chown(2) returns -1 and sets errno to ENOTDIR if the directory
> - *		 component in pathname is not a directory.
> - *   6) chown(2) returns -1 and sets errno to ENOENT if the specified file
> - *		 does not exists.
> + * Verify that,
> + * 1) chown(2) returns -1 and sets errno to EPERM if the effective user id
> + *    of process does not match the owner of the file and the process is not
> + *    super user
> + * 2) chown(2) returns -1 and sets errno to EACCES if search permission is
> + *    denied on a component of the path prefix
> + * 3) chown(2) returns -1 and sets errno to EFAULT if pathname points outside
> + *    user's accessible address space
> + * 4) chown(2) returns -1 and sets errno to ENAMETOOLONG if the pathname
> + *    component is too long
> + * 5) chown(2) returns -1 and sets errno to ENOENT if the specified file does
> + *    not exists
> + * 6) chown(2) returns -1 and sets errno to ENOTDIR if the directory component
> + *    in pathname is not a directory
> + * 7) chown(2) returns -1 and sets errno to ELOOP if too many symbolic links
> + *    were encountered in resolving pathname
> + * 8) chown(2) returns -1 and sets errno to EROFS if the named file resides on
> + *    a read-only filesystem
>   */

FYI this is needed for proper docparse formatting:

/*\
 * [Description]
 *
 * Verify that:
 *
 * 1. chown(2) returns -1 and sets errno to EPERM if the effective user id
 *    of process does not match the owner of the file and the process is not
 *    super user
 * 2. chown(2) returns -1 and sets errno to EACCES if search permission is
 *    denied on a component of the path prefix
 * 3. chown(2) returns -1 and sets errno to EFAULT if pathname points outside
 *    user's accessible address space
 * 4. chown(2) returns -1 and sets errno to ENAMETOOLONG if the pathname
 *    component is too long
 * 5. chown(2) returns -1 and sets errno to ENOENT if the specified file does
 *    not exists
 * 6. chown(2) returns -1 and sets errno to ENOTDIR if the directory component
 *    in pathname is not a directory
 * 7. chown(2) returns -1 and sets errno to ELOOP if too many symbolic links
 *    were encountered in resolving pathname
 * 8. chown(2) returns -1 and sets errno to EROFS if the named file resides on
 *    a read-only filesystem
 */

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
