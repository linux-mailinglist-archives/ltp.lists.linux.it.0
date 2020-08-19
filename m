Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213F249E2C
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:37:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D7C43C583F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:37:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3D40E3C04C3
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:37:43 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B69741400BC7
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597840661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlbiIhyY17oJQuoEkflfExCeorIZRygRRkLf7BB6j+w=;
 b=RBRJKYeoI+ess57Clagsy084HnhukPlleTgNzbOXk8B+le+9THkovauIyZEr0cI32/FGm1
 S6VUhsD1v1RSBMvrfdGXVRRKHwAXFPCqRHKGKIqMpFrN/VrOe2Ioq2z70AUdbNKY2+LxKY
 NxV9JMMY2elEus5GlrjA29kum/6fHOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-Ue3jDnlhPGCPJgL1JJSR9w-1; Wed, 19 Aug 2020 08:37:37 -0400
X-MC-Unique: Ue3jDnlhPGCPJgL1JJSR9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A938081F02E;
 Wed, 19 Aug 2020 12:37:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A17BB19C4F;
 Wed, 19 Aug 2020 12:37:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 987EC180B655;
 Wed, 19 Aug 2020 12:37:36 +0000 (UTC)
Date: Wed, 19 Aug 2020 08:37:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1494399286.9212519.1597840656586.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200819083843.26435-1-liwang@redhat.com>
References: <20200819083843.26435-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.16]
Thread-Topic: clock_settime03: change to use CLOCK_REALTIME
Thread-Index: wnPfToUGA4AdXqcFYNKtESzxTPDsag==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] clock_settime03: change to use CLOCK_REALTIME
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> CLOCK_REALTIME_ALARM requires an RTC with alarm support, which may not be
> present on a system. In that case, the kernel will return EOPNOTSUPP, which
> is defined as ENOTSUP in userspace.
> 
> Here use CLOCK_REALTIME instead of the CLOCK_REALTIME_ALARM because we do
> NOT need suspend the SUT during test.
> 
> For issue #712:
>   https://github.com/linux-test-project/ltp/issues/712
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Viresh Kumar<viresh.kumar@linaro.org>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> Cc: Jan Stancek <jstancek@redhat.com>
> Tested-by: Li Wang <liwang@redhat.com>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
