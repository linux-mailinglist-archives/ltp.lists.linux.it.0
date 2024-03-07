Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 869DA874665
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Mar 2024 03:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1709780131; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=AcMQ7CrmEeLQQxlh04yT2VNY7xyVJ2+DEC6aeDF6G+U=;
 b=GsMQWC9fKU/XN5syxXF0X5xlyLLpcItZEZd7laB5bF2RS8COVamECWxd0faFI/Jp7tVMA
 aOk+4W2m3OSq2GWagonv1szKr5pNy+ozZLFNqh2X7QkNSAnvfamcg8HjJKyaE78tDFjwh7Q
 gC11QkUrpOBL3F3avTh6DgHnKqeefEo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3EB23D1874
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Mar 2024 03:55:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51C8F3C3320
 for <ltp@lists.linux.it>; Thu,  7 Mar 2024 03:55:22 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=baidu.com (client-ip=111.202.115.85; helo=baidu.com;
 envelope-from=xuwenjie04@baidu.com; receiver=lists.linux.it)
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 232A7600EDC
 for <ltp@lists.linux.it>; Thu,  7 Mar 2024 03:55:18 +0100 (CET)
To: <pvorel@suse.cz>
Date: Thu, 7 Mar 2024 10:55:07 +0800
Message-ID: <20240307025507.55504-1-xuwenjie04@baidu.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240306124638.GB746976@pevik>
References: <20240306124638.GB746976@pevik>
MIME-Version: 1.0
X-Originating-IP: [10.127.73.8]
X-ClientProxiedBy: BJHW-Mail-Ex06.internal.baidu.com (10.127.64.16) To
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43)
X-FEAS-Client-IP: 172.31.51.13
X-FE-Policy-ID: 15:10:21:SYSTEM
X-Spam-Status: No, score=-0.0 required=7.0 tests=DMARC_PASS,SPF_HELO_PASS,
 SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled
 version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] pipe/pipe15.c: Adjust fd check for pipe creation
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
From: Wenjie Xu via ltp <ltp@lists.linux.it>
Reply-To: Wenjie Xu <xuwenjie04@baidu.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > > HI Wenjie, Marius,

> > > > A pipe occupies 2 fds, and considering 3 standard fds,
> > > > we should compare rlim_max with such *2+3 calculated value
> > > > to verify whether the maximum file descriptor configuration
> > > > of the current machine is sufficient.

> > > Indeed, 1024*2+3 is the lowest number which passes with non-default ulimit:

> > > ulimit -n $((1024*2+3)) && ./pipe15

> > > Therefore I merged, thank you!

> > > BTW I wonder how did you encounter this?

> > In my test case, the system ulimit is set to 10240,
> > and the calculated pipe_count is also 10240, causing
> > the EMFILE failure when creating the pipe below.

> +1, thanks for info.
> Is it some embedded distro or a regular widely used distro?
> I'm just curious what kernels are tested by LTP and whether where the
> non-default setup comes from.

> Kind regards,
> Petr

This may come from the modification of the kernel and image 
we maintain ourselves. The basic image is from CentOS 7.6.1810,
and the kernel based on version 5.10.

Regards,
Xu Wenjie

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
