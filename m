Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31D262AB1
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:44:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BE6B3C2C98
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:44:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3327B3C262C
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:44:12 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 4170D1A009BB
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599641050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CApwAjM+8mvgVSc/9i8h+J1J0l1HUhtLNYjoLHo6KlQ=;
 b=VeBtzzIss1VOuTL0g2GUIjquXp3/QLM0Mpi/u+alVZ71WTuAxNl+DFAgzOq80zbD6pnvAE
 k0baku/mufa0XCne8hRvmNu7QY+BqylYB2YETn76dd5Nd6OUtsbsEmlfia0wlupHkyE3Cf
 LzykuiotK6wZHKvoXD7YTflIq+xx938=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-ZcZnzl-6NEamaS0QAKGbYQ-1; Wed, 09 Sep 2020 04:44:09 -0400
X-MC-Unique: ZcZnzl-6NEamaS0QAKGbYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A3D10ABDA2;
 Wed,  9 Sep 2020 08:44:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DCF77EED4;
 Wed,  9 Sep 2020 08:44:08 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0433B18095FF;
 Wed,  9 Sep 2020 08:44:08 +0000 (UTC)
Date: Wed, 9 Sep 2020 04:44:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1908270893.11577594.1599641047815.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200909075347.2863-1-liwang@redhat.com>
References: <20200909075347.2863-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.193.55, 10.4.195.15]
Thread-Topic: ioctl: take use of TST_RETRY_FN* macro
Thread-Index: +h5zzmVv1Rv4K/SCHPbOpIwgw1y8jA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ioctl: take use of TST_RETRY_FN* macro
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
>  static void check_partition(int part_num, bool value)
>  {
> -	int ret;
> +	int ret, time_delay;
>  
>  	sprintf(sys_loop_partpath, "/sys/block/loop%d/loop%dp%d",
>  		dev_num, dev_num, part_num);
>  	sprintf(loop_partpath, "%sp%d", dev_path, part_num);
>  
> -	ret = access(sys_loop_partpath, F_OK);
> +	value ? (time_delay = 30) : (time_delay = 1);
> +
> +	ret = TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_partpath, F_OK),
> TST_RETVAL_EQ0, time_delay);

Shouldn't we invert also the check when value == 0? At the moment
there's TST_RETVAL_EQ0 for all cases, but we expect path to exist
only for value == 1, correct?

diff --git a/testcases/kernel/syscalls/ioctl/ioctl09.c b/testcases/kernel/syscalls/ioctl/ioctl09.c
index 151618df41db..dff31d58a054 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl09.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl09.c
@@ -28,6 +28,9 @@ static void change_partition(const char *const cmd[])
                tst_brk(TBROK, "parted return %i", ret);
 }
 
+#define RETVAL_CHECK(x) \
+       ({ value ? TST_RETVAL_EQ0(x) : TST_RETVAL_NOTNULL(x); })
+
 static void check_partition(int part_num, bool value)
 {
        int ret;
@@ -36,7 +39,7 @@ static void check_partition(int part_num, bool value)
                dev_num, dev_num, part_num);
        sprintf(loop_partpath, "%sp%d", dev_path, part_num);
 
-       ret = access(sys_loop_partpath, F_OK);
+       ret = TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_partpath, F_OK), RETVAL_CHECK, 30);
        if (ret == 0)
                tst_res(value ? TPASS : TFAIL, "access %s succeeds",
                        sys_loop_partpath);
@@ -44,7 +47,7 @@ static void check_partition(int part_num, bool value)
                tst_res(value ? TFAIL : TPASS, "access %s fails",
                        sys_loop_partpath);
 
-       ret = access(loop_partpath, F_OK);
+       ret = TST_RETRY_FN_EXP_BACKOFF(access(loop_partpath, F_OK), RETVAL_CHECK, 30);
        if (ret == 0)
                tst_res(value ? TPASS : TFAIL, "access %s succeeds",
                        loop_partpath);


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
