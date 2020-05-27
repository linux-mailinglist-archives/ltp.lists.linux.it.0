Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1A1E3AE3
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:47:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9450E3C3245
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:47:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8620C3C321A
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:47:26 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1202A1A013C5
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:47:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590565644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0wzSIijzV4YZPY9xMXgXw3RlcfzXWbu5hxSAAKGe0E=;
 b=ZbqBJwQHTBLME9DZGytYGIT7sKxMUcijeWKgGEfvN+i1JJBXdFRo8BkL3CqFfUhDjl+/Oc
 A3eTpWAb3LBhq4Cz8SR8LU1Zkmknfe4m3BJ2lTl0olOH2YrVe6OnjE3wXX0MGsLw7W58yS
 ZE13vk66/Hlg0/LN3Ic++ajm/ASX6mE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-yy4lcH9JPce7lOuvl7hq7w-1; Wed, 27 May 2020 03:47:22 -0400
X-MC-Unique: yy4lcH9JPce7lOuvl7hq7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25D418FF674
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:47:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC541A7DB
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:47:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B51C418095FF;
 Wed, 27 May 2020 07:47:21 +0000 (UTC)
Date: Wed, 27 May 2020 03:47:21 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1946678285.13763431.1590565641700.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200527031430.22144-1-liwang@redhat.com>
References: <20200527031430.22144-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.28]
Thread-Topic: add new cgroup test API
Thread-Index: ZYI66yZaW2tgq0kn4qfwYnC5ZcysiA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/4] lib: add new cgroup test API
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
> +
> +static void tst_cgroup1_umount(const char *mnt_path, const char *new_path)
> +{
> +	FILE *fp;
> +	int fd;
> +	char s_new[BUFSIZ], s[BUFSIZ], value[BUFSIZ];
> +
> +	if (!tst_is_mounted(mnt_path))
> +		return;
> +
> +	/* Move all processes in task to its parent node. */
> +	sprintf(s, "%s/tasks", mnt_path);
> +	fd = open(s, O_WRONLY);
> +	if (fd == -1)
> +		tst_res(TWARN | TERRNO, "open %s", s);
> +
> +	snprintf(s_new, BUFSIZ, "%s/tasks", new_path);
> +	fp = fopen(s_new, "r");
> +	if (fp == NULL)
> +		tst_res(TWARN | TERRNO, "fopen %s", s_new);
> +	if ((fd != -1) && (fp != NULL)) {
> +		while (fgets(value, BUFSIZ, fp) != NULL)
> +			if (write(fd, value, strlen(value) - 1)
> +			    != (ssize_t)strlen(value) - 1)
> +				tst_res(TWARN | TERRNO, "write %s", s);
> +	}
> +	if (fd != -1)
> +		close(fd);
> +	if (fp != NULL)
> +		fclose(fp);
> +	if (rmdir(new_path) == -1)
> +		tst_res(TWARN | TERRNO, "rmdir %s", new_path);
> +	if (umount(mnt_path) == -1)
> +		tst_res(TWARN | TERRNO, "umount %s", mnt_path);
> +	if (rmdir(mnt_path) == -1)
> +		tst_res(TWARN | TERRNO, "rmdir %s", mnt_path);

This sequence looks almost identical to tst_cgroup2_umount(),
would be nice if code could be shared in some way.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
