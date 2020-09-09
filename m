Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09214262EE5
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 15:06:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3A043C2C0D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 15:06:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 089F93C14F7
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 15:06:25 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 843B620096F
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 15:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599656783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZT/scz/3A5CR8efWN6o2lo+tWRt3HjxV+g2vQBH7GNo=;
 b=aL7Ms8MGfoHyvBLx94oTHRtW85rDJuA/XQcEhfIOmWl7OZdTFriakQdhpeup61Iry/Xgut
 Q+rHeZRk1rUQU4bCCQT3oP238uFeC7dJF7jfPNaZIFr2CVdumE0pDNN2ww3oHAqRmfaRf/
 /RivALM3gCF6uaWZ+T/rcUGP0mmJwhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-ahHFdWatOMyYVlmU7ydPBA-1; Wed, 09 Sep 2020 09:06:21 -0400
X-MC-Unique: ahHFdWatOMyYVlmU7ydPBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60A661017DDA;
 Wed,  9 Sep 2020 13:06:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A92100239A;
 Wed,  9 Sep 2020 13:06:20 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DDA118095FF;
 Wed,  9 Sep 2020 13:06:20 +0000 (UTC)
Date: Wed, 9 Sep 2020 09:06:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1322097859.11602601.1599656780160.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200909125753.7724-1-liwang@redhat.com>
References: <20200909125753.7724-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.193.55, 10.4.195.18]
Thread-Topic: ioctl: take use of TST_RETRY_FN* macro
Thread-Index: kKDx68dq4Ur+nIk4yBrRoSHWBL95Hw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [Patch v2] ioctl: take use of TST_RETRY_FN* macro
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
> To avoid of race with udev, let's use TST_RETRY_FN* macro to loop
> access() function for more times.
> 
> ---Errors---
> ioctl_loop01.c:59: PASS: /sys/block/loop0/loop/partscan = 1
> ioctl_loop01.c:60: PASS: /sys/block/loop0/loop/autoclear = 0
> ioctl_loop01.c:71: FAIL: access /dev/loop0p1 fails
> ioctl_loop01.c:77: FAIL: access /sys/block/loop0/loop0p1 fails
> 
> ioctl09.c:41: PASS: access /sys/block/loop0/loop0p1 succeeds
> ioctl09.c:52: FAIL: access /dev/loop0p1 fails
> 
> Fixes: #718
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Cc: Jan Stancek <jstancek@redhat.com>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
