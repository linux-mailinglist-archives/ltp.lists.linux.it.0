Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 569671E3ADD
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:45:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54DC33C3228
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:45:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B0D203C321A
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:45:23 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CDD3F1A013DC
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590565521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O10poVnM8QnUElHePWqidIhhqHfR6Wp3DrF9PLDVeD8=;
 b=WtWLYyQUEsVpcQt5dknOj3N/hJfmQTCTNk4YclBoH9PuSWqfawnmk7XbwTprucxQTbLfli
 JcsK34Qld208JtV/qB/LZPNRhPzzfPPdr+BeRvEIraXVo3PgfMppBfRzKdyLYa1GRrvk9R
 X8nfYKpwgvN3FA7/5w3NAxUsu9POAmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-bGwMWlNoNBWhGXBAnNDbXg-1; Wed, 27 May 2020 03:45:19 -0400
X-MC-Unique: bGwMWlNoNBWhGXBAnNDbXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5E68014D7
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:45:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A701160E1C
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:45:18 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A001518095FF;
 Wed, 27 May 2020 07:45:18 +0000 (UTC)
Date: Wed, 27 May 2020 03:45:18 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <396532423.13763181.1590565518615.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200527031430.22144-2-liwang@redhat.com>
References: <20200527031430.22144-1-liwang@redhat.com>
 <20200527031430.22144-2-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.17]
Thread-Topic: take use of new cgroup API
Thread-Index: OkPxUAlwo7HE3UEhodnGJ/GDW4GtJg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/4] mem: take use of new cgroup API
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

> diff --git a/testcases/kernel/mem/cpuset/cpuset01.c
> b/testcases/kernel/mem/cpuset/cpuset01.c
> index 853f7fe55..cecc4ba86 100644
> --- a/testcases/kernel/mem/cpuset/cpuset01.c
> +++ b/testcases/kernel/mem/cpuset/cpuset01.c
> @@ -51,11 +51,11 @@ static void test_cpuset(void)
>  	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
>  	char mems[BUFSIZ], buf[BUFSIZ];
>  
> -	read_cpuset_files(CPATH, "cpus", buf);
> -	write_cpuset_files(CPATH_NEW, "cpus", buf);
> -	read_cpuset_files(CPATH, "mems", mems);
> -	write_cpuset_files(CPATH_NEW, "mems", mems);
> -	SAFE_FILE_PRINTF(CPATH_NEW "/tasks", "%d", getpid());
> +	read_cpuset_files(PATH_TMP_CG1_CST, "cpus", buf);
> +	write_cpuset_files(PATH_CG1_CST_LTP, "cpus", buf);
> +	read_cpuset_files(PATH_TMP_CG1_CST, "mems", mems);
> +	write_cpuset_files(PATH_CG1_CST_LTP, "mems", mems);

This mixes generic api with cgroup1. It currently relies on implementation
detail of tst_cgroup_mount(), which isn't visible just by looking at this test.

We should make it generic or make it clear that test is for cgroup1 only:

setup()
  if (tst_cgroup_version() != TST_CGROUP_V1)
    TCONF


> diff --git a/testcases/kernel/mem/oom/oom03.c
> b/testcases/kernel/mem/oom/oom03.c
> index ce0b34c31..af3a565ce 100644
> --- a/testcases/kernel/mem/oom/oom03.c
> +++ b/testcases/kernel/mem/oom/oom03.c
> @@ -36,27 +36,26 @@
>  
>  #ifdef HAVE_NUMA_V2
>  
> -static int memcg_mounted;
> -
>  static void verify_oom(void)
>  {
>  #ifdef TST_ABI32
>  	tst_brk(TCONF, "test is not designed for 32-bit system.");
>  #endif
>  
> -	SAFE_FILE_PRINTF(MEMCG_PATH_NEW "/tasks", "%d", getpid());
> -	SAFE_FILE_PRINTF(MEMCG_LIMIT, "%ld", TESTMEM);
> +	tst_cgroup_mem_set_maxbytes(TESTMEM);
>  
>  	testoom(0, 0, ENOMEM, 1);
>  
> -	if (access(MEMCG_SW_LIMIT, F_OK) == -1) {
> +	if ((access(PATH_MEMORY_SW_LIMIT, F_OK) == -1) ||
> +			(access(PATH_MEMORY_SW_MAX, F_OK) == -1)) {

This could be tst_cgroup_mem_swapacct_enabled(), without need for test
to probe specific cgroup[12] files.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
