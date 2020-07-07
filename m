Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F92216DF1
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 15:40:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD0263C5497
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 15:40:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A534A3C29CA
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 15:40:51 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B4A3114016F9
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 15:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594129249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Nsc9iWOw8LaiWg7+UJ5FXYF7MTXlquCxptbAJcoFOk=;
 b=ezY67cIVzM/n8BBtQ16kJ4AmHMv77tjm6ZjoBM3+9ofw8jKtc5Vu4rG/vEd4XuP7BTe/mx
 8VfrAKGp2xIej2OMcfFjgVt278XonfwjXZS5BDUtxaCqHz2V78c2jGNKEFieAld3GW0qwd
 fd0B54VrE8Blk6QVkjg163Nq3y5fYFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-CUTRxLNZPy6buKSpTv07Tw-1; Tue, 07 Jul 2020 09:40:47 -0400
X-MC-Unique: CUTRxLNZPy6buKSpTv07Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F33D100A8E8;
 Tue,  7 Jul 2020 13:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 887BD5C1BB;
 Tue,  7 Jul 2020 13:40:46 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C2EC72F43;
 Tue,  7 Jul 2020 13:40:46 +0000 (UTC)
Date: Tue, 7 Jul 2020 09:40:46 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <150668383.1091545.1594129246387.JavaMail.zimbra@redhat.com>
In-Reply-To: <1594016612-7975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1594016612-7975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.13]
Thread-Topic: syscalls/ioctl09: Add test for BLKRRPART ioctl
Thread-Index: OtxomXCRnPfgiJZWMc941K9cd/hnHw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl09: Add test for BLKRRPART ioctl
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



----- Original Message -----

Hi,

> +static void verify_ioctl(void)
> +{
> +	const char *const cmd_parted_old[] = {"parted", "-s", "test.img",
> "mklabel", "msdos", "mkpart",
> +						"primary", "ext4", "1M", "10M", NULL};
> +	const char *const cmd_parted_new[] = {"parted", "-s", "test.img",
> "mklabel", "msdos", "mkpart",
> +						"primary", "ext4", "1M", "10M", "mkpart", "primary", "ext4", "10M",
> "20M", NULL};

^^ These (and other lines) goe way over 80 characters.

> +	struct loop_info loopinfo = {0};
> +
> +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> +	if (dev_num < 0)
> +		tst_brk(TBROK, "Failed to find free loop device");
> +
> +	tst_fill_file("test.img", 0, 1024 * 1024, 20);

20MB feels a bit small, even though tests I ran passed on old and new kernels.
LTP default is 256, to cover various filesystems, but here we don't even
write anything..

Other than that, it looks good to me:
Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
