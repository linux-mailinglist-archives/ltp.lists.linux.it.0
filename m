Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C515AA25
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 14:37:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 838863C25E0
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 14:37:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8E73E3C2074
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:37:57 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id DE473601A79
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581514675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhSEka9d8XgywCseIbsxucNZlM/QUcO1frhT0KUYZjE=;
 b=aHbfeTWZJjv+szdHN2SfEW0jgrnfptiLwGMTFI1G6rtfgmpqPDaRdoz/5IfIUNKIVhTAIw
 uJ0KYs04CbgWSyxN4/yIyYNy6v9GdxE4yXCCAi30k2bqAugsmvA03qIGKSp3pT4t3CjJ08
 xKRamIJI8byrIAVc25GznIfV6dk82W4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-N7b60ZAbMOWzyo4wmw6JcA-1; Wed, 12 Feb 2020 08:37:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 679511005502;
 Wed, 12 Feb 2020 13:37:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FE1660499;
 Wed, 12 Feb 2020 13:37:52 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55D5618095FF;
 Wed, 12 Feb 2020 13:37:52 +0000 (UTC)
Date: Wed, 12 Feb 2020 08:37:52 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1078491624.7198409.1581514672304.JavaMail.zimbra@redhat.com>
In-Reply-To: <1581502051-17240-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <5E43C9A1.8090807@cn.fujitsu.com>
 <1581502051-17240-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.8]
Thread-Topic: aio02: Drop O_DIRECT flag for tmpfs
Thread-Index: zOQc3XZOAT/NKcBj/TPoXmaOlrGM9A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: N7b60ZAbMOWzyo4wmw6JcA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] aio02: Drop O_DIRECT flag for tmpfs
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
> tmpfs doesn't support O_DIRECT flag, drop it. So user still can run aio02
> with different filesystem by mounting specified filesystem on $TMPDIR.
> 
> Also remove unused static value initialization.
> 
> Reviewed-by: Xiao Yang <ice_yangxiao@163.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/io/aio/aio02.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
