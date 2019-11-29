Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA57710D556
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 13:01:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 586B63C2399
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 13:01:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C2C483C2078
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 13:01:43 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 143D620167E
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 13:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575028901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLLuD4Pq7tP8sx9isSDsLC4/x8nP5XvZX7rSPzxVYH0=;
 b=TSNhJCNst2XWYCbgMJYSwgavIgIV76dkM4z7X1RLBBmr8FIK7l+NU1Ov6GPdbHKWX9uH4X
 i/ZfvZ3NdMgkO209tKHkIFRAh2KN6DRFJTS1OLmJkTMZ86NxQbUVOOeFHaGfTocTVxWXSf
 0QWqSY8JPLEwB0EqaeBe5ly03DkTcrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-2-2i19weMoiUB_nX92UQLw-1; Fri, 29 Nov 2019 07:01:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5DD80183C;
 Fri, 29 Nov 2019 12:01:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51DEC600C8;
 Fri, 29 Nov 2019 12:01:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4683B1809565;
 Fri, 29 Nov 2019 12:01:36 +0000 (UTC)
Date: Fri, 29 Nov 2019 07:01:36 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <26933665.14359191.1575028896043.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191128093610.6903-2-mdoucha@suse.cz>
References: <20191128093610.6903-1-mdoucha@suse.cz>
 <20191128093610.6903-2-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.23]
Thread-Topic: Use real FS block size in fallocate05
Thread-Index: DkY80mTU46Rl/Ud7sCex6K4bhoPsMw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 2-2i19weMoiUB_nX92UQLw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Use real FS block size in fallocate05
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

Hi,

<snip>

>  
>  static void run(void)
>  {
> -	char buf[FALLOCATE_SIZE];
> -	ssize_t ret;
> +	size_t bufsize, i;
> +	struct stat statbuf;
>  
>  	fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT);
>  
> -	if (fallocate(fd, 0, 0, FALLOCATE_SIZE)) {
> -		if (errno == EOPNOTSUPP) {
> -			tst_res(TCONF | TERRNO, "fallocate() not supported");
> +	// Use real FS block size, otherwise fallocate() call will test
> +	// different things on different platforms

Style guide favors c-style comments.

> +	SAFE_FSTAT(fd, &statbuf);
> +	bufsize = FALLOCATE_BLOCKS * statbuf.st_blksize;
> +	buf = realloc(buf, bufsize);
> +
> +	if (!buf) {
> +		tst_brk(TBROK, "Buffer allocation failed");
> +		SAFE_CLOSE(fd);
> +		return;

Anything after TBROK will be unreachable.

> +	}
> +
> +	TEST(fallocate(fd, 0, 0, bufsize));
> +
> +	if (TST_RET) {
> +		if (errno == ENOTSUP) {

TEST_ERR

> +			tst_res(TCONF | TTERRNO, "fallocate() not supported");

tst_brk would make more sense here. If we fail here we can end the test.

>  			SAFE_CLOSE(fd);
>  			return;
>  		}
>  
> -		tst_brk(TBROK | TERRNO,
> -			"fallocate(fd, 0, 0, %i)", FALLOCATE_SIZE);
> +		tst_brk(TBROK | TTERRNO, "fallocate(fd, 0, 0, %i)", bufsize);
>  	}
>  
>  	tst_fill_fs(MNTPOINT, 1);
>  
> -	ret = write(fd, buf, sizeof(buf));
> +	TEST(write(fd, buf, bufsize));
>  
> -	if (ret < 0)
> -		tst_res(TFAIL | TERRNO, "write() failed unexpectedly");
> +	if (TST_RET < 0)
> +		tst_res(TFAIL | TTERRNO, "write() failed unexpectedly");
> +	else if (TST_RET != bufsize)
> +		tst_res(TFAIL,
> +			"Short write(): %ld bytes (expected %zu)",
> +			TST_RET, bufsize);
>  	else
> -		tst_res(TPASS, "write() wrote %zu bytes", ret);
> +		tst_res(TPASS, "write() wrote %ld bytes", TST_RET);
>  
> -	ret = fallocate(fd, 0, FALLOCATE_SIZE, FALLOCATE_SIZE);
> -	if (ret != -1)
> +	// fallocate(1 block) may pass here on XFS. Original test allocated
> +	// 8KB (2 blocks on x86) so keep the original behavior.
> +	TEST(fallocate(fd, 0, bufsize, 2 * statbuf.st_blksize));

I don't understand why there is need to find minimum value that can
satisfy this check. It looks like we are testing tst_fill_fs() more
than fallocate().

In other words, what is wrong with current test? Is the problem that
FALLOCATE_SIZE (1M) is not aligned on all platforms? Or is the test
invalid with FALLOCATE_SIZE that big? Or both?

<snip>

>  
> @@ -80,6 +102,9 @@ static void cleanup(void)
>  {
>  	if (fd > 0)
>  		SAFE_CLOSE(fd);
> +
> +	if (buf)

Check is not needed, free() can handle NULL.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
