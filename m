Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6423658C9
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 14:17:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F28113C6D0F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 14:17:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 37AFB3C1D6B
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 14:17:38 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6D1E510006B8
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 14:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618921056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkfSgvtHHkjjOx6x2X4foJsYvjhvkhAubWzRc9b0o+s=;
 b=b+b6EFgPmLne77DPm/8QwYm7jEZzAtA5rMr8grufildjWV1ZhpMWLDMA/enzMxYzucbzmc
 ys5gsq+AczoRGfeQZH6ufKrG7W8WLRKEhCglzpGVJEnrVv0RwsrC9EZUIPWACsJlZ4N5hU
 qeJuOSCF9n5yg1YyZbV47OBH604h6JE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-EsBOuANjPJqLPBjwlH9cSg-1; Tue, 20 Apr 2021 08:17:31 -0400
X-MC-Unique: EsBOuANjPJqLPBjwlH9cSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26AE21006C80;
 Tue, 20 Apr 2021 12:17:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E90DA5D9CA;
 Tue, 20 Apr 2021 12:17:29 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D51E24A702;
 Tue, 20 Apr 2021 12:17:29 +0000 (UTC)
Date: Tue, 20 Apr 2021 08:17:29 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <728318760.8908748.1618921049585.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210420075351.16059-1-liwang@redhat.com>
References: <20210420075351.16059-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.13, 10.4.195.19]
Thread-Topic: mkfs: print more info for debugging
Thread-Index: 5qqW7Y9RRey3landLhfpHYd6/udkew==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: print more info for debugging
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
Cc: xuyang2018 jy <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> We can NOT reproduce the problem by manual with both ppc64le and s390x,
> so let's print more useful info from test when getting fail.

It's mkfs_verify_size, test expects to find 90% blocks (of device size),
but lately we miss that by ~1-2%:

# mkfs.ext3 /dev/loop0 16000
mke2fs 1.46.2 (28-Feb-2021)
/dev/loop0 contains a ext3 file system
        created on Fri Apr 16 05:09:23 2021
Proceed anyway? (y,N) y
Discarding device blocks: done
Creating filesystem with 16000 1k blocks and 4000 inodes
Filesystem UUID: d66c4c37-13ce-41df-b3c4-345ec1641e1f
Superblock backups stored on blocks:
        8193

Allocating group tables: done
Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

 mount /dev/loop0  /mnt/test
# df -T
Filesystem                           Type      1K-blocks      Used  Available Use% Mounted on
/dev/loop0                           ext3          14343        19      13524   1% /mnt/test


> 
>  mkfs01 1 TPASS: 'mkfs -t ext4  /dev/loop0 ' passed.
>  mkfs01 2 TFAIL: 'mkfs -t ext4  /dev/loop0 16000' failed, not expected.
>  mkfs01 3 TPASS: 'mkfs -t ext4 -c /dev/loop0 ' passed.
>  mkfs01 4 TPASS: 'mkfs -V   ' passed.
>  mkfs01 5 TPASS: 'mkfs -h   ' passed.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/commands/mkfs/mkfs01.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/commands/mkfs/mkfs01.sh
> b/testcases/commands/mkfs/mkfs01.sh
> index 90368190d..55296c8df 100755
> --- a/testcases/commands/mkfs/mkfs01.sh
> +++ b/testcases/commands/mkfs/mkfs01.sh
> @@ -128,7 +128,8 @@ mkfs_test()
>  	if [ -n "$device" ]; then
>  		mkfs_verify_type "$fs_type" "$device"
>  		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> +			tst_res TFAIL "'${mkfs_cmd}' failed, not expected type."
> +			cat temp
>  			return
>  		fi
>  	fi
> @@ -136,7 +137,8 @@ mkfs_test()
>  	if [ -n "$size" ]; then
>  		mkfs_verify_size "$fs_type" "$size"
>  		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> +			tst_res TFAIL "'${mkfs_cmd}' failed, not expected size."
> +			cat temp
>  			return
>  		fi
>  	fi
> --
> 2.30.2
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
