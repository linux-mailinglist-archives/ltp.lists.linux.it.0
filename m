Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903B56468
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 10:20:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF3B73C104A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 10:20:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1C86E3C0131
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 10:20:00 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7678A1A011F5
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 10:19:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BEC7D308A9E2
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 08:19:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0E2B1001B0E
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 08:19:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A01951806B0E;
 Wed, 26 Jun 2019 08:19:57 +0000 (UTC)
Date: Wed, 26 Jun 2019 04:19:54 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <285629943.30156546.1561537194409.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190626071538.29486-2-liwang@redhat.com>
References: <20190626071538.29486-1-liwang@redhat.com>
 <20190626071538.29486-2-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.205.74, 10.4.195.24]
Thread-Topic: pkey: add test for memory protection keys
Thread-Index: mcrWSoYbjQ6w1cO+mzbgYlmQ42v6ug==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 26 Jun 2019 08:19:57 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] pkey: add test for memory protection keys
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
> +static void setup(void)
> +{
> +	int i, fd;
> +
> +	if (access(PATH_VM_NRHPS, F_OK)) {
> +		tst_res(TINFO, "Huge page is not supported");
> +		size = getpagesize();
> +		no_hugepage = 1;
> +	} else {
> +		int val;
> +
> +		SAFE_FILE_PRINTF(PATH_VM_NRHPS, "%d", 1);

This is still SAFE write, which may trigger TBROK:

# ./pkey01 
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
safe_file_ops.c:301: BROK: Failed to close FILE '/proc/sys/vm/nr_hugepages' at pkey01.c:67: EOPNOTSUPP
safe_macros.c:773: WARN: pkey01.c:91: umount(tmp_pkey) failed: ENOENT
safe_macros.c:184: WARN: pkey01.c:92: rmdir(tmp_pkey) failed: ENOENT

> +
> +		SAFE_FILE_SCANF(PATH_VM_NRHPS, "%d", &val);

safe_file_ops.c:157: BROK: The FILE '/proc/sys/vm/nr_hugepages' ended prematurely at pkey01.c:69

> +		if (val != 1)
> +			tst_brk(TBROK, "nr_hugepages = %d, but expect %d",
> +					val, 1);
> +
> +		size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
> +	}
> +


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
