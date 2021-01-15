Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A659D2F7E9F
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 15:54:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 713E73C6A0D
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 15:54:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 520463C5441
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 15:54:15 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7965A1000BDC
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 15:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610722453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HU1p/PJBBbTtx0WHYpCDamNgo26TIiN4J6IHXE3d5eM=;
 b=Midijl9HyZ6n4MEQ+IACxiXywf1lw86PGGKtkKA+2ZB4+0lyPWjJmnX1uTVKOwb9w9+I8K
 EsWC28jnQLvNCDhS2eKpLeYiMkMIjzJexBvEH+/JdUvuS2gHTIbinqjkH06h8iF2/NE9Lr
 gdhz7yXSVbMFL3bW6+uRC7CFbhnzjvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-SJH7taBGMhm7fxbz9FPygQ-1; Fri, 15 Jan 2021 09:54:08 -0500
X-MC-Unique: SJH7taBGMhm7fxbz9FPygQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C8A88144E0;
 Fri, 15 Jan 2021 14:54:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0958319C45;
 Fri, 15 Jan 2021 14:54:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9E604BB40;
 Fri, 15 Jan 2021 14:54:05 +0000 (UTC)
Date: Fri, 15 Jan 2021 09:54:05 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Xinpeng Liu <liuxp11@chinatelecom.cn>
Message-ID: <95241263.33332311.1610722445185.JavaMail.zimbra@redhat.com>
In-Reply-To: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>
References: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.11]
Thread-Topic: fs/proc01.c:add known issues
Thread-Index: dEylScizX6M7fbBUTCpgdcRwiHb7fg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/proc01.c:add known issues
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
> Test in ubuntu20.10,there are several failure tests.
> 
> proc01      1  TFAIL  :  proc01.c:396: read failed:
> /proc/self/task/61595/attr/smack/current: errno=EINVAL(22): Invalid argument
> proc01      2  TFAIL  :  proc01.c:396: read failed:
> /proc/self/task/61595/attr/apparmor/prev: errno=EINVAL(22): Invalid argument
> proc01      3  TFAIL  :  proc01.c:396: read failed:
> /proc/self/task/61595/attr/apparmor/exec: errno=EINVAL(22): Invalid argument
> proc01      4  TFAIL  :  proc01.c:396: read failed:
> /proc/self/attr/smack/current: errno=EINVAL(22): Invalid argument
> proc01      5  TFAIL  :  proc01.c:396: read failed:
> /proc/self/attr/apparmor/prev: errno=EINVAL(22): Invalid argument
> proc01      6  TFAIL  :  proc01.c:396: read failed:
> /proc/self/attr/apparmor/exec: errno=EINVAL(22): Invalid argument

I'm OK with ignoring it, but commit log could explain more why we get EINVAL
on read here.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
