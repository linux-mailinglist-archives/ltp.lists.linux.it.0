Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A901E3AC7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:41:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B8013C3249
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:41:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B85203C321A
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:40:59 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0CCF9201211
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590565256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMFiMKQKEagjeop1ls9GcnPT1Fiql5SGSiks5e4jJXw=;
 b=PiAJI2ohnNBQT9vr0zD85LTQnp6ZEOJt4XvPVLb2ybilyoc6+V7bGKGgxvGTXUk+HuFhCX
 jl0nB6ByvBV5JmoAC0wyCai+/f+XoGGWtETODUz06yavbDgXZ03wnM08hFmR0VJ689SyqU
 YMvhPDiqlt/88YPy/JwEAR24GaqRZ/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-WHO1_F0OOJGS3PVZhIHTSw-1; Wed, 27 May 2020 03:40:55 -0400
X-MC-Unique: WHO1_F0OOJGS3PVZhIHTSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E7EF107ACCD
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:40:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 081115C1B0
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:40:52 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0197E6B493;
 Wed, 27 May 2020 07:40:52 +0000 (UTC)
Date: Wed, 27 May 2020 03:40:51 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <535677442.13762982.1590565251771.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200527031430.22144-1-liwang@redhat.com>
References: <20200527031430.22144-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.10]
Thread-Topic: add new cgroup test API
Thread-Index: gDjBsJjdCpVOs+MUc/rQ8w8nQk4fIw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
> +void tst_cgroup_mem_set_maxbytes(long memsz)
> +{
> +	tst_cgroup_move_current(TST_CGROUP_MEMCG);

It seems a bit unexpected, that setting a limit also moves current
process to cgroup. If test forks two processes, it has to set maxbytes
twice, to get the desired side-effect.

> +
> +	if (tst_cg_ver & TST_CGROUP_V1)
> +		SAFE_FILE_PRINTF(PATH_CG1_MEM_LTP "/memory.limit_in_bytes", "%ld", memsz);
> +
> +	if (tst_cg_ver & TST_CGROUP_V2)
> +		SAFE_FILE_PRINTF(PATH_TMP_CG2_LTP "/memory.max", "%ld", memsz);
> +}
> +
> +void tst_cgroup_mem_set_maxswap(long memsz)
> +{
> +	tst_cgroup_move_current(TST_CGROUP_MEMCG);
> +
> +	if (tst_cg_ver & TST_CGROUP_V1)
> +		SAFE_FILE_PRINTF(PATH_CG1_MEM_LTP "/memory.memsw.limit_in_bytes", "%ld",
> memsz);
> +	if (tst_cg_ver & TST_CGROUP_V2)
> +		SAFE_FILE_PRINTF(PATH_TMP_CG2_LTP "/memory.swap.max", "%ld", memsz);
> +}
> --
> 2.21.1
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
