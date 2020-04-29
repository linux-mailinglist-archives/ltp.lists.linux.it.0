Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 683091BD52C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 08:55:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2616E3C2802
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 08:55:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EE1953C27EE
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 08:55:04 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 374941A01496
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 08:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588143302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eVblD4U7vy6S4+gzde3qcPay4VvPJI6rF52+2i0Ztw=;
 b=VnHEwEWSQni+MT0djltiD44H3kat5Qfo0pi75XLnhj2K+mEOdnbPu6WeRRvHPLpjq9AMrH
 mfq6hBYu+3uI0lDvnjQXUL795cbB/JDM3pOa8Du0H5ZAcNliAOO6YWunFfYsrLLPnWvQv3
 YwZZeUIuvkOtjuikZIyUHk0Y6rEToFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-Lfn6444NOX2sZnOLj7RtyA-1; Wed, 29 Apr 2020 02:54:59 -0400
X-MC-Unique: Lfn6444NOX2sZnOLj7RtyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EFEC800C78;
 Wed, 29 Apr 2020 06:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 942ED600DB;
 Wed, 29 Apr 2020 06:54:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4030E4CA94;
 Wed, 29 Apr 2020 06:54:58 +0000 (UTC)
Date: Wed, 29 Apr 2020 02:54:57 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <797241805.10630970.1588143297978.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200428154727.29206-2-mdoucha@suse.cz>
References: <20200428154727.29206-1-mdoucha@suse.cz>
 <20200428154727.29206-2-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.4]
Thread-Topic: Skip oversleep checks in timer tests under VM
Thread-Index: bHGI46yzaYXUV42HkAs29v+RVxE9gg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Skip oversleep checks in timer tests under
 VM
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
> Timer tests often fail on sleep overrun when LTP is running inside a VM.
> The main cause is usually that the VM doesn't get enough CPU time to wake up
> the test process in time. Disable oversleep tests if tst_is_virt() detects
> any hypervisor.

> BTW, systemd-detect-virt can't detect the PowerPC LPAR hypervisor.

Same with virt-what. We could (in separate patch) add check for
'pseries_platform' (powerpc-utils) output:

# pseries_platform
PowerVM pSeries LPAR

# pseries_platform
PowerNV Host

# pseries_platform
Power KVM pSeries Guest

>  
> +	/*
> +	 * Running tests in VM may cause timing issues, disable upper bound
> +	 * checks if LTP_VM_ENV is set to non-zero.
> +	 */
> +	virt_env = tst_is_virt(VIRT_ANY);

The comment still mentions LTP_VM_ENV. Other than that, I don't have major
objections. Maybe somebody would like to run strict checks on VMs too, but
that's something we could add later with an env. variable.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
