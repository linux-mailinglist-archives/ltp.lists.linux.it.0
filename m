Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B4285DCD
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 13:06:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B99A83C4AEB
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 13:06:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6BEF73C256C
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 13:06:37 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 02693600292
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 13:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602068795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bH+/bE4pT84eoWzGfFtn/PIUrwaLwToVcs7C6qASzlI=;
 b=RlKQC9FEJJVkNly5725DQ47jf+8gEcHWM3HZ3Q0OubIviK2Ltrb31LeYZxoK7j461jHGLZ
 LkohHOUc9LH+/v68Kl759x13y45swS8Fxhz+lzsu3fPcVGxQdmhb25rS+ibi4o6bwEY5H2
 1xlyh2EgbtAp5aWc64qx3/hCjEpDqHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-VTJ6aQsyMvihb2YHXj66sg-1; Wed, 07 Oct 2020 07:06:32 -0400
X-MC-Unique: VTJ6aQsyMvihb2YHXj66sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3552887950B;
 Wed,  7 Oct 2020 11:06:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2962B1002382;
 Wed,  7 Oct 2020 11:06:31 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19A49181A869;
 Wed,  7 Oct 2020 11:06:31 +0000 (UTC)
Date: Wed, 7 Oct 2020 07:06:31 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <888008428.17133303.1602068791070.JavaMail.zimbra@redhat.com>
In-Reply-To: <4bec407cc82038233c8977104ccd03b97ae3fc4c.1602048976.git.viresh.kumar@linaro.org>
References: <4bec407cc82038233c8977104ccd03b97ae3fc4c.1602048976.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.8]
Thread-Topic: syscalls: semop: Increase timeout for semop03
Thread-Index: EumUbnnN2H8JztUJ6lE/rjad8zdsIA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: semop: Increase timeout for semop03
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
Cc: will@kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Sometimes the timeout happens before the signal is received and it
> causes the test to fail with following error:
> 
>  semop03.c:55: TFAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)
> 
> Fix this by increasing the timeout to a sufficiently large value.
> 
> Reported-by: Rachel Sibley <rasibley@redhat.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  testcases/kernel/syscalls/ipc/semop/semop03.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c
> b/testcases/kernel/syscalls/ipc/semop/semop03.c
> index 89603f19d651..3a79ed38a904 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop03.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
> @@ -71,7 +71,7 @@ static void setup(void)
>  	semop_supported_by_kernel(tv);
>  
>  	timeout.type = tv->ts_type;
> -	tst_ts_set_sec(&timeout, 0);
> +	tst_ts_set_sec(&timeout, 2);
>  	tst_ts_set_nsec(&timeout, 10000000);
>  
>  	SAFE_SIGNAL(SIGHUP, sighandler);
> --
> 2.25.0.rc1.19.g042ed3e048af

Acked-by: Jan Stancek <jstancek@redhat.com>

pointer to arm thread:
  https://lore.kernel.org/linux-arm-kernel/20201007053345.4xbyjx4u4ccwkep5@vireshk-i7/T/#t

I see it sporadically on ppc kvm guests too.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
